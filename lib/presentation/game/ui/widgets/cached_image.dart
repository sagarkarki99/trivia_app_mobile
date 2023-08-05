import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  const CachedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: height, width: width);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ClipRRect(
  //     clipBehavior: Clip.antiAlias,
  //     borderRadius: BorderRadius.circular(borderRadius),
  //     child: CachedNetworkImage(
  //       imageUrl: imageUrl,
  //       width: width,
  //       height: height,
  //       fit: BoxFit.cover,
  //       placeholder: (_, __) => Shimmer.fromColors(
  //         baseColor: AppColors.light.white,
  //         highlightColor: AppColors.light.primary.withOpacity(0.2),
  //         child: Container(
  //           width: width,
  //           height: height,
  //           decoration: BoxDecoration(
  //             color: AppColors.light.white,
  //             borderRadius: BorderRadius.circular(borderRadius),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
