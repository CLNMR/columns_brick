import 'package:flutter/material.dart';
import '../../models/form_element.dart';
import '../form_element_widget.dart';

class ElementDropZone extends StatelessWidget {
  final FormElement element;
  final int index;
  final List<FormElement> elements;
  final Function(String) onElementRemoved;
  final Function(int, int) onReorder;
  final Function(FormElement, int) onInsertElementAt;

  const ElementDropZone({
    super.key,
    required this.element,
    required this.index,
    required this.elements,
    required this.onElementRemoved,
    required this.onReorder,
    required this.onInsertElementAt,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<FormElement>(
      hitTestBehavior: HitTestBehavior.translucent,
      builder: (context, candidateItems, rejectedItems) {
        // Build a container that highlights when an element is dragged over it
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: candidateItems.isNotEmpty ? Colors.red : Colors.transparent,
              width: candidateItems.isNotEmpty ? 2 : 0,
            ),
          ),
          child: Draggable<FormElement>(
            data: element,
            maxSimultaneousDrags: 1,
            feedback: Material(
              elevation: 4.0,
              color: Colors.transparent,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 300,
                  maxHeight: 100,
                ),
                child: FormElementWidget(
                  key: ValueKey('drag_feedback_${element.id}'),
                  element: element,
                  onRemove: () {},
                ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.3,
              child: FormElementWidget(
                key: ValueKey('drag_placeholder_${element.id}'),
                element: element,
                onRemove: () {},
              ),
            ),
            child: FormElementWidget(
              key: ValueKey('element_${element.id}'),
              element: element,
              onRemove: () => onElementRemoved(element.id),
            ),
          ),
        );
      },
      // When an element is dropped on this element, insert it below
      onAcceptWithDetails: (details) {
        // Skip if dragging the same element (handled by reordering)
        final newElement = details.data;
        final existingIndex = elements.indexWhere((e) => e.id == newElement.id);
        
        // If it's an existing element, use reordering
        if (existingIndex != -1) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onReorder(existingIndex, index + 1);
          });
          return;
        }
        
        // Otherwise insert the new element right after this one
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onInsertElementAt(newElement, index + 1);
        });
      },
    );
  }
} 