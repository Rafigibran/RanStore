import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';
class MerchantScreen extends StatelessWidget { const MerchantScreen({super.key}); @override Widget build(BuildContext context)=>AppScaffold(title:'Merchant',child:ListView(padding:const EdgeInsets.all(20),children:[
  Container(padding:const EdgeInsets.all(22),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(22)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Merchant Dashboard',style:TextStyle(fontSize:22,fontWeight:FontWeight.w800)),SizedBox(height:8),Text('Pantau pembayaran, saldo merchant, aktivitas, dan penarikan.')]),
  const SizedBox(height:16),
  ...const [('Ringkasan',Icons.dashboard_outlined),('Pembayaran',Icons.payments_outlined),('Aktivitas',Icons.timeline_rounded),('Kabar & Pembaruan',Icons.campaign_outlined),('Penarikan',Icons.account_balance_wallet_outlined)].map((e)=>Card(child:ListTile(leading:Icon(e.$2),title:Text(e.$1),trailing:const Icon(Icons.chevron_right_rounded))))
]));}