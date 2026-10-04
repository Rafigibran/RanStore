import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/widgets/app_scaffold.dart';

class MyQrScreen extends StatelessWidget { const MyQrScreen({super.key}); @override Widget build(BuildContext context)=>AppScaffold(title:'QR Saya',child:Center(child:Container(padding:const EdgeInsets.all(24),margin:const EdgeInsets.all(24),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(28)),child:Column(mainAxisSize:MainAxisSize.min,children:[const Text('QR Saya',style:TextStyle(fontSize:24,fontWeight:FontWeight.w800)),const SizedBox(height:18),QrImageView(data:'sekalipay://user/081234567890',size:240),const SizedBox(height:14),const Text('Bagikan QR ini agar pengguna lain dapat mengirim saldo kepadamu.')])))); }