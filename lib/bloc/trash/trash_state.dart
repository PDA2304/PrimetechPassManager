part of 'trash_cubit.dart';

@immutable
abstract class TrashState {
  final bool isSelect;
   bool isPressed = false;

  TrashState(this.isSelect);
}

class TrashInitial extends TrashState {
  TrashInitial(bool isSelect) : super(false) ;
}

class TrashLoad extends TrashState {
  final List<Trash> list;
  final bool isSelect;
  TrashLoad(this.list, {this.isSelect = false}) : super(false);
}

class TrashRequest extends TrashState {
  TrashRequest() : super(false);
}