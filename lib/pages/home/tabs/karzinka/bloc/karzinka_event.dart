part of 'karzinka_bloc.dart';

@immutable
abstract class KarzinkaEvent {}
 class KarzinkaInitEvent extends KarzinkaEvent{}
 class KarzinkaSeatchEvent extends KarzinkaEvent{
  final String text;

  KarzinkaSeatchEvent(this.text);
 }
 class KarzinkaNextEvent extends KarzinkaEvent{
  final String text;
  KarzinkaNextEvent({this.text=""});
}
