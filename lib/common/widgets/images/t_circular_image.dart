import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.overlayColor,
    this.image,
    this.file,
    this.backgroundColor,
    this.memoryImage,
    this.width = 56,
    this.height = 56,
    this.imageType = ImageType.asset,
    this.padding = TSizes.sm,
    this.fit = BoxFit.cover,
  });

  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? Colors.black
                : Colors.white),
        borderRadius: BorderRadius.circular(width >= height ? width : height),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget? _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(width >= height ? width : height),

      child: imageWidget,
    );
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        fit: fit,
        color: overlayColor,

        imageUrl: image!,
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
        progressIndicatorBuilder: (context, url, progress) =>
            TShimmerEffect(width: width, height: height),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image(fit: fit, image: FileImage(file!), color: overlayColor);
    } else {
      return Container();
    }
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image(fit: fit, image: AssetImage(image!), color: overlayColor);
    } else {
      return Container();
    }
  }
}

class TShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  const TShimmerEffect({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
