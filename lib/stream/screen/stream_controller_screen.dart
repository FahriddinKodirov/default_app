import 'package:default_package/stream/view_model/stream_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamControllerScreen extends StatefulWidget {
  const StreamControllerScreen({super.key});

  @override
  State<StreamControllerScreen> createState() => _StreamControllerScreenState();
}

class _StreamControllerScreenState extends State<StreamControllerScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Controller'),),
      body: Consumer<StreamControllerModel>(
        builder:(context, viewModel, child) {
          return Column(
            children: [
              Center(child: Text('Name: ${viewModel.name}'),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none
                    ),
                    onChanged: (value) {
                      // context.read<StreamControllerModel>().addToStream(value);
                    },
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<StreamControllerModel>().addToStream(nameController.text);
              }, child: const Text('Add Name'))
            ],);
        },),
    );
  }
}