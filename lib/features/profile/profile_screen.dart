import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/state/app_state.dart';
import '../../core/widgets/app_scaffold.dart';

class ProfileScreen extends ConsumerWidget { const ProfileScreen({super.key}); @override Widget build(BuildContext context,WidgetRef ref){ final a=ref.watch(accountProvider);return AppScaffold(title:'Profil',child:ListView(padding:const EdgeInsets.all(20),children:[
 Card(child:ListTile(leading:const CircleAvatar(radius:28,child:Icon(Icons.person)),title:Text(a.name,style:const TextStyle(fontWeight:FontWeight.w800)),subtitle:Text(a.phone),trailing:const Icon(Icons.chevron_right_rounded))),
 const SizedBox(height:12),
 Card(child:Column(children:[ListTile(leading:const Icon(Icons.devices_rounded),title:const Text('Perangkat'),onTap:(){}),ListTile(leading:const Icon(Icons.settings_outlined),title:const Text('Pengaturan'),onTap:()=>context.push('/settings')),ListTile(leading:const Icon(Icons.storefront_outlined),title:const Text('Merchant'),onTap:()=>context.push('/merchant')),ListTile(leading:const Icon(Icons.account_balance_outlined),title:const Text('Tarik saldo'),onTap:()=>context.push('/disbursement'))])),
 const SizedBox(height:18),OutlinedButton(onPressed:(){ref.read(accountProvider.notifier).logout();context.go('/login');},child:const Text('Keluar')),
]));}}