import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';
class SettingsScreen extends StatefulWidget { const SettingsScreen({super.key}); @override State<SettingsScreen> createState()=>_SettingsScreenState(); }
class _SettingsScreenState extends State<SettingsScreen>{ bool biometrics=true; bool notification=true;@override Widget build(BuildContext context)=>AppScaffold(title:'Pengaturan',child:ListView(padding:const EdgeInsets.all(20),children:[
 Card(child:Column(children:[SwitchListTile(value:biometrics,onChanged:(v)=>setState(()=>biometrics=v),title:const Text('Biometrik'),subtitle:const Text('Gunakan sidik jari/biometrik untuk membuka aplikasi')),SwitchListTile(value:notification,onChanged:(v)=>setState(()=>notification=v),title:const Text('Notifikasi'),subtitle:const Text('Terima notifikasi transaksi dan pembaruan'))])),
 const Card(child:ListTile(title:Text('Keamanan'),subtitle:Text('PIN, password, perangkat yang pernah login'))),
 const Card(child:ListTile(title:Text('Tentang aplikasi'),subtitle:Text('SekaliPay Clone 1.0.0'))),
]));}}