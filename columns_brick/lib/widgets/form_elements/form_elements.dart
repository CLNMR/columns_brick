import 'package:flutter/material.dart';
import '../../models/form_element.dart';

class FormElementsWidget extends StatelessWidget {
  final FormElement element;

  const FormElementsWidget({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    switch (element.type) {
      case FormElementType.textField:
        return _buildTextField();
      case FormElementType.number:
        return _buildNumber();
      case FormElementType.switch_:
        return _buildSwitch();
      case FormElementType.dropdown:
        return _buildDropdown();
      case FormElementType.multiSelect:
        return _buildMultiSelect();
      case FormElementType.date:
        return _buildDate();
      case FormElementType.timeRange:
        return _buildTimeRange();
      case FormElementType.timer:
        return _buildTimer();
      case FormElementType.imageUpload:
        return _buildImageUpload();
      case FormElementType.fileUpload:
        return _buildFileUpload();
      case FormElementType.email:
        return _buildEmail();
      case FormElementType.phone:
        return _buildPhone();
      default:
        return const Text('Unknown form element type');
    }
  }

  Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
      ),
      enabled: false,
    );
  }

  Widget _buildNumber() {
    return TextField(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      enabled: false,
    );
  }

  Widget _buildSwitch() {
    return Row(
      children: [
        Text(element.label),
        const Spacer(),
        Switch(value: false, onChanged: null),
      ],
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
      ),
      items: const [],
      onChanged: null,
    );
  }

  Widget _buildMultiSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(element.label),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(3, (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: false, onChanged: null),
                Text('Option ${index + 1}'),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _buildDate() {
    return TextField(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      enabled: false,
    );
  }

  Widget _buildTimeRange() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Von',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.access_time),
            ),
            enabled: false,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Bis',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.access_time),
            ),
            enabled: false,
          ),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    return TextField(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.timer),
      ),
      enabled: false,
    );
  }

  Widget _buildImageUpload() {
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
            Icon(Icons.upload_file, size: 40, color: Colors.grey.shade400),
            const SizedBox(height: 8),
            Text(element.label, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUpload() {
    return ElevatedButton.icon(
      onPressed: null,
      icon: const Icon(Icons.upload_file),
      label: Text(element.label),
    );
  }

  Widget _buildEmail() {
    return TextField(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      enabled: false,
    );
  }

  Widget _buildPhone() {
    return TextField(
      decoration: InputDecoration(
        labelText: element.label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.phone),
      ),
      keyboardType: TextInputType.phone,
      enabled: false,
    );
  }
} 