import '../models/form_element.dart';
import 'form_operations.dart';

class ColumnOperations {
  final FormOperations _formOperations = FormOperations();
  
  void addElementToColumn(
    List<FormElement> formElements, 
    int columnIndex, 
    FormElement element,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.columns) {
        if (formElement.children.length > columnIndex) {
          final newElement = _formOperations.createDeepCopy(element);
          formElement.children[columnIndex].children.add(newElement);
          notifyCallback();
          return;
        }
      }
    }
  }
  
  void insertElementInColumnAt(
    List<FormElement> formElements, 
    int columnIndex, 
    FormElement element, 
    int position,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.columns) {
        if (formElement.children.length > columnIndex) {
          final columnChildren = formElement.children[columnIndex].children;
          
          // Validate position
          final targetPosition = position.clamp(0, columnChildren.length);
          
          // Create deep copy and insert
          final newElement = _formOperations.createDeepCopy(element);
          columnChildren.insert(targetPosition, newElement);
          notifyCallback();
          return;
        }
      }
    }
  }

  void removeElementFromColumn(
    List<FormElement> formElements, 
    int columnIndex, 
    String elementId,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.columns) {
        if (formElement.children.length > columnIndex) {
          formElement.children[columnIndex].children.removeWhere(
            (element) => element.id == elementId
          );
          notifyCallback();
          return;
        }
      }
    }
  }
  
  void reorderElementsInColumn(
    List<FormElement> formElements, 
    int columnIndex, 
    int oldIndex, 
    int newIndex,
    Function notifyCallback
  ) {
    for (var formElement in formElements) {
      if (formElement.type == FormElementType.columns) {
        if (formElement.children.length > columnIndex) {
          final columnChildren = formElement.children[columnIndex].children;
          
          // Apply same logic as regular reordering
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          
          final element = columnChildren.removeAt(oldIndex);
          columnChildren.insert(newIndex, element);
          notifyCallback();
          return;
        }
      }
    }
  }
} 