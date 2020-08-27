import 'package:demo_bloc/screens/login/bloc/login_bloc.dart';
import 'package:demo_bloc/utils/app_localizations.dart';
import 'package:demo_bloc/widgets/dropdown_languages_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  bool value = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  void togleCheckBox() {
    logger.i("user togle checkbox remember me");
    setState(() {
      value = !value;
    });
  }

  // final _navigatorKey = GlobalKey<NavigatorState>();
  // NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFalirue) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${state.err}'),
          backgroundColor: Colors.red,
        ));
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Material(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0, right: 30.0),
                    child: DropdownLanguagesWigets(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: RichText(
                      text: TextSpan(
                          text: "FACI",
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "O",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                  color: Theme.of(context).primaryColor,
                                ))
                          ]),
                    ),
                  ),
                  _emailInput(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  _passwordInput(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  _rememberForgotPass(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buttonLogin(context, state),
                  Text(AppLocalizations.of(context).translate('tab_home')),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }

// khi su sung theme thi khong can phai dung thuoc tinh focusedBorder de chinh mau cuar boder input
  Widget _emailInput(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            // override textfield's icon color when selected
            primaryColor: Theme.of(context).primaryColor,
          ),
          child: TextField(
            // if we custom cursoColor in custom theme we dont need line below
            // cursorColor: Color(bluePrimary),
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).translate('email'),
              prefixIcon: Icon(Icons.mail),
              // suffixIcon: Icon(Icons.email),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Color(bluePrimary), width: 2.0),
              // ),
            ),
          ),
        ));
  }

  Widget _passwordInput(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Theme.of(context).primaryColor,
          ),
          child: TextField(
            // if we custom cursoColor in custom theme we dont need line below
            // cursorColor: Color(bluePrimary),
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).translate('password'),
              prefixIcon: Icon(
                Icons.lock,
              ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Color(bluePrimary), width: 2.0),
              // ),
            ),
          ),
        ));
  }

  Widget _rememberForgotPass(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: togleCheckBox,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: value
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: value
                                ? Icon(
                                    Icons.check,
                                    size: 18.0,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank,
                                    size: 18.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                          ),
                        ),
                        Text(AppLocalizations.of(context)
                            .translate('remember_me')),
                      ],
                    ),
                  ),
                ),
                Text(
                  AppLocalizations.of(context).translate('forgot_pass'),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            )));
  }

  Widget _buttonLogin(BuildContext context, dynamic state) {
    _onLoginButtonPress() {
      logger.i("user press login info");
      logger.w("user press login wraring");
      logger.e("user press login errr");
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPress(
          password: _passwordController.text,
          username: _usernameController.text));
    }

    return Padding(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Theme.of(context).primaryColor,
            ),
            child: Container(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                color: Theme.of(context).primaryColor,
                onPressed:
                    // _navigator.pushAndRemoveUntil(ToDo.route(), (route) => false);

                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => ToDo()));\
                    state is! LoginLoading ? _onLoginButtonPress : null,
                child: Text(
                  AppLocalizations.of(context).translate('login'),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )));
  }
}
