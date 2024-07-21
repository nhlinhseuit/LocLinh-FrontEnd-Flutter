import 'package:flutter/material.dart';
import 'package:uit_news/data/data_provier/news_http_provider.dart';
import 'package:uit_news/src/sample_feature/sample_item.dart';

import '../settings/settings_view.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: FutureBuilder(
        builder: (context, snapshot) {
          // if (snapshot.connectionState != ConnectionState.done) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          final items = snapshot.data ?? [];
          if (items.isEmpty) return const Center(child: Text("no data"),);
          return ListView.builder(
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'sampleItemListView',
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = SampleItem.fromMap(items[index]);
          
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.link),
                leading: const CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                ),
                onTap: () {
                  // Navigate to the details page. If the user leaves and returns to
                  // the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.pushNamed(
                    context,
                    SampleItemDetailsView.routeName,
                    arguments: item
                  );
                }
              );
            },
          );
        }, future: PostHTTPAPI().readData(),
      ),
    );
  }
}
