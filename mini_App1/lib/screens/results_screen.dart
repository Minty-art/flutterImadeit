import 'package:flutter/material.dart';
import '../models/name_entry.dart';

class ResultsScreen extends StatelessWidget {
  final List<NameEntry> names;

  const ResultsScreen({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    final rated = names.where((n) => n.rating != null).toList();
    final sorted = List.of(rated)
      ..sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your ratings'),
      ),
      body: sorted.isEmpty
          ? const Center(child: Text('No names were rated.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sorted.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final entry = sorted[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${entry.rating}'),
                  ),
                  title: Text(entry.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      entry.rating ?? 0,
                      (i) => const Icon(Icons.star, size: 18, color: Colors.amber),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
        label: const Text('Start over'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
