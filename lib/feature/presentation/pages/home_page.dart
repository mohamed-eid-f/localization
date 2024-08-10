import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import 'setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home".tr(context)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SettingPage()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${"hello_msg".tr(context)} !",
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const Text(
                "This text will not be translated.",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
