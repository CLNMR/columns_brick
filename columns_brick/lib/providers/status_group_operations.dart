import '../models/form_element.dart';
import 'form_operations.dart';

class StatusGroupOperations {
  final FormOperations _formOperations = FormOperations();
  
  void addElementToStatusGroup(
    List<FormElement> formElements, 
    int statusIndex, 
    FormElement element,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.statusGroup) {
        if (formElement.children.length > statusIndex) {
          final newElement = _formOperations.createDeepCopy(element);
          formElement.children[statusIndex].children.add(newElement);
          notifyCallback();
          return;
        }
      }
    }
  }

  void removeElementFromStatusGroup(
    List<FormElement> formElements, 
    int statusIndex, 
    String elementId,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.statusGroup) {
        if (formElement.children.length > statusIndex) {
          formElement.children[statusIndex].children.removeWhere(
            (element) => element.id == elementId
          );
          notifyCallback();
          return;
        }
      }
    }
  }
  
  void reorderElementsInStatusGroup(
    List<FormElement> formElements, 
    int statusIndex, 
    int oldIndex, 
    int newIndex,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.statusGroup) {
        if (formElement.children.length > statusIndex) {
          final statusChildren = formElement.children[statusIndex].children;
          
          // Apply same logic as regular reordering
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          
          final element = statusChildren.removeAt(oldIndex);
          statusChildren.insert(newIndex, element);
          notifyCallback();
          return;
        }
      }
    }
  }
} 