import 'package:flutter/material.dart';
import '../../models/form_element.dart';

class BasicElementsWidget extends StatelessWidget {
  final FormElement element;

  const BasicElementsWidget({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    switch (element.type) {
      case FormElementType.section:
        return _buildSection();
      case FormElementType.heading:
        return _buildHeading();
      case FormElementType.hint:
        return _buildHint();
      case FormElementType.webLink:
        return _buildWebLink();
      case FormElementType.image:
        return _buildImage();
      case FormElementType.file:
        return _buildFile();
      case FormElementType.navigation:
        return _buildNavigation();
      default:
        return const Text('Unknown basic element type');
    }
  }

  Widget _buildSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            element.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Status', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return Text(
      element.label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _buildHint() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              element.label,
              style: TextStyle(color: Colors.blue.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebLink() {
    return InkWell(
      onTap: () {},
      child: Text(
        element.label,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 40, color: Colors.grey.shade400),
            const SizedBox(height: 8),
            Text(element.label, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget _buildFile() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              element.label,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Icon(Icons.download, color: Colors.grey.shade600),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.navigation, color: Colors.red.shade700),
          const SizedBox(width: 8),
          Text(
            element.label,
            style: TextStyle(color: Colors.red.shade700),
          ),
        ],
      ),
    );
  }
} 