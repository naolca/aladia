import 'package:aladia/features/authentication/presentation/pages/login_page.dart';
import 'package:aladia/shared/components/buttons/action_button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetBookApp());
}

class WidgetBookApp extends StatelessWidget {
  const WidgetBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(directories: [
      WidgetbookComponent(
        name: 'ActionButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => ActionButton(
              onPressed: () {
                print('Action Button Pressed');
              },
            ),
          ),
        ],
      ),
    ]);
  }
}
