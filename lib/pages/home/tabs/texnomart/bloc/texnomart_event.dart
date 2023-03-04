part of 'texnomart_bloc.dart';

@immutable
abstract class TexnomartEvent {}

class TexnomartInitEvent extends TexnomartEvent {}

class TexnomartNextEvent extends TexnomartEvent {}

class TexnomartSearchEvent extends TexnomartEvent {
  final String text;

  TexnomartSearchEvent(this.text);
}
