import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';
import 'package:habitroot/features/store/core/utils.dart';
import 'package:habitroot/routes/router_path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/components/core_components.dart';
import '../../../core/constants/constants.dart';
import '../../../core/enum/image_action.dart';
import '../../../core/enum/image_upload_type.dart';
import '../../../core/extension/common.dart';
import '../../../core/new_components/custom_button.dart';
import '../../../core/new_components/custom_textformfield.dart';
import '../../../core/new_components/image_upload/image_picker_card.dart';
import '../../../core/new_components/image_upload/image_preview_card.dart';
import '../../../core/utils/file_cache_helper.dart';
import '../../../core/utils/image_utils.dart';
import '../../../core/utils/snackbar_manager.dart';
import '../../storage/controller/storage_service.dart';
import '../../user/controller/provider/user_provider.dart';
import '../controller/provider/store_provider.dart';
import '../model/store.dart';
import 'widgets/store_color_picker.dart';

class CreateStoreDetailsScreen extends StatefulWidget {
  final String slug;
  final bool isEdit;
  final Store? store;

  const CreateStoreDetailsScreen({
    super.key,
    required this.slug,
    this.isEdit = false,
    this.store,
  });

  @override
  State<CreateStoreDetailsScreen> createState() =>
      _CreateStoreDetailsScreenState();
}

