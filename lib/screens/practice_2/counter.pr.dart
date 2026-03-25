import 'package:flutter/material.dart';
import '../../widgets/shared_assets/custom_drawer.dart';

class CounterVNScreen extends StatelessWidget {
  const CounterVNScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> counter = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(title: const Text("Counter (Value Notifier)")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, _) {
                return Text("Counter: ${counter.value}");
              },
            ),
            SizedBox(width: 8,),
            ElevatedButton(
              onPressed: () => {counter.value++},
              child: const Text("+"),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
