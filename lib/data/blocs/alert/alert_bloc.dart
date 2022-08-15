import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project3y21/domain/domain.dart';

import 'alert_state.dart';

class AlertBloc extends Cubit<AlertState> {
  AlertBloc() : super(const AlertState.loading());

  final BaseRepository _baseRepository = GetIt.instance.get();

  Future fetchAlertInfo() async {
    await clear();
    final distanceAlert = await _baseRepository.getDistanceAlert();
    final colorAlert = await _baseRepository.getColorAlert();
    emit(AlertState(distanceAlert, colorAlert));
  }

  Future clear() async {
    emit(const AlertState.loading());
  }
}
