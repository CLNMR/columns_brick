import '../models/form_element.dart';

class FormOperations {
  FormElement createDeepCopy(FormElement element) {
    final newChildren = element.children.map((child) => createDeepCopy(child)).toList();
    return FormElement(
      type: element.type,
      label: element.label,
      children: newChildren,
      properties: Map<String, dynamic>.from(element.properties),
    );
  }
  
  void insertElementAt(
    List<FormElement> elements, 
    FormElement element, 
    int index,
    Function notifyCallback
  ) {
    if (index < 0 || index > elements.length) {
      // Fall back to adding at the end if index is out of bounds
      final newElement = createDeepCopy(element);
      elements.add(newElement);
      notifyCallback();
      return;
    }
    
    final newElement = createDeepCopy(element);
    elements.insert(index, newElement);
    notifyCallback();
  }
  
  void reorderElements(
    List<FormElement> elements, 
    int oldIndex, 
    int newIndex,
    Function notifyCallback
  ) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final element = elements.removeAt(oldIndex);
    elements.insert(newIndex, element);
    notifyCallback();
  }
} 