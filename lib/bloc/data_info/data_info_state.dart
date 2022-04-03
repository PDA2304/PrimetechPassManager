part of 'data_info_cubit.dart';

@immutable
abstract class DataInfoState {}

class DataInfoInitial extends DataInfoState {}

class DataInfoLoad extends DataInfoState{
  final DataInfo dataInfo;

  DataInfoLoad(this.dataInfo);
}