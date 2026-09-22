import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/new_components/app_horizontal_padding.dart';
import 'package:habitroot/core/new_components/habitroot_appbar.dart';
import 'package:habitroot/features/home/view/dashboard/widgets/dash_app_bar.dart';
import 'package:habitroot/features/home/view/dashboard/widgets/dash_store_link_card.dart';
import 'package:habitroot/features/store/controller/provider/store_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import 'widgets/dash_visit_store_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<StoreProvider>().currentStore;
    return Scaffold(
      appBar: const DashAppBar(),
      body: AppHorizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Grow your business",
              style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            DashStoreLinkCard(
              storeSlug: store?.storeSlug ?? "",
              color: store?.primaryColor ?? "",
            ),
            const SizedBox(height: 20),
            DashVisitStoreButton(
              storeUrl: AppConsts.getStoreLink(store?.storeSlug ?? ""),
            ),
            // Insights
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   spacing: AppConsts.pMedium,
            //   children: [
            //     Expanded(
            //       child: DashInsightCard(title: "Active Products", value: "24"),
            //     ),
            //     Expanded(
            //       child: DashInsightCard(title: "Store Visits", value: "1.2k"),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
