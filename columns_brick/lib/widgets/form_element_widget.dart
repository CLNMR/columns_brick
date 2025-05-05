import 'package:flutter/material.dart';
import '../models/form_element.dart';
import 'columns_widget.dart';
import 'status_group_widget.dart';
import 'form_elements/basic_elements.dart';
import 'form_elements/form_elements.dart';
import 'form_elements/layout_elements.dart';

class FormElementWidget extends StatelessWidget {
  final FormElement element;
  final VoidCallback onRemove;

  const FormElementWidget({
    super.key,
    required this.element,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // Use a direct mapping instead of a switch to avoid potential linting issues
    Widget elementWidget;
    
    // Basic elements
    if ([
      FormElementType.section,
      FormElementType.heading,
      FormElementType.hint,
      FormElementType.webLink,
      FormElementType.image,
      FormElementType.file,
      FormElementType.navigation,
    ].contains(element.type)) {
      elementWidget = BasicElementsWidget(element: element);
    }
    // Form elements
    else if ([
      FormElementType.textField,
      FormElementType.number,
      FormElementType.switch_,
      FormElementType.dropdown,
      FormElementType.multiSelect,
      FormElementType.date,
      FormElementType.timeRange,
      FormElementType.timer,
      FormElementType.imageUpload,
      FormElementType.fileUpload,
      FormElementType.email,
      FormElementType.phone,
    ].contains(element.type)) {
      elementWidget = FormElementsWidget(element: element);
    }
    // Layout elements
    else if (element.type == FormElementType.columns) {
      elementWidget = ColumnsWidget(
        key: ValueKey('columns_${element.id}'),
        columns: element.children,
      );
    } else if (element.type == FormElementType.statusGroup) {
      elementWidget = StatusGroupWidget(
        key: ValueKey('status_group_${element.id}'),
        statusItems: element.children,
      );
    } else if (element.type == FormElementType.tab) {
      elementWidget = LayoutElementsWidget(element: element);
    }
    // Default case
    else {
      elementWidget = const Text('Unknown element type');
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: elementWidget),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
} 