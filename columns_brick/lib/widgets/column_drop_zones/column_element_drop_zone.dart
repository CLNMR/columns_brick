import 'package:flutter/material.dart';
import '../../models/form_element.dart';
import '../../providers/form_provider.dart';
import '../form_element_widget.dart';

class ColumnElementDropZone extends StatelessWidget {
  final FormElement element;
  final int columnIndex;
  final int elementIndex;
  final FormProvider formProvider;

  const ColumnElementDropZone({
    super.key,
    required this.element,
    required this.columnIndex,
    required this.elementIndex,
    required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<FormElement>(
      hitTestBehavior: HitTestBehavior.translucent,
      builder: (context, candidateItems, rejectedItems) {
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
                  maxWidth: 200,
                  maxHeight: 80,
                ),
                child: FormElementWidget(
                  key: ValueKey('column_feedback_${columnIndex}_${element.id}'),
                  element: element,
                  onRemove: () {},
                ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.3,
              child: FormElementWidget(
                key: ValueKey('column_placeholder_${columnIndex}_${element.id}'),
                element: element,
                onRemove: () {},
              ),
            ),
            child: FormElementWidget(
              key: ValueKey('column_${columnIndex}_element_${element.id}'),
              element: element,
              onRemove: () => formProvider.removeElementFromColumn(
                columnIndex, 
                element.id,
              ),
            ),
          ),
        );
      },
      // When an element is dropped directly on this element, insert it below
      onAcceptWithDetails: (details) {
        final newElement = details.data;
        
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Insert the new element right after this one
          formProvider.insertElementInColumnAt(columnIndex, newElement, elementIndex + 1);
        });
      },
    );
  }
} 