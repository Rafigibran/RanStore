import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../core/widgets/app_scaffold.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Scan QRIS',
      child: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              if (done || capture.barcodes.isEmpty) return;
              final raw = capture.barcodes.first.rawValue;
              if (raw == null || raw.isEmpty) return;
              done = true;
              if (!mounted) return;
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('QR terbaca: $raw)),
              );
            },
          ),
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 240,
              height: 240,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.white, width: 3),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
