import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State notifier for managing dock items.
class DockController extends StateNotifier<List<IconData>> {
  DockController() : super([
    CupertinoIcons.person,
    CupertinoIcons.chat_bubble,
    CupertinoIcons.camera,
    CupertinoIcons.photo,
    CupertinoIcons.music_house,
  ]);

  /// Reorder items by swapping positions when an item is dragged.
  void reorder(int fromIndex, int toIndex) {
    final updatedItems = List<IconData>.from(state);
    final item = updatedItems.removeAt(fromIndex);
    updatedItems.insert(toIndex, item);
    state = updatedItems;
  }

  /// Add an icon to the dock.
  void addIcon(IconData icon) {
    state = [...state, icon];
  }

  /// Remove an icon from the dock.
  void removeIcon(int index) {
    final updatedItems = List<IconData>.from(state)..removeAt(index);
    state = updatedItems;
  }
}

/// Provider for managing the state of dock items.
final dockControllerProvider = StateNotifierProvider<DockController, List<IconData>>(
      (ref) => DockController(),
);
/// Provider to keep track of the currently dragged item's index.
final selectedIndexProvider = StateProvider<int?>((ref) => null);
