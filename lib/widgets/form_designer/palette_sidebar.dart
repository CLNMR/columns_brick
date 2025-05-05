import 'package:flutter/material.dart';
import '../../models/form_element.dart';
import '../../providers/form_provider.dart';
import '../draggable_form_element.dart';
import 'palette_section.dart';

class PaletteSidebarWidget extends StatelessWidget {
  final FormProvider formProvider;

  const PaletteSidebarWidget({
    super.key,
    required this.formProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Make the sidebar a bit wider to accommodate 3 elements per row
      color: const Color(0xFF3A3A3A),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic elements
            PaletteSectionWidget(
              title: 'BASIS',
              elements: formProvider.paletteElements
                .where((e) => [
                  FormElementType.section, 
                  FormElementType.heading, 
                  FormElementType.hint,
                  FormElementType.webLink,
                  FormElementType.image,
                  FormElementType.file,
                  FormElementType.navigation,
                ].contains(e.type))
                .toList()
            ),
            
            // Form elements
            PaletteSectionWidget(
              title: 'FORMULAR',
              elements: formProvider.paletteElements
                .where((e) => ![
                  FormElementType.section, 
                  FormElementType.heading, 
                  FormElementType.hint,
                  FormElementType.webLink,
                  FormElementType.image,
                  FormElementType.file,
                  FormElementType.navigation,
                  FormElementType.columns,
                  FormElementType.tab,
                  FormElementType.statusGroup,
                ].contains(e.type))
                .toList()
            ),
            
            // Layout elements
            PaletteSectionWidget(
              title: 'LAYOUT',
              elements: formProvider.paletteElements
                .where((e) => [
                  FormElementType.columns,
                  FormElementType.statusGroup,
                ].contains(e.type))
                .toList()
            ),
          ],
        ),
      ),
    );
  }
} 