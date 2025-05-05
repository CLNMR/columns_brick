import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/form_element.dart';
import '../providers/form_provider.dart';
import 'column_drop_zones/column_element_drop_zone.dart';
import 'column_drop_zones/column_between_drop_zone.dart';

class FormDropTargetColumn extends StatelessWidget {
  final int columnIndex;
  final List<FormElement> elements;

  const FormDropTargetColumn({
    super.key,
    required this.columnIndex,
    required this.elements,
  });

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);

    return DragTarget<FormElement>(
      hitTestBehavior: HitTestBehavior.translucent,
      builder: (context, candidateItems, rejectedItems) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: candidateItems.isNotEmpty 
                ? Colors.red.withAlpha(25)
                : const Color(0xFF252525),
            border: Border.all(
              color: candidateItems.isNotEmpty 
                  ? Colors.red 
                  : Colors.grey.shade800,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: elements.isEmpty
              ? const Center(
                  child: Text(
                    'Bausteine in diese Spalte ziehen',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              : _buildColumnContent(context, formProvider),
        );
      },
      onAcceptWithDetails: (details) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          formProvider.addElementToColumn(columnIndex, details.data);
        });
      },
    );
  }
  
  Widget _buildColumnContent(BuildContext context, FormProvider formProvider) {
    return ListView.separated(
      itemCount: elements.length,
      separatorBuilder: (context, index) => ColumnBetweenDropZone(
        columnIndex: columnIndex,
        dropIndex: index,
        formProvider: formProvider,
      ),
      itemBuilder: (context, index) {
        final element = elements[index];
        return ColumnElementDropZone(
          element: element,
          columnIndex: columnIndex,
          elementIndex: index,
          formProvider: formProvider,
        );
      },
    );
  }
} 