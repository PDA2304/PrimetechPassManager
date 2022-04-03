import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:passmanager/data/model/DataInfo.dart';
import 'package:passmanager/data/network_service.dart';
import 'package:passmanager/pages/data_info.dart';

part 'data_info_state.dart';

class DataInfoCubit extends Cubit<DataInfoState> {
  DataInfoCubit() : super(DataInfoInitial());

  var network = NetworkService();

  void dataInfo(int dataId) =>
      network.indexDataInfo(dataId).then((value) => emit(DataInfoLoad(value)));
}
