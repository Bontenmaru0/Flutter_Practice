import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Training List",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(onPressed: () => {Navigator.pop(context)}, icon: Icon(Icons.close))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(title: const Text("Blog"), onTap: () => context.go('/')),
                ListTile(title: const Text("Counter (Change Notifier Provider)"), onTap: () => context.go('/counter'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
