import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/state/app_state.dart';
import '../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  String _money(int v) => 'Rp ' + v.toString().replaceAllMapped(RegExp(r'(?=(\d{3})+(?!\d))'), (m) => '.');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);
    final visible = ref.watch(balanceVisibilityProvider);
    final actions = [
      ('Isi Saldo', Icons.add_card_outlined, '/balance'),
      ('Transfer', Icons.swap_horiz_rounded, '/transfer'),
      ('Scan QR', Icons.qr_code_scanner_rounded, '/scan'),
      ('QR Saya', Icons.qr_code_rounded, '/my-qr'),
    ];
    return CustomScrollView(slivers: [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
        sliver: SliverToBoxAdapter(child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Halo, ' + account.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4), const Text('Semua kebutuhan digital dalam satu aplikasi.'),
          ])),
          IconButton(onPressed: () => context.push('/notifications'), icon: const Icon(Icons.notifications_none_rounded)),
        ])),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverToBoxAdapter(child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(24)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Saldo Kamu', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: Text(visible ? _money(account.balance) : '••••••••', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800))),
              IconButton(onPressed: () => ref.read(balanceVisibilityProvider.notifier).toggle(), icon: Icon(visible ? Icons.visibility_rounded : Icons.visibility_off_rounded, color: Colors.white)),
            ]),
            const SizedBox(height: 16),
            Row(children: [
              const Icon(Icons.stars_rounded, color: Colors.white),
              const SizedBox(width: 8),
              Text(account.points.toString() + ' Poin', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              const Spacer(),
              TextButton(onPressed: () => context.push('/points'), child: const Text('Lihat poin', style: TextStyle(color: Colors.white))),
            ])
          ]),
        )),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverToBoxAdapter(child: Row(children: actions.map((e) => Expanded(child: InkWell(
          onTap: () => context.push(e.$3),
          borderRadius: BorderRadius.circular(18),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Column(children: [
            Container(width: 54, height: 54, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Icon(e.$2, color: AppTheme.primary)),
            const SizedBox(height: 8), Text(e.$1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          ])),
        ))).toList())),
      ),
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 28, 20, 8), sliver: SliverToBoxAdapter(child: Row(children: [
        Text('Semua Layanan', style: Theme.of(context).textTheme.titleLarge), const Spacer(), TextButton(onPressed: () => context.push('/services'), child: const Text('Lihat Semua')),
      ]))),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverToBoxAdapter(child: Row(children: [
          _ServiceTile(icon: Icons.phone_android_rounded, title: 'Pulsa & Data', onTap: () => context.push('/services')),
          const SizedBox(width: 12),
          _ServiceTile(icon: Icons.receipt_long_rounded, title: 'Tagihan', onTap: () => context.push('/services')),
          const SizedBox(width: 12),
          _ServiceTile(icon: Icons.storefront_rounded, title: 'Merchant', onTap: () => context.push('/merchant')),
        ])),
      ),
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 28, 20, 14), sliver: SliverToBoxAdapter(child: Text('Promo & Aktivitas', style: Theme.of(context).textTheme.titleLarge))),
      SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), sliver: SliverToBoxAdapter(child: Container(
        padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: const Row(children: [Icon(Icons.local_offer_rounded, size: 34), SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Flash Sale', style: TextStyle(fontWeight: FontWeight.w800)), SizedBox(height: 4), Text('Promo produk digital terbaru tersedia di katalog.')]))])),
      ),
    ]);
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({required this.icon, required this.title, required this.onTap});
  final IconData icon; final String title; final VoidCallback onTap;
  @override Widget build(BuildContext context) => Expanded(child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18), child: Container(
    padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
    child: Column(children: [Icon(icon, color: AppTheme.primary, size: 30), const SizedBox(height: 10), Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))]),
  )));
}