import 'package:default_package/stream/repositories/create_await_for.dart';
import 'package:default_package/stream/view_model/read_stream.dart';
import 'package:flutter/material.dart';

class SimpleCounter extends StatelessWidget {
  const SimpleCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: StreamBuilder<int>(
        stream: StreamGenerator.getMyNumber(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data.toString()));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
