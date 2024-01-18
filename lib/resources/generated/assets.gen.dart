/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/block.svg
  SvgGenImage get block => const SvgGenImage('assets/icons/block.svg');

  /// File path: assets/icons/comments.svg
  SvgGenImage get comments => const SvgGenImage('assets/icons/comments.svg');

  /// File path: assets/icons/copyTxt.svg
  SvgGenImage get copyTxt => const SvgGenImage('assets/icons/copyTxt.svg');

  /// File path: assets/icons/download.svg
  SvgGenImage get download => const SvgGenImage('assets/icons/download.svg');

  /// File path: assets/icons/downvoteFilled.svg
  SvgGenImage get downvoteFilled =>
      const SvgGenImage('assets/icons/downvoteFilled.svg');

  /// File path: assets/icons/downvoteUnfilled.svg
  SvgGenImage get downvoteUnfilled =>
      const SvgGenImage('assets/icons/downvoteUnfilled.svg');

  /// File path: assets/icons/hide.svg
  SvgGenImage get hide => const SvgGenImage('assets/icons/hide.svg');

  /// File path: assets/icons/reply.svg
  SvgGenImage get reply => const SvgGenImage('assets/icons/reply.svg');

  /// File path: assets/icons/save.svg
  SvgGenImage get save => const SvgGenImage('assets/icons/save.svg');

  /// File path: assets/icons/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/share.svg');

  /// File path: assets/icons/upvoteFilled.svg
  SvgGenImage get upvoteFilled =>
      const SvgGenImage('assets/icons/upvoteFilled.svg');

  /// File path: assets/icons/upvoteUnfilled.svg
  SvgGenImage get upvoteUnfilled =>
      const SvgGenImage('assets/icons/upvoteUnfilled.svg');

  /// File path: assets/icons/volumeOff.svg
  SvgGenImage get volumeOff => const SvgGenImage('assets/icons/volumeOff.svg');

  /// File path: assets/icons/volumeOn.svg
  SvgGenImage get volumeOn => const SvgGenImage('assets/icons/volumeOn.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        block,
        comments,
        copyTxt,
        download,
        downvoteFilled,
        downvoteUnfilled,
        hide,
        reply,
        save,
        share,
        upvoteFilled,
        upvoteUnfilled,
        volumeOff,
        volumeOn
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
