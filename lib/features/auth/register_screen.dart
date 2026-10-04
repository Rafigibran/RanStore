import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_scaffold.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final pass = TextEditingController();
  @override void dispose(){ name.dispose(); phone.dispose(); pass.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => AppScaffold(
    title: 'Daftar',
    child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Buat akun baru', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Lengkapi data dasar untuk membuat akun demo.'),
        const SizedBox(height: 28),
        TextField(controller: name, decoration: const InputDecoration(labelText: 'Nama lengkap')),
        const SizedBox(height: 14),
        TextField(controller: phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Nomor HP')),
        const SizedBox(height: 14),
        TextField(controller: pass, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Lanjutkan', onPressed: () => context.push('/otp', extra: phone.text)),
      ],
    ),
  );
}
