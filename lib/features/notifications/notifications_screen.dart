import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';
class NotificationsScreen extends StatelessWidget { const NotificationsScreen({super.key}); @override Widget build(BuildContext context)=>AppScaffold(title:'Notifikasi',actions:[TextButton(onPressed:(){},child:const Text('Tandai semua'))],child:ListView(padding:const EdgeInsets.all(20),children:[
 const Card(child:ListTile(leading:CircleAvatar(child:Icon(Icons.check_rounded)),title:Text('Transfer Berhasil',style:TextStyle(fontWeight:FontWeight.w800)),subtitle:Text('Transfer saldo kamu berhasil diproses.'))),
 const Card(child:ListTile(leading:CircleAvatar(child:Icon(Icons.campaign_outlined)),title:Text('Promo terbaru',style:TextStyle(fontWeight:FontWeight.w800)),subtitle:Text('Ada penawaran baru di katalog.'))),
]));}