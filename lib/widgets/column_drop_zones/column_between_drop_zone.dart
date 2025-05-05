import 'package:flutter/material.dart';
import '../../models/form_element.dart';
import '../../providers/form_provider.dart';

class ColumnBetweenDropZone extends StatelessWidget {
  final int columnIndex;
  final int dropIndex;
  final FormProvider formProvider;

  const ColumnBetweenDropZone({
    super.key,
    required this.columnIndex,
    required this.dropIndex,
    required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<FormElement>(
      hitTestBehavior: HitTestBehavior.translucent,
      builder: (context, candidateItems, rejectedItems) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: candidateItems.isNotEmpty ? 40 : 8,
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
                    size: 16,
                  ),
                )
              : const SizedBox(),
        );
      },
      onAcceptWithDetails: (details) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Add at a specific position 
          formProvider.insertElementInColumnAt(columnIndex, details.data, dropIndex + 1);
        });
      },
    );
  }
} 