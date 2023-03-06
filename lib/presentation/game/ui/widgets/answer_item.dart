import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/ui_config/animations/scale_animation.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/scale_tap_indicator.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/user_avatar.dart';

class AnswerItem extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback? onSelect;
  final VoidCallback? onSubmit;

  const AnswerItem({
    super.key,
    required this.answer,
    this.isSelected = false,
    required this.onSelect,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoundCubit, RoundState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: ScaleTapDetector(
            onTap: onSelect,
            child: ListTile(
              title: Text(answer),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: isSelected
                      ? BorderSide(color: AppColors.light.grey)
                      : BorderSide.none),
              tileColor: isSelected
                  ? AppColors.light.lightGreen.withOpacity(0.4)
                  : AppColors.light.grey,
              trailing: _buildTrailingWidget(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTrailingWidget() {
    return isSelected
        ? ScaleAnimation(
            child: IconButton(
              icon: const Icon(
                FluentIcons.send_16_filled,
                color: Colors.green,
              ),
              onPressed: onSubmit,
            ),
          )
        : const SizedBox();
  }
}

class AnswerOptionUI extends StatelessWidget {
  final Widget? trailing;
  final Widget? title;
  final Color? tileColor;
  const AnswerOptionUI({
    super.key,
    this.trailing,
    this.title,
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ListTile(
        title: title,
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: AppColors.light.grey),
        ),
        tileColor: tileColor ?? AppColors.light.grey,
        trailing: trailing,
      ),
    );
  }
}

class CorrectAnswerItem extends StatelessWidget {
  final String answer;

  const CorrectAnswerItem({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: AppColors.light.grey),
        ),
        minVerticalPadding: 14,
        trailing: Icon(
          FluentIcons.arrow_autofit_content_20_filled,
          color: Colors.green.withOpacity(0.8),
        ),
        tileColor: AppColors.light.lightGreen,
        title: Text(answer),
      ),
    );
  }
}

class WrongAnswerItem extends StatelessWidget {
  final String answer;

  const WrongAnswerItem({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: AppColors.light.grey),
        ),
        minVerticalPadding: 14,
        trailing: Icon(FluentIcons.arrow_trending_checkmark_20_filled,
            color: AppColors.light.red.withOpacity(0.6)),
        tileColor: AppColors.light.red.withOpacity(0.3),
        title: Text(answer),
      ),
    );
  }
}

class CloseUserAvatar extends StatelessWidget {
  final List<ConnectedUser> users;
  const CloseUserAvatar({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const SizedBox();
    } else if (users.length == 1) {
      return UserAvatar(username: users[0].name);
    } else if (users.length == 2) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserAvatar(username: users[0].name),
          UserAvatar(username: users[1].name)
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserAvatar(username: users[0].name),
          UserAvatar(username: users[1].name),
          CircleAvatar(
            child: Text('+${users.length - 2}'),
          ),
        ],
      );
    }
  }
}
