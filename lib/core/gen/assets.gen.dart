/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/heartSelected.svg
  SvgGenImage get heartSelected =>
      const SvgGenImage('assets/icons/heartSelected.svg');

  /// File path: assets/icons/heartUnselected.svg
  SvgGenImage get heartUnselected =>
      const SvgGenImage('assets/icons/heartUnselected.svg');

  /// File path: assets/icons/homeSelected.svg
  SvgGenImage get homeSelected =>
      const SvgGenImage('assets/icons/homeSelected.svg');

  /// File path: assets/icons/homeUnselected.svg
  SvgGenImage get homeUnselected =>
      const SvgGenImage('assets/icons/homeUnselected.svg');

  /// File path: assets/icons/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/icons/lock.svg');

  /// File path: assets/icons/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/icons/moon.svg');

  /// File path: assets/icons/sms.svg
  SvgGenImage get sms => const SvgGenImage('assets/icons/sms.svg');

  /// File path: assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/sun.svg');

  /// File path: assets/icons/userSelected.svg
  SvgGenImage get userSelected =>
      const SvgGenImage('assets/icons/userSelected.svg');

  /// File path: assets/icons/userUnselected.svg
  SvgGenImage get userUnselected =>
      const SvgGenImage('assets/icons/userUnselected.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        heartSelected,
        heartUnselected,
        homeSelected,
        homeUnselected,
        lock,
        moon,
        sms,
        sun,
        userSelected,
        userUnselected
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Birthday.png
  AssetGenImage get birthday =>
      const AssetGenImage('assets/images/Birthday.png');

  /// File path: assets/images/Book Club.png
  AssetGenImage get bookClub =>
      const AssetGenImage('assets/images/Book Club.png');

  /// File path: assets/images/ConnectWithFriends.png
  AssetGenImage get connectWithFriends =>
      const AssetGenImage('assets/images/ConnectWithFriends.png');

  /// File path: assets/images/DarkBirthday.png
  AssetGenImage get darkBirthday =>
      const AssetGenImage('assets/images/DarkBirthday.png');

  /// File path: assets/images/DarkBookClub.png
  AssetGenImage get darkBookClub =>
      const AssetGenImage('assets/images/DarkBookClub.png');

  /// File path: assets/images/DarkExhibition.png
  AssetGenImage get darkExhibition =>
      const AssetGenImage('assets/images/DarkExhibition.png');

  /// File path: assets/images/DarkMeeting.png
  AssetGenImage get darkMeeting =>
      const AssetGenImage('assets/images/DarkMeeting.png');

  /// File path: assets/images/DarkSport.png
  AssetGenImage get darkSport =>
      const AssetGenImage('assets/images/DarkSport.png');

  /// File path: assets/images/Evently_Logo.png
  AssetGenImage get eventlyLogo =>
      const AssetGenImage('assets/images/Evently_Logo.png');

  /// File path: assets/images/Exhibition.png
  AssetGenImage get exhibition =>
      const AssetGenImage('assets/images/Exhibition.png');

  /// File path: assets/images/Meeting.png
  AssetGenImage get meeting => const AssetGenImage('assets/images/Meeting.png');

  /// File path: assets/images/ResetPassword.png
  AssetGenImage get resetPassword =>
      const AssetGenImage('assets/images/ResetPassword.png');

  /// File path: assets/images/Splashbranding.png
  AssetGenImage get splashbranding =>
      const AssetGenImage('assets/images/Splashbranding.png');

  /// File path: assets/images/Sport.png
  AssetGenImage get sport => const AssetGenImage('assets/images/Sport.png');

  /// File path: assets/images/being-creative.png
  AssetGenImage get beingCreative =>
      const AssetGenImage('assets/images/being-creative.png');

  /// File path: assets/images/dark-hot-trending (1).png
  AssetGenImage get darkHotTrending1 =>
      const AssetGenImage('assets/images/dark-hot-trending (1).png');

  /// File path: assets/images/dark_being-creative (3).png
  AssetGenImage get darkBeingCreative3 =>
      const AssetGenImage('assets/images/dark_being-creative (3).png');

  /// File path: assets/images/dark_event_planning.png
  AssetGenImage get darkEventPlanning =>
      const AssetGenImage('assets/images/dark_event_planning.png');

  /// File path: assets/images/dark_sharewithfriends.png
  AssetGenImage get darkSharewithfriends =>
      const AssetGenImage('assets/images/dark_sharewithfriends.png');

  /// File path: assets/images/event_planning.png
  AssetGenImage get eventPlanning =>
      const AssetGenImage('assets/images/event_planning.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/hot-trending.png
  AssetGenImage get hotTrending =>
      const AssetGenImage('assets/images/hot-trending.png');

  /// File path: assets/images/routeLogo.png
  AssetGenImage get routeLogo =>
      const AssetGenImage('assets/images/routeLogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        birthday,
        bookClub,
        connectWithFriends,
        darkBirthday,
        darkBookClub,
        darkExhibition,
        darkMeeting,
        darkSport,
        eventlyLogo,
        exhibition,
        meeting,
        resetPassword,
        splashbranding,
        sport,
        beingCreative,
        darkHotTrending1,
        darkBeingCreative3,
        darkEventPlanning,
        darkSharewithfriends,
        eventPlanning,
        google,
        hotTrending,
        routeLogo
      ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
