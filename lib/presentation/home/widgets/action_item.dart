import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

class ActionItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData iconData;
  const ActionItem({
    super.key,
    required this.label,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      splashColor: AppColors.light.grey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.light.background,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              size: 36,
              color: AppColors.light.primary,
            ),
            const SizedBox(height: 8.0),
            Text(label)
          ],
        ),
      ),
    );
  }
}
