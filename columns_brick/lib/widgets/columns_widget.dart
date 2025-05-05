import 'package:flutter/material.dart';
import '../models/form_element.dart';
import 'form_drop_target_column.dart';

class ColumnsWidget extends StatelessWidget {
  final List<FormElement> columns;

  const ColumnsWidget({
    super.key,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mehrspalten-Layout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormDropTargetColumn(
                  key: ValueKey('column_0_${key.toString()}'),
                  columnIndex: 0, 
                  elements: columns.isNotEmpty 
                      ? columns[0].children 
                      : [],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormDropTargetColumn(
                  key: ValueKey('column_1_${key.toString()}'),
                  columnIndex: 1,
                  elements: columns.isNotEmpty && columns.length > 1 
                      ? columns[1].children 
                      : [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 