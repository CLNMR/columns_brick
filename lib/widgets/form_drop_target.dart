import 'package:flutter/material.dart';
import '../models/form_element.dart';
import 'form_element_widget.dart';
import 'form_drop_zones/element_drop_zone.dart';
import 'form_drop_zones/between_elements_drop_zone.dart';

class FormDropTarget extends StatelessWidget {
  final List<FormElement> elements;
  final Function(FormElement) onElementAdded;
  final Function(String) onElementRemoved;
  final Function(int, int) onReorder;

  const FormDropTarget({
    super.key,
    required this.elements,
    required this.onElementAdded,
    required this.onElementRemoved,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<FormElement>(
      hitTestBehavior: HitTestBehavior.translucent,
      builder: (context, candidateItems, rejectedItems) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: candidateItems.isNotEmpty 
                ? Colors.red.withAlpha(25)
                : const Color(0xFF1E1E1E),
            border: Border.all(
              color: candidateItems.isNotEmpty ? Colors.red : Colors.grey.shade800,
              width: 2,
            ),
          ),
          child: elements.isEmpty
              ? const Center(
                  child: Text(
                    'Ziehe Bausteine hierher',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : _buildListContent(context),
        );
      },
      onAcceptWithDetails: (details) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onElementAdded(details.data);
        });
      },
    );
  }
  
  Widget _buildListContent(BuildContext context) {
    return ListView.separated(
      itemCount: elements.length,
      separatorBuilder: (context, index) => BetweenElementsDropZone(
        index: index,
        elements: elements,
        onReorder: onReorder,
      ),
      itemBuilder: (context, index) {
        final element = elements[index];
        return ElementDropZone(
          element: element,
          index: index,
          elements: elements,
          onElementRemoved: onElementRemoved,
          onReorder: onReorder,
          onInsertElementAt: _insertElementAt,
        );
      },
    );
  }
  
  // Helper method to insert elements at specific positions
  void _insertElementAt(FormElement element, int index) {
    // Add element at the end first
    onElementAdded(element);
    
    // Then reorder it to the desired position if not at the end
    if (index < elements.length - 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onReorder(elements.length - 1, index);
      });
    }
  }
} 