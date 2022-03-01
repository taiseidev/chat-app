import 'package:chatapp/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendList extends ConsumerWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsStreamProvider);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                '友達一覧',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: items.when(
                data: (items) {
                  print(items.length);
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: SizedBox(
                            child: Text(
                              item.userId,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          trailing: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff58BBD2),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (error, stack) => Center(
                  child: Text(
                    '通知予定のタスクを取得できませんでした。\n${error.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                loading: () => const CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
