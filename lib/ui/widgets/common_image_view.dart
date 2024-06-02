import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:product_show_case/ui/shared/image_path.dart';

class CommonImageView extends StatelessWidget {
  final String? url;
  final String? imagePath;
  final String? svgPath;
  final File? file;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final bool isAvatar;
  final double avatarRadius;

  final Function()? onTap;

  CommonImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.fill,
    this.isAvatar = false,
    this.avatarRadius = 25,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (svgPath != null && svgPath!.isNotEmpty) {
      final icon = SvgPicture.asset(
        svgPath!,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
      return Container(
        height: height,
        width: width,
        child: icon,
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return isAvatar
          ? CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: avatarRadius,
              child: CachedNetworkImage(
                height: height,
                width: width,
                fit: fit,
                imageUrl: url!,
                placeholder: (context, url) => Container(
                  height: 30,
                  width: 30,
                  child: LinearProgressIndicator(
                    color: Colors.grey.shade200,
                    backgroundColor: Colors.grey.shade100,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  ImagePath.placeHolder,
                  height: height,
                  width: width,
                  fit: fit,
                ),
              ),
            )
          : CachedNetworkImage(
              height: height,
              width: width,
              fit: fit,
              imageUrl: url!,
              placeholder: (context, url) => Container(
                height: 30,
                width: 30,
                child: LinearProgressIndicator(
                  color: Colors.grey.shade200,
                  backgroundColor: Colors.grey.shade100,
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                ImagePath.placeHolder,
                height: height,
                width: width,
                fit: fit,
              ),
            );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return Image.asset(
      ImagePath.placeHolder,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
