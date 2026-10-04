import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/state/app_state.dart';
import '../../core/widgets/app_scaffold.dart';

class BalanceScreen extends ConsumerStatefulWidget {
  const BalanceScreen({super.key});
  @override ConsumerState<BalanceScreen> createState() => _BalanceScreenState();
}
class _BalanceScreenState extends ConsumerState<BalanceScreen> {
  final amount = TextEditingController(text: '100000');
  @override void dispose(){ amount.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => AppScaffold(
    title: 'Isi Saldo',
    child: ListView(padding: const EdgeInsets.all(24), children: [
      Text('Nominal isi saldo', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 10),
      TextField(controller: amount, keyboardType: TextInputType.number, decoration: const InputDecoration(prefixText: 'Rp ', labelText: 'Masukkan nominal isi saldo')),
      const SizedBox(height: 18),
      Wrap(spacing: 10, runSpacing: 10, children: [10000,50000,100000,250000,500000].map((v) => ActionChip(label: Text('Rp $v'), onPressed: () => amount.text = '$v')).toList()),
      const SizedBox(height: 28),
      PrimaryButton(label: 'Lanjutkan', onPressed: () { ref.read(accountProvider.notifier).addBalance(int.tryParse(amount.text) ?? 0); context.pop(); }),
      const SizedBox(height: 22), const Text('Demo: tidak ada pembayaran nyata yang diproses.'),
    ]),
  );
}
