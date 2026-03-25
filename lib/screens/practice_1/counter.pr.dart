import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/shared_assets/custom_drawer.dart';
import '../../models/practice_1/counter.model.dart';

class CounterCNPScreen extends StatelessWidget {
  const CounterCNPScreen({super.key});

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
