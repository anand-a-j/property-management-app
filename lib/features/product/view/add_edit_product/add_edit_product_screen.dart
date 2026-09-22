import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/new_components/image_upload/image_picker_card.dart';
import 'package:habitroot/core/new_components/image_upload/image_preview_card.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/enum/image_action.dart';
import '../../../../core/enum/image_upload_type.dart';
import '../../../../core/new_components/custom_button.dart';
import '../../../../core/new_components/custom_textformfield.dart';
import '../../../../core/utils/file_cache_helper.dart';
import '../../../../core/utils/image_utils.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../../../storage/controller/storage_service.dart';
import '../../../store/controller/provider/store_provider.dart';
import '../../../user/controller/provider/user_provider.dart';
import '../../controller/provider/product_provider.dart' show ProductProvider;

class AddEditProductScreen extends StatefulWidget {
  final String? productId;
  const AddEditProductScreen({super.key, this.productId});

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _price = TextEditingController();
  final _salePrice = TextEditingController();
  final _desc = TextEditingController();
  final _sortOrder = TextEditingController(text: "0");

  final ValueNotifier<File?> _image = ValueNotifier(null);
  final ValueNotifier<bool> _isImageLoading = ValueNotifier(false);
  final ValueNotifier<bool> _isImageUploadLoading = ValueNotifier(false);
  ImageAction _imageAction = ImageAction.none;

  final StorageService _storage = StorageService();

  String? existingImagePath;

