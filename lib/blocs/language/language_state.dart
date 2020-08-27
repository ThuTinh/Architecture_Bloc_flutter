part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale locate;

  LanguageState(this.locate) : assert(locate != null);

  @override
  List<Object> get props => [locate];
}
