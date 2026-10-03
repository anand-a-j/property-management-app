import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class UnitListScreen extends StatelessWidget {
  const UnitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Units'),
      body: Column(
        children: [
          SearchTextField(title: "Search Units", onChanged: (query) {}),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
              itemCount: 0,
              itemBuilder: (context, index) {
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingAddButton(
        title: 'Add Unit',
        onTap: () {
          // Add unit action
        },
      ),
    );
  }
}
