import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

enum ImageType { network, memory, file, asset }

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.border,
    this.margin,
    this.overlayColor,
    this.image,
    this.file,
    this.backgroundColor,
    this.memoryImage,
    this.width = 56,
    this.height = 56,
    required this.imageType,
    this.applyImageRadius = true,
    this.padding = TSizes.sm,
    this.borderRadius = TSizes.md,
    this.fit = BoxFit.contain,
  });

  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: _buildImageWidget(),
      ),
    );
  }

  Widget _buildImageWidget() {
    switch (imageType) {
      case ImageType.network:
        return _buildNetworkImage();
      case ImageType.memory:
        return _buildMemoryImage();
      case ImageType.file:
        return _buildFileImage();
      case ImageType.asset:
        return _buildAssetImage();
    }
  }

  // ✅ Use Image.network instead of CachedNetworkImage for web
  Widget _buildNetworkImage() {
    if (image == null) return _errorWidget();
    return CachedNetworkImage(
      fit: fit,
      color: overlayColor,

      imageUrl: image!,
      errorWidget: (context, url, error) {
        return _errorWidget();
      },

      progressIndicatorBuilder: (context, url, progress) =>
          TShimmerEffect(width: width, height: height),
    );
  }

  Widget _buildMemoryImage() {
    if (memoryImage == null) return _errorWidget();
    return Image(
      fit: fit,
      image: MemoryImage(memoryImage!),
      color: overlayColor,
      errorBuilder: (context, error, stackTrace) => _errorWidget(),
    );
  }

  Widget _buildFileImage() {
    if (file == null) return _errorWidget();
    return Image(
      fit: fit,
      image: FileImage(file!),
      color: overlayColor,
      errorBuilder: (context, error, stackTrace) => _errorWidget(),
    );
  }

  Widget _buildAssetImage() {
    if (image == null) return _errorWidget();
    return Image(
      fit: fit,
      image: AssetImage(image!),
      color: overlayColor,
      errorBuilder: (context, error, stackTrace) => _errorWidget(),
    );
  }

  // Common error widget
  Widget _errorWidget() {
    return Container(
      color: Colors.grey[200],
      child: const Icon(Icons.broken_image, color: Colors.grey),
    );
  }
}

// ✅ Proper shimmer effect
class TShimmerEffect extends StatefulWidget {
  final double width;
  final double height;
  const TShimmerEffect({super.key, required this.width, required this.height});

  @override
  State<TShimmerEffect> createState() => _TShimmerEffectState();
}

class _TShimmerEffectState extends State<TShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey[300],
      ),
    );
  }
}
