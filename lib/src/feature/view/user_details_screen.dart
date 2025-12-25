import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/core/constant/padding.dart';
import 'package:interview_task/src/feature/model/user_model.dart';
import 'package:interview_task/core/theme/theme_extension/color_scheme.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: AppPadding.screenPadding,
        child: Column(
          children: [
            /// Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: colors.onPrimary.withValues(alpha: .3),
                    child: Text(
                      user.name?.substring(0, 1).toUpperCase() ?? '',
                      style: TextStyle(
                        color: colors.onPrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    user.name ?? '',
                    style: TextStyle(
                      color: colors.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    '@${user.username ?? ''}',
                    style: TextStyle(
                      color: colors.onPrimary.withValues(alpha: .8),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 400.ms).slideX(begin: 0.5, end: 0.0),

            20.verticalSpace,

            /// User Info Card
            _infoCard(
              context,
              title: 'Contact Information',
              children: [
                _infoTile(Icons.email, 'Email', user.email),
                _infoTile(Icons.phone, 'Phone', user.phone),
                _infoTile(Icons.language, 'Website', user.website),
              ],
            ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.5, end: 0.0),

            16.verticalSpace,

            /// Company & Address Card
            _infoCard(
              context,
              title: 'Work & Address',
              children: [
                _infoTile(Icons.business, 'Company', user.company?.name),
                _infoTile(
                  Icons.location_on,
                  'Address',
                  '${user.address?.street ?? ''}, ${user.address?.city ?? ''}',
                ),
              ],
            ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.5, end: 0.0),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final colors = context.colorScheme;

    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: colors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(value ?? '', style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
