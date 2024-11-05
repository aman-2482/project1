import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dock_controller.dart';

/// A draggable item in the dock.
class DockItem extends ConsumerWidget {
  const DockItem({super.key, required this.icon, required this.index});

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dockController = ref.read(dockControllerProvider.notifier);
    final isDragging = ref.watch(selectedIndexProvider) == index;

    return DragTarget<int>(
      onWillAccept: (fromIndex) {
        return fromIndex != index; // Prevent self-reordering
      },
      onAccept: (fromIndex) {
        dockController.reorder(fromIndex, index);
      },
      builder: (context, candidateData, rejectedData) {
        return Draggable<int>(
          data: index,
          feedback: Material(
            color: Colors.transparent,
            child: Transform.scale(
              scale: 1.2,
              child: _buildIconContainer(),
            ),
          ),
          childWhenDragging: Container(),
          onDragStarted: () {
            ref.read(selectedIndexProvider.notifier).state = index;
          },
          onDragEnd: (_) {
            ref.read(selectedIndexProvider.notifier).state = null;
          },
          child: _buildIconContainer(), // Show icon normally
        );
      },
    );
  }

  /// Builds the icon container with animations.
  Widget _buildIconContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      constraints: const BoxConstraints(minWidth: 48), // Fixed width
      height: 48, // Fixed height
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.primaries[icon.hashCode % Colors.primaries.length],
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }
}
