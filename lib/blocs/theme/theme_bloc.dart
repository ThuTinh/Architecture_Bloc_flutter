import 'package:bloc/bloc.dart';
import 'package:demo_bloc/constants/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeBlue());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeTheme) {
      switch (event.themeType) {
        case ThemeType.THEME_BLUE:
          yield ThemeBlue();
          break;
        case ThemeType.THEME_PURE:
          yield ThemePure();
          break;
        default:
          yield ThemeBlue();
      }
    } else {
      throw ArgumentError("invalid event change theme");
    }
  }
}
