import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  const LoadingWidget({super.key, this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 42,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulseRise,
            strokeWidth: 2.0,
            colors: [
              AppColors.light.red,
              AppColors.light.primary,
              Colors.green,
              Colors.blue,
              Colors.brown,
              Colors.pink,
              Colors.amberAccent,
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(message)
      ],
    );
  }
}
