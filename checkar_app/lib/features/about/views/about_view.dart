import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/constants/app_assets.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/about/data/about_data.dart';
import 'package:checkar_app/features/about/widgets/about_feature_tile.dart';
import 'package:checkar_app/features/auth/widgets/auth_app_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: AuthAppBar(
          title: 'About CheckAR',
          showProfileAction: false,
          onBack: () => Get.back(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _AboutHeroCard(),
              const SizedBox(height: 16),
              _SectionCard(
                title: 'What CheckAR does',
                child: Column(
                  children: [
                    for (var i = 0; i < AboutData.features.length; i++)
                      AboutFeatureTile(
                        feature: AboutData.features[i],
                        showDivider: i < AboutData.features.length - 1,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _SectionCard(
                title: 'Legal & support',
                child: Column(
                  children: [
                    for (var i = 0; i < AboutData.links.length; i++)
                      _AboutLinkTile(
                        title: AboutData.links[i].title,
                        showDivider: i < AboutData.links.length - 1,
                        onTap: AboutData.links[i].title == 'Terms of Service'
                            ? () => Get.toNamed(AppRoutes.termsOfService)
                            : null,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                AboutData.copyright,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.greyDark.withValues(alpha: 0.7),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutHeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.paleGrey),
      ),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            AboutData.appName,
            style: TextStyle(
              color: AppColors.navy,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            AboutData.tagline,
            style: TextStyle(
              color: AppColors.teal,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Version ${AboutData.version} (${AboutData.buildNumber})',
            style: TextStyle(
              color: AppColors.greyDark.withValues(alpha: 0.8),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AboutData.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.greyDark,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.navy,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.paleGrey),
          ),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ],
    );
  }
}

class _AboutLinkTile extends StatelessWidget {
  const _AboutLinkTile({
    required this.title,
    this.showDivider = true,
    this.onTap,
  });

  final String title;
  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.navy,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.greyLight,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.paleGrey,
          ),
      ],
    );
  }
}
