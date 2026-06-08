import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';

enum AppNavItem { home, explore, history, settings }

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentItem,
    this.onItemSelected,
  });

  final AppNavItem currentItem;
  final ValueChanged<AppNavItem>? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.paleGrey),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                label: 'Home',
                icon: Icons.home_outlined,
                isActive: currentItem == AppNavItem.home,
                onTap: () => onItemSelected?.call(AppNavItem.home),
              ),
              _NavItem(
                label: 'Explore',
                icon: Icons.location_on_outlined,
                activeIcon: Icons.location_on,
                isActive: currentItem == AppNavItem.explore,
                onTap: () => onItemSelected?.call(AppNavItem.explore),
              ),
              _NavItem(
                label: 'History',
                icon: Icons.history,
                isActive: currentItem == AppNavItem.history,
                onTap: () => onItemSelected?.call(AppNavItem.history),
              ),
              _NavItem(
                label: 'Settings',
                icon: Icons.settings_outlined,
                isActive: currentItem == AppNavItem.settings,
                onTap: () => onItemSelected?.call(AppNavItem.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.isActive,
    this.activeIcon,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final IconData? activeIcon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.teal : AppColors.greyDark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? (activeIcon ?? icon) : icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
