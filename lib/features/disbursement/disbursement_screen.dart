import 'package:flutter/material.dart';
import '../../core/widgets/app_scaffold.dart';
class DisbursementScreen extends StatefulWidget { const DisbursementScreen({super.key}); @override State<DisbursementScreen> createState()=>_DisbursementScreenState(); }
class _DisbursementScreenState extends State<DisbursementScreen>{ String channel='Bank'; final amount=TextEditingController(text:'100000'); @override void dispose(){amount.dispose();super.dispose();}
@override Widget build(BuildContext context)=>AppScaffold(title:'Tarik Saldo',child:ListView(padding:const EdgeInsets.all(20),children:[
 const Text('Transfer ke Bank / E-Wallet',style:TextStyle(fontSize:22,fontWeight:FontWeight.w800)),const SizedBox(height:8),const Text('Fitur demo untuk alur penarikan saldo.'),const SizedBox(height:20),
 SegmentedButton<String>(segments:const [ButtonSegment(value:'Bank',label:Text('Bank'),icon:Icon(Icons.account_balance_outlined)),ButtonSegment(value:'E-Wallet',label:Text('E-Wallet'),icon:Icon(Icons.wallet_outlined))],selected:{channel},onSelectionChanged:(v)=>setState(()=>channel=v.first)),const SizedBox(height:16),
 TextField(controller:amount,keyboardType:TextInputType.number,decoration:const InputDecoration(prefixText:'Rp ',labelText:'Nominal penarikan')),const SizedBox(height:20),
 FilledButton(onPressed:(){showDialog(context:context,builder:(_)=>AlertDialog(title:const Text('Permintaan dibuat'),content:Text('Demo ' + channel + ' Rp ' + amount.text + '.'),actions:[TextButton(onPressed:()=>Navigator.pop(context),child:const Text('Tutup'))]));},child:const Text('Lanjutkan'))
]));}