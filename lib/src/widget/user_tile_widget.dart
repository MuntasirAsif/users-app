import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_task/core/constant/padding.dart';
import 'package:interview_task/core/route/route_name.dart';
import 'package:interview_task/core/theme/theme_extension/color_scheme.dart';
import 'package:interview_task/core/theme/theme_extension/text_theme.dart';

import '../feature/model/user_model.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: AppPadding.listItemPadding,
        leading: CircleAvatar(
          radius: 36,
          backgroundColor: context.colorScheme.primary.withValues(alpha: .9),
          child: Text(
            user.name?.substring(0, 1).toUpperCase() ?? 'L',
            style: TextStyle(
              color: context.colorScheme.onPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          user.name ?? 'Loading...',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.verticalSpace,
            Text(
              user.email ?? 'Loading...',
              style: context.textTheme.bodySmall,
            ),
            2.verticalSpace,
            Text(
              user.company?.name ?? 'Loading...',
              style: TextStyle(
                color: context.colorScheme.primary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.r),
        onTap: () {
          context.push(RouteName.userDetailsScreen, extra: user);
        },
      ),
    );
  }
}