  bool get isEdit => widget.productId != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadProduct();
      });
    }
  }

  Future<void> _loadProduct() async {
    final provider = context.read<ProductProvider>();

    await provider.loadProductDetails(widget.productId!);

    final p = provider.selectedProduct;

    if (p == null) {
      if (mounted) {
        context.pop();
      }
      return;
    }

    final imageUrl = p.imageUrl ?? "";

    if (imageUrl.isNotEmpty) {
      _isImageLoading.value = true;

      final cached = await FileCahceHelper.cacheFile(imageUrl);

      if (cached != null) {
        _image.value = cached;
        _imageAction = ImageAction.none;
      }
      _isImageLoading.value = false;
    }

    _name.text = p.name ?? "";
    _price.text = p.price.toString();
    _salePrice.text = p.salePrice?.toString() ?? "";
    _desc.text = p.description ?? "";
    _sortOrder.text = (p.sortOrder).toString();

    existingImagePath = p.imagePath;
  }

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _salePrice.dispose();
    _desc.dispose();
    _sortOrder.dispose();
    _image.dispose();
    _isImageUploadLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final store = context.read<StoreProvider>().currentStore!;
    final userId = context.read<UserProvider>().user?.id ?? '';

    return FormScaffold(
      appBar: HabitRootAppBar(
        title: isEdit ? "Edit Product ✏️" : "Add Product 🛍",
        leadingOnTap: () => context.pop(),
      ),
      body: provider.isDetailsLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(AppConsts.pSide),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    /// NAME
                    CustomTextField(
                      controller: _name,
                      labelText: "Product Name",
                      hintText: "e.g. Nike Shoes",
                      validator: (v) =>
                          v!.isEmpty ? "Enter product name" : null,
                    ),

                    const SizedBox(height: 16),

                    /// PRICE
                    CustomTextField(
                      controller: _price,
                      labelText: "Price ₹",
                      hintText: "e.g. 999",
                      textInputType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? "Enter price" : null,
                    ),

                    const SizedBox(height: 16),

                    /// SALE PRICE
                    CustomTextField(
                      controller: _salePrice,
                      labelText: "Sale Price (optional)",
                      hintText: "e.g. 799",
                      textInputType: TextInputType.number,
                    ),

                    const SizedBox(height: 16),

                    /// SORT ORDER
                    CustomTextField(
                      controller: _sortOrder,
                      labelText: "Display Order (0 = top)",
                      hintText: "0 = top",
                      textInputType: TextInputType.number,
                    ),

                    const SizedBox(height: 16),

                    /// DESCRIPTION
                    CustomTextField(
                      controller: _desc,
                      labelText: "Product Description",
                      hintText: "Short product details...",
                      maxLines: 3,
                    ),

                    const SizedBox(height: 16),

                    ValueListenableBuilder(
                      valueListenable: _isImageLoading,
                      builder: (context, isImageLoading, child) {
                        return ValueListenableBuilder<File?>(
                          valueListenable: _image,
                          builder: (_, file, __) {
                            if (file != null) {
                              return ImagePreviewCard(
                                file: file,
                                isLoading: isImageLoading,
                                title: "",
                                sizeText: "",
                                onDelete: () {
                                  if (existingImagePath != null) {
                                    _imageAction = ImageAction.removed;
                                  } else {
                                    _imageAction = ImageAction.none;
                                  }

                                  _image.value = null;
                                },
                              );
                            }

                            return ImagePickerCard(onTap: _pickImage);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

      bottomNavigationBar: ColoredBox(
        color: AppColorScheme.scaffoldBackgroundColor,
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _isImageUploadLoading,
            builder: (context, isImageUploading, child) {
              return CustomButton(
                padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
                label: isEdit ? "Update Product" : "Add Product",
                isLoading: provider.isLoading || isImageUploading,
                onPressed: () => _submit(store.id, userId),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final file = await ImageUtils.pickProductImage(source: ImageSource.gallery);

    if (existingImagePath != null) {
      _imageAction = ImageAction.replaced;
    } else {
      _imageAction = ImageAction.added;
    }

    _image.value = file;
  }

  Future<void> _submit(String storeId, String userId) async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final provider = context.read<ProductProvider>();

    String? imageUrl = provider.selectedProduct?.imageUrl;
    String? imagePath = existingImagePath;

    _isImageUploadLoading.value = true;
    switch (_imageAction) {
      case ImageAction.added:
        {
          final res = await _storage.uploadImage(
            file: _image.value!,
            userId: userId,
            storeId: storeId,
            type: ImageUploadType.product,
          );

          if (res.hasError) {
            Snack.error(res.error ?? "Upload failed");
            return;
          }

          imageUrl = res.data!.url;
          imagePath = res.data!.path;
          break;
        }

      case ImageAction.replaced:
        {
          final res = await _storage.replaceImage(
            newFile: _image.value!,
            oldPath: existingImagePath,
            userId: userId,
            storeId: storeId,
            type: ImageUploadType.product,
          );

          if (res.hasError) {
            Snack.error(res.error ?? "Replace failed");
            return;
          }

          imageUrl = res.data!.url;
          imagePath = res.data!.path;
          break;
        }

      case ImageAction.removed:
        {
          if (existingImagePath != null) {
            await _storage.deleteImage(existingImagePath);
          }

          imageUrl = null;
          imagePath = null;
          break;
        }

      case ImageAction.none:
        {
          // Do nothing → keep existing
          break;
        }
    }

    _isImageUploadLoading.value = false;

    /// 🚀 SAVE PRODUCT
    if (isEdit) {
      await provider.updateProduct(
        id: widget.productId!,
        name: _name.text.trim(),
        price: double.tryParse(_price.text) ?? 0.0,
        salePrice: _salePrice.text.isEmpty
            ? null
            : double.tryParse(_salePrice.text),
        description: _desc.text.trim(),
        imageUrl: imageUrl,
        imagePath: imagePath,
        sortOrder: int.tryParse(_sortOrder.text) ?? 0,
      );
    } else {
      await provider.addProduct(
        storeId: storeId,
        name: _name.text.trim(),
        price: double.tryParse(_price.text) ?? 0.0,
        salePrice: _salePrice.text.isEmpty
            ? null
            : double.tryParse(_salePrice.text),
        description: _desc.text.trim(),
        imageUrl: imageUrl,
        imagePath: imagePath,
        sortOrder: int.tryParse(_sortOrder.text) ?? 0,
      );
    }

    if (mounted) {
      provider.loadInitial(storeId);
      context.pop();
    }
  }
}
