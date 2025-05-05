import 'package:flutter/material.dart';
import '../models/form_element.dart';

class DraggableFormElement extends StatelessWidget {
  final FormElement element;
  final bool isInPalette;

  const DraggableFormElement({
    super.key,
    required this.element,
    this.isInPalette = true,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<FormElement>(
      maxSimultaneousDrags: 1,
      data: element,
      feedback: Material(
        elevation: 4.0,
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isInPalette ? 100 : 300,
            maxHeight: 100,
          ),
          child: _buildElement(isPreview: true),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _buildElement(isDragging: true),
      ),
      child: _buildElement(),
    );
  }

  Widget _buildElement({bool isDragging = false, bool isPreview = false}) {
    final innerWidget = _getElementWidget();
    
    return Container(
      margin: isInPalette ? const EdgeInsets.all(2) : const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isDragging ? const Color(0xFF252525) : const Color(0xFF252525),
        border: Border.all(
          color: const Color(0xFF505050),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(child: innerWidget),
          ),
          if (isInPalette)
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  element.label,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getElementWidget() {
    final elementColor = Colors.grey.shade300;
    
    // Use a Map to avoid switch statement issues
    final iconMap = {
      FormElementType.section: Icon(Icons.article_outlined, color: elementColor),
      FormElementType.heading: Text('T', style: TextStyle(fontSize: 20, color: elementColor, fontWeight: FontWeight.bold)),
      FormElementType.hint: Text('=', style: TextStyle(fontSize: 20, color: elementColor, fontWeight: FontWeight.bold)),
      FormElementType.webLink: Icon(Icons.link, color: elementColor),
      FormElementType.image: Icon(Icons.image, color: elementColor),
      FormElementType.file: Icon(Icons.insert_drive_file, color: elementColor),
      FormElementType.navigation: Icon(Icons.navigation, color: elementColor),
      FormElementType.textField: Icon(Icons.text_fields, color: elementColor),
      FormElementType.number: Text('0', style: TextStyle(fontSize: 20, color: elementColor, fontWeight: FontWeight.bold)),
      FormElementType.switch_: Icon(Icons.toggle_on, color: elementColor),
      FormElementType.dropdown: Icon(Icons.arrow_drop_down_circle, color: elementColor),
      FormElementType.multiSelect: Icon(Icons.check_box, color: elementColor),
      FormElementType.date: Icon(Icons.calendar_today, color: elementColor),
      FormElementType.timeRange: Icon(Icons.timer, color: elementColor),
      FormElementType.timer: Icon(Icons.timelapse, color: elementColor),
      FormElementType.imageUpload: Icon(Icons.file_upload, color: elementColor),
      FormElementType.fileUpload: Icon(Icons.upload_file, color: elementColor),
      FormElementType.email: Icon(Icons.email, color: elementColor),
      FormElementType.phone: Icon(Icons.phone, color: elementColor),
      FormElementType.columns: Icon(Icons.view_column, color: elementColor),
      FormElementType.tab: Icon(Icons.tab, color: elementColor),
      FormElementType.statusGroup: Icon(Icons.layers, color: elementColor),
    };
    
    return iconMap[element.type] ?? Icon(Icons.widgets, color: elementColor);
  }
} 