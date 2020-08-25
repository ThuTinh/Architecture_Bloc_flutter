part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final ThemeType themeType;
  ChangeTheme({@required this.themeType});
}
