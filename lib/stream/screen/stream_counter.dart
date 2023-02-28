import 'package:default_package/stream/view_model/read_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class StreamCounter extends StatefulWidget {
  const StreamCounter({super.key});

  @override
  State<StreamCounter> createState() => _StreamCounterState();
}

class _StreamCounterState extends State<StreamCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Counter Screen'),),
      body: Consumer<CounterViewModel>(
        builder:(context, viewModel, child) {
          return Column(
            children: [
              Center(child: Text(viewModel.counter.toString(),),),
              ElevatedButton(onPressed: (){
                context.read<CounterViewModel>().pauseConterStream();
              }, child: const Text('Pause Stream')),
              ElevatedButton(onPressed: (){
                context.read<CounterViewModel>().resumeConterStream();
              }, child: const Text("Resume Stream")),
              ElevatedButton(onPressed: (){
                context.read<CounterViewModel>().cancelConterStream();
              }, child: const Text("Cancel Stream")),
            ],);
        },),
    );
  }
}