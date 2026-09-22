import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/utils/snackbar_manager.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class DashStoreLinkCard extends StatelessWidget {
  const DashStoreLinkCard({
    super.key,
    required this.storeSlug,
    required this.color,
  });

  final String storeSlug;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConsts.rMedium),
        border: Border.all(width: 1, color: context.secondaryContainer),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "YOUR STORE LINK",
              style: context.bodyMedium?.copyWith(
                color: context.secondary.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "${AppConsts.storeBaseUrl}$storeSlug",
              style: context.titleMedium?.copyWith(
                color: context.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            _StoreQrCode(link: "${AppConsts.getStoreLink(storeSlug)}"),
            const SizedBox(height: 20),
            Builder(
              builder: (context) {
                return _ShareLinkButton(
                  onPressed: () async {
                    final link = AppConsts.getStoreLink(storeSlug);

                    await Clipboard.setData(ClipboardData(text: link));

                    Snack.success("🔗 Store Link copied to clipboard ");
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StoreQrCode extends StatefulWidget {
  const _StoreQrCode({required this.link});

  final String link;

  @override
  State<_StoreQrCode> createState() => __StoreQrCodeState();
}

class __StoreQrCodeState extends State<_StoreQrCode> {
  @protected
  late QrImage qrImage;

  @override
  void initState() {
    super.initState();

    final qrCode = QrCode(8, QrErrorCorrectLevel.H)
      ..addData('lorem ipsum dolor sit amet');

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: PrettyQrView(
        qrImage: qrImage,
        decoration: PrettyQrDecoration(
          shape: PrettyQrSmoothSymbol(roundFactor: 1, color: context.secondary),
        ),
      ),
    );
  }
}

class _ShareLinkButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ShareLinkButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed();
        },
        icon: Icon(Icons.share, color: context.onPrimary),
        label: Text(
          "Share Link",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.onPrimary,
          ),
        ),
      ),
    );
  }
}