class _CreateStoreDetailsScreenState extends State<CreateStoreDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _descriptionController = TextEditingController();

  final ValueNotifier<File?> _image = ValueNotifier(null);
  final ValueNotifier<bool> _isImageLoading = ValueNotifier(false);
  final ValueNotifier<String> _color = ValueNotifier(AppConsts.defaultHexColor);

  final StorageService _storage = StorageService();

  ImageAction _imageAction = ImageAction.none;

  String? existingImagePath;
  String? existingImageUrl;

  @override
  void initState() {
    super.initState();

    final store = widget.store;

    if (widget.isEdit && store != null) {
      /// ✅ EDIT MODE
      _nameController.text = store.name;
      _whatsappController.text = store.whatsappNumber;
      _descriptionController.text = store.description ?? "";
      _color.value = store.primaryColor;

      existingImageUrl = store.logoUrl;
      existingImagePath = store.logoPath;

      if (existingImageUrl != null && existingImageUrl!.isNotEmpty) {
        _loadExistingImage(existingImageUrl!);
      }
    } else {
      /// ✅ CREATE MODE
      _nameController.text = slugToStoreName(widget.slug);
    }
  }

  Future<void> _loadExistingImage(String url) async {
    _isImageLoading.value = true;

    final file = await FileCahceHelper.cacheFile(url);

    if (file != null) {
      _image.value = file;
      _imageAction = ImageAction.none;
    }

    _isImageLoading.value = false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _whatsappController.dispose();
    _descriptionController.dispose();
    _image.dispose();
    _color.dispose();
    _isImageLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StoreProvider>();

    final storeId = provider.currentStore?.id ?? "";

    final String titleText = widget.isEdit
        ? "Update your shop"
        : "Store details";
    final String subtitleText = widget.isEdit
        ? "Keep your information fresh so customers know what's new."
        : "Add a name and logo to make your store stand out";

    return FormScaffold(
      appBar: HabitRootAppBar(
        title: widget.isEdit ? "Edit Store ✏️" : "Create Store",
        leadingOnTap: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),

              Text(
                titleText,
                style: context.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: Text(
                  subtitleText,
                  style: context.bodyMedium?.copyWith(
                    color: context.secondary.withValues(alpha: 0.5),
                    height: 1.4, // Better readability
                  ),
                ),
              ),
              const SizedBox(height: 32),

              /// NAME
              CustomTextField(
                controller: _nameController,
                labelText: "Your Store Name",
                hintText: "e.g. Amma's Homemade Cakes",
                validator: (v) =>
                    v!.isEmpty ? "Please enter your store name" : null,
              ),

              const SizedBox(height: AppConsts.pSide),

              /// DESCRIPTION
              CustomTextField(
                controller: _descriptionController,
                labelText: "About your store",
                hintText: "e.g. Fresh cakes, snacks & birthday orders",
                maxLines: 3,
              ),

              const SizedBox(height: AppConsts.pSide),

              /// WHATSAPP
              CustomTextField(
                controller: _whatsappController,
                labelText: "WhatsApp Number",
                hintText: "Enter number to receive orders",
                textInputType: TextInputType.phone,
                validator: (v) =>
                    v!.isEmpty ? "Please enter your WhatsApp number" : null,
              ),

              const SizedBox(height: AppConsts.pSide),

              /// COLOR
              ValueListenableBuilder(
                valueListenable: _color,
                builder: (context, color, child) {
                  return StoreColorPicker(
                    initialColor: color,
                    onChanged: (val) => _color.value = val,
                  );
                },
              ),
              const SizedBox(height: AppConsts.pSide),

              /// 🔥 IMAGE SECTION
              ValueListenableBuilder(
                valueListenable: _isImageLoading,
                builder: (context, isLoading, child) {
                  return ValueListenableBuilder<File?>(
                    valueListenable: _image,
                    builder: (_, file, __) {
                      if (file != null) {
                        return Center(
                          child: ImagePreviewCard(
                            file: file,
                            isLoading: isLoading,
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
                          ),
                        );
                      }

                      return Center(
                        child: ImagePickerCard(
                          onTap: _pickImage,
                          label: "Add Store Logo",
                          subTitle: "Upload your business or brand logo",
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      bottomNavigationBar: ColoredBox(
        color: AppColorScheme.scaffoldBackgroundColor,
        child: SafeArea(
          child: CustomButton(
            padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
            label: widget.isEdit ? "Update Store" : "Create Store",
            isLoading: provider.isLoading,
            onPressed: () => _submit(storeId),
          ),
        ),
      ),
    );
  }

  /// 📸 PICK IMAGE
  Future<void> _pickImage() async {
    final file = await ImageUtils.pickStoreLogo(source: ImageSource.gallery);

    if (existingImagePath != null) {
      _imageAction = ImageAction.replaced;
    } else {
      _imageAction = ImageAction.added;
    }

    _image.value = file;
  }

  Future<void> _submit(String? storeId) async {
    print("🟡 SUBMIT START");

    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      print("❌ Form validation failed");
      return;
    }

    final userId = Supabase.instance.client.auth.currentUser?.id;
    print("👤 AUTH USER ID: $userId");

    if (userId == null) {
      print("❌ User not authenticated");
      Snack.error(
        "We couldn't verify your account. Please restart the app and try again.",
      );
      return;
    }

    final provider = context.read<StoreProvider>();

    String? imageUrl = existingImageUrl;
    String? imagePath = existingImagePath;

    bool success = false;

    try {
      print("🚀 FLOW TYPE: ${widget.isEdit ? "EDIT" : "CREATE"}");

      /// =========================
      /// 🆕 CREATE FLOW
      /// =========================
      if (!widget.isEdit) {
        print("🟡 Step 1: Creating store (no image)");

        final store = await provider.createStoreWithoutImage(
          name: _nameController.text.trim(),
          slug: widget.slug,
          whatsapp: _whatsappController.text.trim(),
          primaryColor: _color.value.toString(),
          description: _descriptionController.text.trim(),
        );

        print("🟢 Store create response: $store");

        if (store == null) {
          print("❌ Store creation returned null");
          Snack.error("Store creation failed. Please try again.");
          return;
        }

        final newStoreId = store.id;
        print("🟢 Store ID: $newStoreId");

        print("🟡 Checking provider.currentStore");
        print("👉 currentStore: ${provider.currentStore}");

        if (provider.currentStore == null) {
          print("❌ currentStore is null after creation");
          Snack.error("Store created but not loaded. Please try again.");
          return;
        }

        /// =========================
        /// IMAGE UPLOAD
        /// =========================
        if (_imageAction == ImageAction.added && _image.value != null) {
          print("🟡 Step 2: Uploading image");

          final res = await _storage.uploadImage(
            file: _image.value!,
            userId: userId,
            storeId: newStoreId,
            type: ImageUploadType.storelogo,
          );

          print("🟢 Upload response: ${res.data}");
          print("🔴 Upload error: ${res.error}");

          if (res.hasError) {
            print("❌ Image upload failed");
            Snack.error("Store created, but image upload failed");
          } else {
            imageUrl = res.data!.url;
            imagePath = res.data!.path;

            print("🟢 Image URL: $imageUrl");
            print("🟢 Image PATH: $imagePath");

            /// =========================
            /// UPDATE STORE WITH IMAGE
            /// =========================
            print("🟡 Step 3: Updating store with image");

            final updateRes = await provider.updateStore(
              logoUrl: imageUrl,
              logoPath: imagePath,
            );

            print("🟢 Update result: $updateRes");
          }
        } else {
          print("⚪ No image upload required");
        }

        success = true;
        print("✅ CREATE FLOW SUCCESS");
      }
      /// =========================
      /// ✏️ EDIT FLOW
      /// =========================
      else {
        print("🟡 EDIT FLOW START");

        final currentStoreId = storeId!;
        print("🟢 Store ID: $currentStoreId");

        switch (_imageAction) {
          case ImageAction.added:
            print("🟡 Uploading new image");
            final res = await _storage.uploadImage(
              file: _image.value!,
              userId: userId,
              storeId: currentStoreId,
              type: ImageUploadType.storelogo,
            );

            print("🟢 Upload response: ${res.data}");
            print("🔴 Upload error: ${res.error}");

            if (res.hasError) {
              print("❌ Upload failed");
              Snack.error("Image upload failed");
              return;
            }

            imageUrl = res.data!.url;
            imagePath = res.data!.path;
            break;

          case ImageAction.replaced:
            print("🟡 Replacing image");

            final res = await _storage.replaceImage(
              newFile: _image.value!,
              oldPath: existingImagePath,
              userId: userId,
              storeId: currentStoreId,
              type: ImageUploadType.storelogo,
            );

            print("🟢 Replace response: ${res.data}");
            print("🔴 Replace error: ${res.error}");

            if (res.hasError) {
              print("❌ Replace failed");
              Snack.error("Image replace failed");
              return;
            }

            imageUrl = res.data!.url;
            imagePath = res.data!.path;
            break;

          case ImageAction.removed:
            print("🟡 Removing image");

            if (existingImagePath != null) {
              await _storage.deleteImage(existingImagePath);
              print("🟢 Image deleted");
            }

            imageUrl = null;
            imagePath = null;
            break;

          case ImageAction.none:
            print("⚪ No image change");
            break;
        }

        print("🟡 Updating store (edit)");

        success = await provider.updateStore(
          name: _nameController.text.trim(),
          whatsapp: _whatsappController.text.trim(),
          description: _descriptionController.text.trim(),
          primaryColor: _color.value.toString(),
          logoUrl: imageUrl,
          logoPath: imagePath,
        );

        print("🟢 Update result: $success");
      }

      /// =========================
      /// NAVIGATION
      /// =========================
      print("🟡 Navigation check → success: $success, mounted: $mounted");

      if (success && mounted) {
        print("🚀 Navigating...");

        if (widget.isEdit) {
          context.pop();
        } else {
          context.go(RouterPath.home);
        }
      } else {
        print("❌ Navigation skipped");
      }
    } catch (e, stack) {
      print("💥 SUBMIT ERROR: $e");
      print("📌 STACK TRACE: $stack");

      Snack.error("Something went wrong. Please try again.");
    }

    print("🟡 SUBMIT END");
  }
}