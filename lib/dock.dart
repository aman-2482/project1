import 'package:flutter/cupertino.dart'; // Import the Cupertino package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dock_controller.dart';
import 'dock_item.dart';

/// Dock widget that displays a list of draggable items.
class Dock extends ConsumerWidget {
  const Dock({super.key, required this.items});

  final List<IconData> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(dockControllerProvider);

    return Padding(

      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.systemGrey6,
        ),
        padding: const EdgeInsets.all(4),
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (index) {
            return DockItem(
              icon: items[index],
              index: index,
            );
          }),
        ),
      ),
    );
  }
}
