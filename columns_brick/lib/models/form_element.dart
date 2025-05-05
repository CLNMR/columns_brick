import 'package:uuid/uuid.dart';

enum FormElementType {
  // Basic elements
  section,
  heading,
  hint,
  webLink,
  image,
  file,
  navigation,
  
  // Form elements
  textField,
  number,
  switch_,
  dropdown,
  multiSelect,
  date,
  timeRange,
  timer,
  imageUpload,
  fileUpload,
  email,
  phone,

  // Layout elements
  columns,
  tab,
  statusGroup,
}

class FormElement {
  final String id;
  final FormElementType type;
  String label;
  List<FormElement> children;
  Map<String, dynamic> properties;

  FormElement({
    String? id,
    required this.type,
    required this.label,
    List<FormElement>? children,
    Map<String, dynamic>? properties,
  })  : id = id ?? const Uuid().v4(),
        children = children ?? [],
        properties = properties ?? {};

  FormElement copyWith({
    String? id,
    FormElementType? type,
    String? label,
    List<FormElement>? children,
    Map<String, dynamic>? properties,
  }) {
    return FormElement(
      id: id ?? this.id,
      type: type ?? this.type,
      label: label ?? this.label,
      children: children ?? this.children,
      properties: properties != null 
          ? Map<String, dynamic>.from(properties) 
          : Map<String, dynamic>.from(this.properties),
    );
  }
} 