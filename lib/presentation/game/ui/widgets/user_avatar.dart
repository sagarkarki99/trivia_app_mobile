import 'package:flutter/material.dart';

import 'package:trivia_app/presentation/game/ui/widgets/cached_image.dart';
import 'package:trivia_app/presentation/ui_config/animations/scale_animation.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final Color? color;
  final double radius;
  final String username;
  final String? imageUrl;
  final VoidCallback? onTap;

  const UserAvatar({
    Key? key,
    required this.username,
    this.color,
    this.imageUrl,
    this.onTap,
    this.radius = 18.0,
  }) : super(key: key);

  bool get isValidImageUrl =>
      imageUrl != null &&
      imageUrl!.trim().isNotEmpty &&
      imageUrl!.startsWith('http');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ScaleAnimation(
        child: CircleAvatar(
          radius: radius,
          backgroundColor: color ?? AppColors.light.primary,
          child: isValidImageUrl
              ? CachedImage(
                  imageUrl: imageUrl!,
                  width: radius * 2,
                  height: radius * 2,
                  borderRadius: radius * 2,
                )
              : Text(
                  GetInitials.getInitials(username),
                ),
        ),
      ),
    );
  }
}

class GetInitials {
  static String getInitials(String string) {
    String result = '';
    List<String> words = string.split(" ");
    for (final word in words) {
      if (word.trim().isNotEmpty && result.length < 2) {
        result += word[0].trim();
      }
    }

    return result.trim().toUpperCase();
  }
}
