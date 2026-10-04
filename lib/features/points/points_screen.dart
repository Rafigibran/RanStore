import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';

class PointsScreen extends StatelessWidget { const PointsScreen({super.key}); @override Widget build(BuildContext context)=>AppScaffold(title:'Poin & Hadiah',child:ListView(padding:const EdgeInsets.all(20),children:[
  Container(padding:const EdgeInsets.all(22),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(22)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Poin Kamu',style:TextStyle(fontWeight:FontWeight.w700)),SizedBox(height:8),Text('840',style:TextStyle(fontSize:34,fontWeight:FontWeight.w900)),SizedBox(height:4),Text('Tukar poin menjadi saldo atau hadiah.')]),
  const SizedBox(height:18),
  Card(child:ListTile(leading:const Icon(Icons.card_giftcard_rounded),title:const Text('Tukar Poin jadi Saldo'),subtitle:const Text('Mulai dari 500 poin'),trailing:const Icon(Icons.chevron_right_rounded),onTap:()=>showDialog(context:context,builder:(_)=>AlertDialog(title:const Text('Tukar Poin'),content:const Text('Demo redemption.'),actions:[TextButton(onPressed:null,child:Text('Tutup'))])))),
  const Card(child:ListTile(leading:Icon(Icons.history_rounded),title:Text('Riwayat poin'),subtitle:Text('Poin masuk, poin hangus, dan redeem'))),
])); }