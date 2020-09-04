import 'package:demo_bloc/blocs/language/language_bloc.dart';
import 'package:demo_bloc/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownLanguagesWigets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropdownLanguagesWigets();
  }
}

class _DropdownLanguagesWigets extends State<DropdownLanguagesWigets> {
  List<LanguagesSuport> _languagesSuports =
      LanguagesSuports.getLanguagesSuports();
  List<DropdownMenuItem<LanguagesSuport>> _dropdownMenuItems;
  LanguagesSuport _languageSelected;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdonwnMenuItems();
    initLanguageSelect();
    super.initState();
  }

  initLanguageSelect() {
    String languageCode =
        BlocProvider.of<LanguageBloc>(context).state.locate.languageCode;
    print(languageCode);
    for (var i = 0; i < _languagesSuports.length; i++) {
      if (languageCode ==
          _languagesSuports[i]
              .languageCode
              .toString()
              .toLowerCase()
              .split('.')[1]
              .toLowerCase()) {
        _languageSelected = _languagesSuports[i];
        return;
      }
    }
  }

  buildDropdonwnMenuItems() {
    List<DropdownMenuItem<LanguagesSuport>> result = List();
    for (var language in _languagesSuports) {
      result.add(DropdownMenuItem(
        child: Text(language.name),
        value: language,
      ));
    }
    return result;
  }

  onChangeLanguage(LanguagesSuport lang) {
    setState(() {
      _languageSelected = lang;
    });
    BlocProvider.of<LanguageBloc>(context)
        .add(LanguageSelected(languageCode: lang.languageCode));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropdownButton(
      items: _dropdownMenuItems,
      onChanged: onChangeLanguage,
      value: _languageSelected,
    ));
  }
}

class LanguagesSuport {
  final String name;
  final Language languageCode;
  LanguagesSuport(this.name, this.languageCode);
}

class LanguagesSuports {
  static List<LanguagesSuport> getLanguagesSuports() {
    return [
      LanguagesSuport("English", Language.EN),
      LanguagesSuport("Filand", Language.FI),
      LanguagesSuport("Estonia", Language.ET),
    ];
  }
}
