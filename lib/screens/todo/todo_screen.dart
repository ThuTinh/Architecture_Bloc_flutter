import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/blocs/theme/theme_bloc.dart';
import 'package:demo_bloc/constants/common.dart';
import 'package:demo_bloc/screens/comments/comments_screen.dart';
import 'package:demo_bloc/screens/todo/bloc/todo_bloc.dart';
import 'package:demo_bloc/screens/todo/widgets/todo_Item.dart';
import 'package:demo_bloc/utils/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDo();
  }
}

class _ToDo extends State<ToDo> {
  ThemeType _themeType;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).add(GetTodos(userId: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logoutPressButton() {
      BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
    }

    _showDialogChangeTheme(BuildContext context) {
      setState(() {
        _themeType = BlocProvider.of<ThemeBloc>(context).state is ThemeBlue
            ? ThemeType.THEME_BLUE
            : ThemeType.THEME_PURE;
      });

      // erro cant not change value in radio
      // showDialog(
      //   context: context,
      //   child: SimpleDialog(
      //     title: Text("Choose theme"),
      //     children: [
      //       Row(
      //         children: [
      //           Radio(
      //               value: ThemeType.THEME_BLUE,
      //               groupValue: _themeType,
      //               onChanged: (value) {
      //                 BlocProvider.of<ThemeBloc>(context)
      //                     .add(ChangeTheme(themeType: ThemeType.THEME_BLUE));
      //                 setState(() {
      //                   _themeType = ThemeType.THEME_BLUE;
      //                 });
      //                 print('theme type THEME_BLUE ne $_themeType');
      //               }),
      //           Text("Blue theme")
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Radio(
      //               value: ThemeType.THEME_PURE,
      //               groupValue: _themeType,
      //               onChanged: (value) {
      //                 BlocProvider.of<ThemeBloc>(context)
      //                     .add(ChangeTheme(themeType: ThemeType.THEME_PURE));
      //                 setState(() {
      //                   _themeType = ThemeType.THEME_PURE;
      //                 });

      //                 print('theme type  THEME_PURE ne $_themeType');
      //               }),
      //           Text("Pure theme")
      //         ],
      //       )
      //     ],
      //   ),
      // );

// fix change radio can change
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Chang theme"),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      children: [
                        Radio<ThemeType>(
                          value: ThemeType.THEME_BLUE,
                          groupValue: _themeType,
                          onChanged: (ThemeType value) {
                            setState(() => _themeType = value);
                            BlocProvider.of<ThemeBloc>(context).add(
                                ChangeTheme(themeType: ThemeType.THEME_BLUE));
                          },
                        ),
                        Text("Blue theme")
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ThemeType>(
                          value: ThemeType.THEME_PURE,
                          groupValue: _themeType,
                          onChanged: (ThemeType value) {
                            setState(() => _themeType = value);
                            BlocProvider.of<ThemeBloc>(context).add(
                                ChangeTheme(themeType: ThemeType.THEME_PURE));
                          },
                        ),
                        Text("Pure theme")
                      ],
                    )
                  ]);
                },
              ),
            );
          });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          AppLocalizations.of(context).translate('title_todo'),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                print(value);
                switch (value) {
                  case "CHANGE_THEME":
                    _showDialogChangeTheme(context);
                    break;
                  case "LOGOUT":
                    _logoutPressButton();
                    break;
                  default:
                }
              },
              itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      value: "CHANGE_THEME",
                      child: Text("Change theme"),
                    ),
                    PopupMenuItem(
                      value: "LOGOUT",
                      child: Text(
                        "Logout",
                      ),
                    ),
                  ]),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is GetTodoSucess) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => ToDoItem(
                  todo: state.todos[index],
                ),
                itemCount: state.todos.length,
              )),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                width: MediaQuery.of(context).size.width / 2,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentsScreen(),
                          settings: RouteSettings(arguments: "HELLO NE")),
                    );

                    // final snackBar = SnackBar(content: Text("Hello, world"));
                    // _scaffoldKey.currentState.removeCurrentSnackBar();
                    // _scaffoldKey.currentState.showSnackBar(snackBar);
                    Scaffold.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text("${result ?? "no"}")));
                  },
                  child: Text(
                    "Advance",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          );
        } else {
          if (state is GetToDoFail)
            return Container(
              alignment: Alignment.center,
              color: Colors.deepPurple,
              child: Text(
                state.message,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
