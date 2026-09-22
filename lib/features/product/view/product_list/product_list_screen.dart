import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/new_components/app_horizontal_padding.dart';
import 'package:habitroot/core/new_components/search_textfield.dart';
import 'package:habitroot/features/product/view/product_list/widgets/add_product_button.dart';
import 'package:habitroot/features/product/view/product_list/widgets/product_card.dart';
import 'package:habitroot/features/product/view/product_list/widgets/product_empty_view.dart';
import 'package:provider/provider.dart';

import '../../../store/controller/provider/store_provider.dart';
import '../../controller/provider/product_provider.dart';
import 'widgets/load_more_button.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late String storeId;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    storeId = context.read<StoreProvider>().currentStore?.id ?? "";
    Future.microtask(() {
      if (mounted) {
        if (storeId.isNotEmpty) {
          context.read<ProductProvider>().loadInitial(storeId);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return RefreshIndicator(
      onRefresh: () {
        return context.read<ProductProvider>().refresh(
          context.read<StoreProvider>().currentStore?.id ?? "",
        );
      },
      child: Scaffold(
        appBar: const HabitRootAppBar(title: "Products"),
        body: AppHorizontalPadding(
          child: Column(
            children: [
              SearchTextField(
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();

                  _debounce = Timer(const Duration(milliseconds: 400), () {
                    if (storeId.isNotEmpty) {
                      provider.search(storeId, value);
                    }
                  });
                },
              ),
              const SizedBox(height: AppConsts.pSide),

              /// LIST
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.products.isEmpty
                    ? const ProductEmptyView()
                    : ListView.separated(
                        itemCount:
                            provider.products.length +
                            (provider.hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == provider.products.length) {
                            /// LOAD MORE BUTTON
                            return provider.isLoadingMore
                                ? const Center(
                                    child: SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : LoadMoreButton(
                                    onTap: provider.isLoadingMore
                                        ? null
                                        : () {
                                            provider.loadMore(storeId);
                                          },
                                  );
                            // return Padding(
                            //   padding: const EdgeInsets.all(12),
                            //   child: ElevatedButton(
                            //     onPressed: provider.isLoadingMore
                            //         ? null
                            //         : () => provider.loadMore(storeId),
                            //     child: provider.isLoadingMore
                            //         ? const CircularProgressIndicator()
                            //         : const Text("Load more"),
                            //   ),
                            // );
                          }

                          final product = provider.products[index];

                          return ProductListCard(
                            key: ValueKey(product.id),
                            product: product,
                          );
                        },
                        separatorBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Divider(
                            thickness: 0.8,
                            color: context.secondaryContainer,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: const AddProductButton(),
      ),
    );
  }
}
