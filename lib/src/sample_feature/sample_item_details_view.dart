import 'package:flutter/material.dart';
import 'package:uit_news/src/sample_feature/sample_item.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({
    super.key, required this.item
  });

  final SampleItem item;

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(item.time),
            const SizedBox(height: 20,),
            Text(item.description),
            Text(item.link),
          ],
        ),
      ),
    );
  }
}
