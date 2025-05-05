import 'package:flutter/material.dart';
import '../../models/form_element.dart';
import '../draggable_form_element.dart';

class PaletteSectionWidget extends StatelessWidget {
  final String title;
  final List<FormElement> elements;

  const PaletteSectionWidget({
    super.key,
    required this.title,
    required this.elements,
  });

  @override
  Widget build(BuildContext context) {
    if (elements.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 16, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return DraggableFormElement(
              element: elements[index],
              isInPalette: true,
            );
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
} 