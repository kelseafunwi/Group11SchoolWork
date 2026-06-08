import 'package:flutter/material.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/explore/data/explore_data.dart';
import 'package:checkar_app/core/widgets/main_tab_header.dart';
import 'package:checkar_app/features/explore/widgets/explore_map_placeholder.dart';
import 'package:checkar_app/features/explore/widgets/mechanic_shop_card.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    final mapHeight = MediaQuery.sizeOf(context).height * 0.34;

    return ColoredBox(
      color: AppColors.offWhite,
      child: Column(
        children: [
          const MainTabHeader(title: 'Nearby mechanics'),
          SizedBox(
            height: mapHeight,
            child: const ExploreMapPlaceholder(),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              children: [
                const Text(
                  'Mechanics near you',
                  style: TextStyle(
                    color: AppColors.navy,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                ...ExploreData.nearbyMechanics.map(
                  (shop) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: MechanicShopCard(shop: shop),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
