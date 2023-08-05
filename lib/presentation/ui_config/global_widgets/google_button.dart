import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/scale_tap_indicator.dart';
import 'package:trivia_app/presentation/ui_config/theme_extensions.dart';

class GoogleButton extends StatelessWidget {
  final Function()? onPressed;

  const GoogleButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTapDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 48.0,
            maxWidth: 336.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: AppColors.light.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/google_logo.svg',
                height: 16,
                width: 16,
              ),
              const SizedBox(width: 4.0),
              Text(
                'Sign in with Google',
                style: context.theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
