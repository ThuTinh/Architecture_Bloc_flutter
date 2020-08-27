import 'package:bloc/bloc.dart';
import 'package:demo_bloc/constants/common.dart';
import 'package:demo_bloc/services/shared_preferences_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale('en', 'US')));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is LanguageLoadStarted) {
      yield* _mapLanguageLoadStartedToState();
    } else if (event is LanguageSelected) {
      yield* _mapLanguageSelectedToState(event.languageCode);
    }
  }

  Stream<LanguageState> _mapLanguageLoadStartedToState() async* {
    final sharedPrefService = await SharedPreferencesService.instance;

    final defaultLanguageCode = sharedPrefService.languageCode;
    Locale locale;

    if (defaultLanguageCode == null) {
      locale = Locale('en', 'US');
      await sharedPrefService.setLanguage(locale.languageCode);
    } else {
      locale = Locale(defaultLanguageCode);
    }

    yield LanguageState(locale);
  }

  Stream<LanguageState> _mapLanguageSelectedToState(
      Language selectedLanguage) async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    // final defaultLanguageCode = sharedPrefService.languageCode;

// && defaultLanguageCode != LanguageKeys.az
    if (selectedLanguage == Language.ET) {
      yield* _loadLanguage(sharedPrefService, 'et', 'EE');
    } else if (selectedLanguage == Language.EN) {
      yield* _loadLanguage(sharedPrefService, 'en', 'US');
    } else {
      if (selectedLanguage == Language.FI) {
        yield* _loadLanguage(sharedPrefService, 'fi', 'FI');
      }
    }
  }

  /// This method is added to reduce code repetition.
  Stream<LanguageState> _loadLanguage(
      SharedPreferencesService sharedPreferencesService,
      String languageCode,
      String countryCode) async* {
    final locale = Locale(languageCode, countryCode);
    await sharedPreferencesService.setLanguage(locale.languageCode);
    yield LanguageState(locale);
  }
}
