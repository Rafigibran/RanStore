import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class ServicesScreen extends StatelessWidget { const ServicesScreen({super.key}); @override Widget build(BuildContext context)=>AppScaffold(title:'Semua Layanan',child:ListView(padding:const EdgeInsets.all(20),children:[
  const _Header(title:'Semua Kebutuhan Digital',subtitle:'Pulsa, data, tagihan, voucher, dan produk digital.'),
  const SizedBox(height:18),
  ...const [
    ('Pulsa & Data',Icons.phone_android_rounded),('Tagihan',Icons.receipt_long_rounded),('Voucher',Icons.confirmation_num_outlined),('Game',Icons.sports_esports_outlined),('TV & Streaming',Icons.tv_rounded),('Flash Sale',Icons.local_fire_department_rounded)
  ].map((e)=>Card(child:ListTile(leading:Icon(e.$2),title:Text(e.$1),subtitle:const Text('Demo katalog'),trailing:const Icon(Icons.chevron_right_rounded))))
])); }
class _Header extends StatelessWidget{ const _Header({required this.title,required this.subtitle});final String title,subtitle;@override Widget build(BuildContext c)=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(title,style:Theme.of(c).textTheme.titleLarge),const SizedBox(height:6),Text(subtitle)]); }