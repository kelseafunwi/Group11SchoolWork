import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/core/widgets/app_header_back_button.dart';

enum AppHeaderVariant { light, dark }

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.showBackButton = true,
    this.showProfileAction = false,
    this.variant = AppHeaderVariant.light,
  });

  final String title;
  final VoidCallback? onBack;
  final bool showBackButton;
  final bool showProfileAction;
  final AppHeaderVariant variant;

  bool get _isDark => variant == AppHeaderVariant.dark;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final overlayStyle = _isDark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          );

    return AppBar(
      systemOverlayStyle: overlayStyle,
      backgroundColor: _isDark ? Colors.transparent : AppColors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leadingWidth: showBackButton ? 56 : 16,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Center(
                child: AppHeaderBackButton(
                  style: _isDark
                      ? AppHeaderBackButtonStyle.dark
                      : AppHeaderBackButtonStyle.light,
                  onPressed: onBack ?? () => Navigator.of(context).maybePop(),
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: _isDark ? AppColors.white : AppColors.navy,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
        ),
      ),
      actions: [
        if (showProfileAction)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.offWhite,
              child: const Icon(
                Icons.person_outline,
                color: AppColors.navy,
                size: 20,
              ),
            ),
          )
        else
          const SizedBox(width: 16),
      ],
      flexibleSpace: _isDark
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.navy,
                    AppColors.navy.withValues(alpha: 0.92),
                  ],
                ),
              ),
            )
          : null,
      bottom: _isDark
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                color: AppColors.paleGrey.withValues(alpha: 0.9),
              ),
            ),
    );
  }
}
