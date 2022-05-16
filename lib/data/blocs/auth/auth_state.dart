import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authorized(ProfileDto profileDto) =
      AuthStateAuthorized;
  const factory AuthState.unAuthorized() = AuthStateUnAuthorized;
}
