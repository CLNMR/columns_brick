# Flutter Form Designer

A powerful, drag-and-drop form builder application built with Flutter that allows users to design complex forms with multi-column layouts and various form elements.

![Form Designer](https://via.placeholder.com/800x450.png?text=Form+Designer+Screenshot)

## Features

- **Intuitive Drag-and-Drop Interface**: Easily build forms by dragging elements from the palette to your form
- **Rich Form Element Library**: Over 15 different form elements including:
  - Basic elements (sections, headings, hints, web links, etc.)
  - Form inputs (text fields, numbers, switches, dropdowns, date pickers, etc.)
  - Advanced layouts (multi-column layouts, status groups)
- **Multi-column Support**: Create responsive forms with multi-column layouts
- **Tab Navigation**: Organize your form into different tabs for better structure
- **Precise Positioning**: Insert elements between existing ones or directly below a specific element
- **Dark Theme**: Modern UI with dark theme and red accents

## Project Structure

The codebase is organized into small, focused components for better maintainability:

```
lib/
├── models/
│   └── form_element.dart         # Base form element model
├── providers/
│   ├── form_provider.dart        # Main state management
│   ├── form_operations.dart      # Form element operations
│   ├── column_operations.dart    # Column-specific operations
│   └── status_group_operations.dart # Status group operations
├── widgets/
│   ├── column_drop_zones/        # Column-specific drop zones
│   ├── form_designer/            # Main UI components
│   ├── form_drop_zones/          # Form drop zone components
│   ├── form_elements/            # Individual element renderers
│   ├── columns_widget.dart       # Multi-column layout widget
│   ├── form_element_widget.dart  # Element renderer
│   └── status_group_widget.dart  # Status group widget
└── screens/
    └── form_designer_screen.dart # Main form designer screen
```

## Getting Started

### Prerequisites

- Flutter 3.0 or higher
- Dart 2.17 or higher

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/flutter_form_designer.git
   ```

2. Navigate to the project directory:
   ```
   cd flutter_form_designer
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   flutter run
   ```

## Usage

1. **Adding Elements**: Drag elements from the left palette onto the form area
2. **Positioning Elements**: Drop elements between existing ones using the highlighted drop zones
3. **Multi-column Layout**: Use the "Mehrspalten" (multi-column) element to create columns
4. **Organizing Content**: Use tabs to organize your form into different sections
5. **Removing Elements**: Click the delete button on any element to remove it

## Architecture

This application follows a clean architecture pattern:

- **Models**: Define data structures for form elements
- **Providers**: Handle state management and business logic using the Provider pattern
- **Widgets**: Encapsulate UI components with clear responsibilities
- **Screens**: Compose widgets to create full application views

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Provider package for state management
- All contributors who have helped shape this project
