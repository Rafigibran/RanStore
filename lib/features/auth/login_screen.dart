import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/state/app_state.dart';
import '../../core/widgets/app_scaffold.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phone = TextEditingController(text: '081234567890');
  final pin = TextEditingController(text: '123456');

  @override
  void dispose() { phone.dispose(); pin.dispose(); super.dispose(); }

  void submit() {
    ref.read(accountProvider.notifier).login(phone.text);
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Masuk',
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.account_balance_wallet_rounded, size: 42),
                  const SizedBox(width: 10),
                  Text('SekaliPay', style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            const SizedBox(height: 38),
            Text('Selamat datang kembali', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Masuk untuk melanjutkan ke akun dan layanan digital kamu.'),
            const SizedBox(height: 28),
            TextField(controller: phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Nomor HP', prefixIcon: Icon(Icons.phone_outlined))),
            const SizedBox(height: 14),
            TextField(controller: pin, obscureText: true, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'PIN', prefixIcon: Icon(Icons.lock_outline))),
            const SizedBox(height: 22),
            PrimaryButton(label: 'Masuk', onPressed: submit),
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: () => context.push('/otp', extra: phone.text),
              icon: const Icon(Icons.sms_outlined),
              label: const Text('Masuk dengan OTP'),
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(54), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            ),
            const SizedBox(height: 18),
            Center(child: TextButton(onPressed: () => context.push('/register'), child: const Text('Belum punya akun? Daftar'))),
          ],
        ),
      ),
    );
  }
}