import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/state/app_state.dart';
import '../../core/widgets/app_scaffold.dart';

class TransferScreen extends ConsumerStatefulWidget { const TransferScreen({super.key}); @override ConsumerState<TransferScreen> createState()=>_TransferScreenState(); }
class _TransferScreenState extends ConsumerState<TransferScreen> {
  final recipient = TextEditingController(); final amount = TextEditingController(text: '50000');
  @override void dispose(){ recipient.dispose(); amount.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => AppScaffold(title:'Transfer Saldo', actions:[IconButton(onPressed:()=>context.push('/scan'),icon:const Icon(Icons.qr_code_scanner_rounded))], child:ListView(padding:const EdgeInsets.all(24), children:[
    Text('Kirim saldo',style:Theme.of(context).textTheme.titleLarge), const SizedBox(height:16),
    TextField(controller:recipient,keyboardType:TextInputType.phone,decoration:const InputDecoration(labelText:'Nomor penerima',prefixIcon:Icon(Icons.person_outline))), const SizedBox(height:14),
    TextField(controller:amount,keyboardType:TextInputType.number,decoration:const InputDecoration(prefixText:'Rp ',labelText:'Nominal transfer')), const SizedBox(height:24),
    PrimaryButton(label:'Kirim saldo',onPressed:(){ final v=int.tryParse(amount.text)??0; if(v<=0||v>ref.read(accountProvider).balance){ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Saldo tidak cukup.')));return;} ref.read(accountProvider.notifier).subtractBalance(v); showModalBottomSheet(context:context,builder:(_)=>const Padding(padding:EdgeInsets.all(24),child:Text('Transfer Berhasil',style:TextStyle(fontSize:22,fontWeight:FontWeight.w800))));}),
  ]));
}