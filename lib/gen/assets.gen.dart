/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/home_black_24dp.svg
  String get homeBlack24dp => 'assets/icons/home_black_24dp.svg';

  /// File path: assets/icons/ic_arrow_down.svg
  String get icArrowDown => 'assets/icons/ic_arrow_down.svg';

  /// File path: assets/icons/ic_arrow_left.svg
  String get icArrowLeft => 'assets/icons/ic_arrow_left.svg';

  /// File path: assets/icons/ic_arrow_right.svg
  String get icArrowRight => 'assets/icons/ic_arrow_right.svg';

  /// File path: assets/icons/ic_arrow_up.svg
  String get icArrowUp => 'assets/icons/ic_arrow_up.svg';

  /// File path: assets/icons/ic_device_selected.svg
  String get icDeviceSelected => 'assets/icons/ic_device_selected.svg';

  /// File path: assets/icons/ic_device_unselected.svg
  String get icDeviceUnselected => 'assets/icons/ic_device_unselected.svg';

  /// File path: assets/icons/ic_home_selected.svg
  String get icHomeSelected => 'assets/icons/ic_home_selected.svg';

  /// File path: assets/icons/ic_home_unselected.svg
  String get icHomeUnselected => 'assets/icons/ic_home_unselected.svg';

  /// File path: assets/icons/ic_settings_selected.svg
  String get icSettingsSelected => 'assets/icons/ic_settings_selected.svg';

  /// File path: assets/icons/ic_settings_unselected.svg
  String get icSettingsUnselected => 'assets/icons/ic_settings_unselected.svg';

  /// File path: assets/icons/ic_voice_selected.svg
  String get icVoiceSelected => 'assets/icons/ic_voice_selected.svg';

  /// File path: assets/icons/ic_voice_unselected.svg
  String get icVoiceUnselected => 'assets/icons/ic_voice_unselected.svg';

  /// File path: assets/icons/logo_3y21.png
  AssetGenImage get logo3y21 =>
      const AssetGenImage('assets/icons/logo_3y21.png');

  /// File path: assets/icons/wifi.svg
  String get wifi => 'assets/icons/wifi.svg';

  /// File path: assets/icons/wifi_off.svg
  String get wifiOff => 'assets/icons/wifi_off.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ESP32_new.png
  AssetGenImage get eSP32New =>
      const AssetGenImage('assets/images/ESP32_new.png');

  /// File path: assets/images/round_home_black_24dp.png
  AssetGenImage get roundHomeBlack24dp =>
      const AssetGenImage('assets/images/round_home_black_24dp.png');
}

class $AssetsSoundsGen {
  const $AssetsSoundsGen();

  /// File path: assets/sounds/s_alarm.mp3
  String get sAlarm => 'assets/sounds/s_alarm.mp3';
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSoundsGen sounds = $AssetsSoundsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale = 1.0,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;
}
