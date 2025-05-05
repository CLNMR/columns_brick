import 'package:flutter/material.dart';
import '../../models/form_element.dart';

class LayoutElementsWidget extends StatelessWidget {
  final FormElement element;

  const LayoutElementsWidget({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    if (element.type == FormElementType.tab) {
      return _buildTab();
    }
    return const Text('Unknown layout element type');
  }

  Widget _buildTab() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.tab, color: Colors.grey),
          const SizedBox(width: 8),
          Text(element.label),
        ],
      ),
    );
  }
} 