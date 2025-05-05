import 'package:flutter/material.dart';
import '../models/form_element.dart';

class StatusGroupWidget extends StatelessWidget {
  final List<FormElement> statusItems;

  const StatusGroupWidget({
    super.key,
    required this.statusItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Status',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: statusItems.map((statusItem) {
              return Expanded(
                child: _buildStatusItem(statusItem),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(FormElement status) {
    final bool isActive = status.label.contains('1');
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.red : Colors.grey.shade400,
            ),
            child: Center(
              child: Icon(
                isActive ? Icons.question_mark : Icons.question_mark_outlined,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            status.label,
            style: TextStyle(
              color: isActive ? Colors.red : Colors.grey.shade600,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              width: 16,
              height: 2,
              margin: const EdgeInsets.only(top: 2),
              color: Colors.red,
            ),
        ],
      ),
    );
  }
} 