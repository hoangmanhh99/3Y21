import 'package:freezed_annotation/freezed_annotation.dart';
part 'alert_state.freezed.dart';

@freezed
abstract class AlertState with _$AlertState {
  const factory AlertState(double distance, String color) = AlertStateData;
  const factory AlertState.loading() = AlertStateLoading;
  const factory AlertState.error(dynamic error) = AlertStateError;
}