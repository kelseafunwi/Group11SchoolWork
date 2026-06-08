import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:checkar_app/core/navigation/app_navigator.dart';
import 'package:checkar_app/core/routes/app_routes.dart';
import 'package:checkar_app/core/theme/app_colors.dart';
import 'package:checkar_app/features/auth/widgets/app_bottom_nav_bar.dart';
import 'package:checkar_app/features/history/data/history_data.dart';
import 'package:checkar_app/features/history/widgets/history_card.dart';
import 'package:checkar_app/features/history/widgets/history_empty_state.dart';
import 'package:checkar_app/features/history/widgets/history_filter_bar.dart';
import 'package:checkar_app/core/widgets/main_tab_header.dart';
import 'package:checkar_app/features/home/models/diagnosis_item.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  HistoryFilter _selectedFilter = HistoryFilter.all;

  bool get _hasHistory => HistoryData.maintenanceHistory.isNotEmpty;

  List<DiagnosisItem> get _filteredItems {
    if (_selectedFilter == HistoryFilter.all) {
      return HistoryData.maintenanceHistory;
    }
    return HistoryData.maintenanceHistory
        .where((item) => item.status.historyFilter == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _hasHistory ? AppColors.offWhite : AppColors.white,
      child: Column(
        children: [
          const MainTabHeader(title: 'History'),
          if (_hasHistory) ...[
            const SizedBox(height: 16),
            HistoryFilterBar(
              selectedFilter: _selectedFilter,
              onFilterSelected: (filter) {
                setState(() => _selectedFilter = filter);
              },
            ),
            const SizedBox(height: 16),
          ],
          Expanded(
            child: _hasHistory ? _buildPopulatedContent() : _buildEmptyContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children: [
        HistoryEmptyState(
          onStartDiagnosis: () => AppNavigator.selectTab(
            AppNavItem.home,
            currentItem: AppNavItem.history,
          ),
        ),
      ],
    );
  }

  Widget _buildPopulatedContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children: [
        ..._filteredItems.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HistoryCard(
              item: item,
              onTap: () => Get.toNamed(
                AppRoutes.historyDetail,
                arguments: item,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
