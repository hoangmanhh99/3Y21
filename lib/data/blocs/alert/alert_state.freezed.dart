// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alert_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlertStateTearOff {
  const _$AlertStateTearOff();

  AlertStateData call(double distance, String color) {
    return AlertStateData(
      distance,
      color,
    );
  }

  AlertStateLoading loading() {
    return const AlertStateLoading();
  }

  AlertStateError error(dynamic error) {
    return AlertStateError(
      error,
    );
  }
}

/// @nodoc
const $AlertState = _$AlertStateTearOff();

/// @nodoc
mixin _$AlertState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double distance, String color) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AlertStateData value) $default, {
    required TResult Function(AlertStateLoading value) loading,
    required TResult Function(AlertStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertStateCopyWith<$Res> {
  factory $AlertStateCopyWith(
          AlertState value, $Res Function(AlertState) then) =
      _$AlertStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlertStateCopyWithImpl<$Res> implements $AlertStateCopyWith<$Res> {
  _$AlertStateCopyWithImpl(this._value, this._then);

  final AlertState _value;
  // ignore: unused_field
  final $Res Function(AlertState) _then;
}

/// @nodoc
abstract class $AlertStateDataCopyWith<$Res> {
  factory $AlertStateDataCopyWith(
          AlertStateData value, $Res Function(AlertStateData) then) =
      _$AlertStateDataCopyWithImpl<$Res>;
  $Res call({double distance, String color});
}

/// @nodoc
class _$AlertStateDataCopyWithImpl<$Res> extends _$AlertStateCopyWithImpl<$Res>
    implements $AlertStateDataCopyWith<$Res> {
  _$AlertStateDataCopyWithImpl(
      AlertStateData _value, $Res Function(AlertStateData) _then)
      : super(_value, (v) => _then(v as AlertStateData));

  @override
  AlertStateData get _value => super._value as AlertStateData;

  @override
  $Res call({
    Object? distance = freezed,
    Object? color = freezed,
  }) {
    return _then(AlertStateData(
      distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AlertStateData implements AlertStateData {
  const _$AlertStateData(this.distance, this.color);

  @override
  final double distance;
  @override
  final String color;

  @override
  String toString() {
    return 'AlertState(distance: $distance, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertStateData &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  $AlertStateDataCopyWith<AlertStateData> get copyWith =>
      _$AlertStateDataCopyWithImpl<AlertStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double distance, String color) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(distance, color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return $default?.call(distance, color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(distance, color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AlertStateData value) $default, {
    required TResult Function(AlertStateLoading value) loading,
    required TResult Function(AlertStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class AlertStateData implements AlertState {
  const factory AlertStateData(double distance, String color) =
      _$AlertStateData;

  double get distance;
  String get color;
  @JsonKey(ignore: true)
  $AlertStateDataCopyWith<AlertStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertStateLoadingCopyWith<$Res> {
  factory $AlertStateLoadingCopyWith(
          AlertStateLoading value, $Res Function(AlertStateLoading) then) =
      _$AlertStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlertStateLoadingCopyWithImpl<$Res>
    extends _$AlertStateCopyWithImpl<$Res>
    implements $AlertStateLoadingCopyWith<$Res> {
  _$AlertStateLoadingCopyWithImpl(
      AlertStateLoading _value, $Res Function(AlertStateLoading) _then)
      : super(_value, (v) => _then(v as AlertStateLoading));

  @override
  AlertStateLoading get _value => super._value as AlertStateLoading;
}

/// @nodoc

class _$AlertStateLoading implements AlertStateLoading {
  const _$AlertStateLoading();

  @override
  String toString() {
    return 'AlertState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AlertStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double distance, String color) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AlertStateData value) $default, {
    required TResult Function(AlertStateLoading value) loading,
    required TResult Function(AlertStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AlertStateLoading implements AlertState {
  const factory AlertStateLoading() = _$AlertStateLoading;
}

/// @nodoc
abstract class $AlertStateErrorCopyWith<$Res> {
  factory $AlertStateErrorCopyWith(
          AlertStateError value, $Res Function(AlertStateError) then) =
      _$AlertStateErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$AlertStateErrorCopyWithImpl<$Res> extends _$AlertStateCopyWithImpl<$Res>
    implements $AlertStateErrorCopyWith<$Res> {
  _$AlertStateErrorCopyWithImpl(
      AlertStateError _value, $Res Function(AlertStateError) _then)
      : super(_value, (v) => _then(v as AlertStateError));

  @override
  AlertStateError get _value => super._value as AlertStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(AlertStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AlertStateError implements AlertStateError {
  const _$AlertStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AlertState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $AlertStateErrorCopyWith<AlertStateError> get copyWith =>
      _$AlertStateErrorCopyWithImpl<AlertStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double distance, String color) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double distance, String color)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AlertStateData value) $default, {
    required TResult Function(AlertStateLoading value) loading,
    required TResult Function(AlertStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AlertStateData value)? $default, {
    TResult Function(AlertStateLoading value)? loading,
    TResult Function(AlertStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AlertStateError implements AlertState {
  const factory AlertStateError(dynamic error) = _$AlertStateError;

  dynamic get error;
  @JsonKey(ignore: true)
  $AlertStateErrorCopyWith<AlertStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
