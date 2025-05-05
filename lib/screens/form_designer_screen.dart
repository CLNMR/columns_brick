import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';
import '../widgets/form_drop_target.dart';
import '../widgets/form_designer/header.dart';
import '../widgets/form_designer/palette_sidebar.dart';

class FormDesignerScreen extends StatelessWidget {
  const FormDesignerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(
      builder: (context, formProvider, child) {
        return Scaffold(
          body: Column(
            children: [
              // Header with title and tabs
              HeaderWidget(formProvider: formProvider),
              
              // Main content
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left sidebar with draggable elements
                    PaletteSidebarWidget(formProvider: formProvider),
                    
                    // Form editor area
                    Expanded(
                      child: Container(
                        color: const Color(0xFF323232),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FormDropTarget(
                            elements: formProvider.formElements,
                            onElementAdded: formProvider.addElement,
                            onElementRemoved: formProvider.removeElement,
                            onReorder: formProvider.reorderElements,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 