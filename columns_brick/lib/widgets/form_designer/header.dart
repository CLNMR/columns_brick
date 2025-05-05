import 'package:flutter/material.dart';
import '../../providers/form_provider.dart';
import 'tab_item.dart';

class HeaderWidget extends StatelessWidget {
  final FormProvider formProvider;

  const HeaderWidget({
    super.key,
    required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF323232),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title with edit button
              Row(
                children: [
                  Text(
                    'A1 qdfgsdg Asfgfdsg Asdgbgbzstd Adfgtrs Sfghnrtdsgfdsg',
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.edit,
                    color: Colors.red.shade400,
                    size: 20,
                  ),
                ],
              ),
              // Add tab button
              IconButton(
                icon: const Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  // Add tab functionality
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Tabs
          SizedBox(
            height: 40,
            child: Row(
              children: List.generate(
                formProvider.tabElements.length,
                (index) => TabItemWidget(
                  label: formProvider.tabElements[index].label,
                  isActive: index == formProvider.activeTabIndex,
                  onTap: () => formProvider.setActiveTab(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 