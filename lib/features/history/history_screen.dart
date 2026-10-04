import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class HistoryScreen extends StatelessWidget { const HistoryScreen({super.key}); @override Widget build(BuildContext context)=>AppScaffold(title:'Riwayat Transaksi',actions:[IconButton(onPressed:(){},icon:const Icon(Icons.tune_rounded))],child:ListView(padding:const EdgeInsets.all(20),children:[
  ...const [
    ('Transfer Saldo Keluar','Ke 0812 9999 0000','- Rp 50.000',Icons.arrow_upward_rounded),('Isi Saldo','VA / Bank','+ Rp 100.000',Icons.add_card_rounded),('Pulsa & Data','0812 3456 7890','- Rp 25.000',Icons.phone_android_rounded),('Transfer Saldo Masuk','Dari 0821 4444 5555','+ Rp 75.000',Icons.arrow_downward_rounded),
  ].map((e)=>Card(child:ListTile(contentPadding:const EdgeInsets.symmetric(horizontal:16,vertical:4),leading:CircleAvatar(child:Icon(e.$4)),title:Text(e.$1,style:const TextStyle(fontWeight:FontWeight.w700)),subtitle:Text(e.$2),trailing:Text(e.$3,style:TextStyle(fontWeight:FontWeight.w800,color:e.$3.startsWith('+')?Colors.green:Colors.red))))),
])); }