import 'package:flutter/material.dart';
import '../../models/form_element.dart';

class BetweenElementsDropZone extends StatelessWidget {
  final int index;
  final List<FormElement> elements;
  final Function(int, int) onReorder;

  const BetweenElementsDropZone({
    super.key,
    required this.index,
    required this.elements,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<FormElement>(
      hitTestBehavior: HitTestBehavior.translucent,
      builder: (context, candidateItems, rejectedItems) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: candidateItems.isNotEmpty ? 60 : 12,
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: candidateItems.isNotEmpty 
                ? Colors.red.withAlpha(50) 
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: candidateItems.isNotEmpty 
                  ? Colors.red 
                  : Colors.transparent,
              width: candidateItems.isNotEmpty ? 1 : 0,
            ),
          ),
          child: candidateItems.isNotEmpty
              ? Center(
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red.shade400,
                  ),
                )
              : const SizedBox(),
        );
      },
      onAcceptWithDetails: (details) {
        final newElement = details.data;
        
        // If the element is already in the list, we're reordering
        final existingIndex = elements.indexWhere((e) => e.id == newElement.id);
        
        if (existingIndex != -1) {
          // Apply reordering
          int targetIndex = index;
          
          // Adjust the target index if we're moving an element from above to below
          if (existingIndex < targetIndex) {
            targetIndex = index;
          } else {
            targetIndex = index + 1;
          }
          
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onReorder(existingIndex, targetIndex);
          });
        }
        // Handle new elements in the parent widget's onDrop callback
      },
    );
  }
} 