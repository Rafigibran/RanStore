import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_scaffold.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phone});
  final String phone;
  @override State<OtpScreen> createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen> {
  final otp = TextEditingController(text: '123456');
  @override void dispose(){ otp.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => AppScaffold(
    title: 'Verifikasi OTP',
    child: ListView(padding: const EdgeInsets.all(24), children: [
      Text('Kode OTP dikirim ke ${widget.phone}', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8), const Text('Gunakan kode demo 123456.'),
      const SizedBox(height: 24),
      TextField(controller: otp, keyboardType: TextInputType.number, textAlign: TextAlign.center, decoration: const InputDecoration(labelText: 'OTP')),
      const SizedBox(height: 24),
      PrimaryButton(label: 'Verifikasi', onPressed: () => context.go('/home')),
    ]),
  );
}
