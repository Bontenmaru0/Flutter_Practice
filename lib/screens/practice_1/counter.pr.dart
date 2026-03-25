import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/shared_assets/custom_drawer.dart';
import '../../models/counter/counter.model.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Counter (Change Notifier Provider)")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: ${countProvider.count}"),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().increment();
              },
              child: Text("+"),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
