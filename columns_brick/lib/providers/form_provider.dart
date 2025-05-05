import 'package:flutter/foundation.dart';
import '../models/form_element.dart';
import 'form_operations.dart';
import 'column_operations.dart';
import 'status_group_operations.dart';

class FormProvider with ChangeNotifier {
  final List<FormElement> _formElements = [];
  final List<FormElement> _paletteElements = [];
  final List<FormElement> _tabElements = [];
  int _activeTabIndex = 0;
  
  // Operation mixins
  final FormOperations _formOperations = FormOperations();
  final ColumnOperations _columnOperations = ColumnOperations();
  final StatusGroupOperations _statusOperations = StatusGroupOperations();
  
  FormProvider() {
    _initPaletteElements();
    _initTabs();
  }

  List<FormElement> get formElements => _formElements;
  List<FormElement> get paletteElements => _paletteElements;
  List<FormElement> get tabElements => _tabElements;
  int get activeTabIndex => _activeTabIndex;

  void setActiveTab(int index) {
    if (index >= 0 && index < _tabElements.length) {
      _activeTabIndex = index;
      notifyListeners();
    }
  }

  void _initTabs() {
    _tabElements.addAll([
      FormElement(type: FormElementType.tab, label: 'Allgemein'),
      FormElement(type: FormElementType.tab, label: 'Tab 2'),
    ]);
  }

  void _initPaletteElements() {
    // Basic elements
    final basicElements = [
      FormElement(type: FormElementType.section, label: 'Abschnitt'),
      FormElement(type: FormElementType.heading, label: 'Überschrift'),
      FormElement(type: FormElementType.hint, label: 'Hinweis'),
      FormElement(type: FormElementType.webLink, label: 'Web-Link'),
      FormElement(type: FormElementType.image, label: 'Bild'),
      FormElement(type: FormElementType.file, label: 'Datei'),
      FormElement(type: FormElementType.navigation, label: 'Navigation'),
    ];

    // Form elements
    final formElements = [
      FormElement(type: FormElementType.textField, label: 'Textfeld'),
      FormElement(type: FormElementType.number, label: 'Nummer'),
      FormElement(type: FormElementType.switch_, label: 'Schalter'),
      FormElement(type: FormElementType.dropdown, label: 'Drop-Down'),
      FormElement(type: FormElementType.multiSelect, label: 'Mehrfachauswahl'),
      FormElement(type: FormElementType.date, label: 'Datum'),
      FormElement(type: FormElementType.timeRange, label: 'Zeitspanne'),
      FormElement(type: FormElementType.timer, label: 'Timer'),
      FormElement(type: FormElementType.imageUpload, label: 'Bild-Upload'),
      FormElement(type: FormElementType.fileUpload, label: 'Datei-Upload'),
      FormElement(type: FormElementType.email, label: 'E-Mail'),
      FormElement(type: FormElementType.phone, label: 'Telefon'),
    ];

    // Layout elements
    final layoutElements = [
      FormElement(
        type: FormElementType.columns, 
        label: 'Mehrspalten',
        children: [
          FormElement(type: FormElementType.columns, label: 'Spalte 1', children: []),
          FormElement(type: FormElementType.columns, label: 'Spalte 2', children: []),
        ],
      ),
      FormElement(
        type: FormElementType.statusGroup, 
        label: 'Status Gruppe',
        children: [
          FormElement(type: FormElementType.statusGroup, label: 'Status 1', children: []),
          FormElement(type: FormElementType.statusGroup, label: 'Status 2', children: []),
        ],
      ),
    ];

    _paletteElements.addAll([...basicElements, ...formElements, ...layoutElements]);
  }

  // Main form operations
  void addElement(FormElement element) {
    final newElement = _formOperations.createDeepCopy(element);
    _formElements.add(newElement);
    notifyListeners();
  }
  
  void insertElementAt(FormElement element, int index) {
    _formOperations.insertElementAt(
      _formElements, 
      element, 
      index, 
      () => notifyListeners()
    );
  }

  void removeElement(String id) {
    _formElements.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void reorderElements(int oldIndex, int newIndex) {
    _formOperations.reorderElements(
      _formElements, 
      oldIndex, 
      newIndex, 
      () => notifyListeners()
    );
  }
  
  // Delegate to column operations
  void addElementToColumn(int columnIndex, FormElement element) {
    _columnOperations.addElementToColumn(
      _formElements, 
      columnIndex, 
      element, 
      () => notifyListeners()
    );
  }
  
  void insertElementInColumnAt(int columnIndex, FormElement element, int position) {
    _columnOperations.insertElementInColumnAt(
      _formElements, 
      columnIndex, 
      element, 
      position, 
      () => notifyListeners()
    );
  }

  void removeElementFromColumn(int columnIndex, String elementId) {
    _columnOperations.removeElementFromColumn(
      _formElements, 
      columnIndex, 
      elementId, 
      () => notifyListeners()
    );
  }
  
  // Delegate to status group operations
  void addElementToStatusGroup(int statusIndex, FormElement element) {
    _statusOperations.addElementToStatusGroup(
      _formElements, 
      statusIndex, 
      element, 
      () => notifyListeners()
    );
  }

  void removeElementFromStatusGroup(int statusIndex, String elementId) {
    _statusOperations.removeElementFromStatusGroup(
      _formElements, 
      statusIndex, 
      elementId, 
      () => notifyListeners()
    );
  }
} 