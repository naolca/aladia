import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the ActionButton widget
import 'package:aladia/shared/components/buttons/action_button.dart';

@widgetbook.UseCase(name: 'Default', type: ActionButton)
Widget buildActionButtonDefaultUseCase(BuildContext context) {
  return ActionButton(
    onPressed: () {
      print('Action Button Pressed');
    },
    child: Text(
      "Enter",
      style: TextStyle(color: Theme.of(context).textTheme.displayLarge?.color),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading', type: ActionButton)
Widget buildActionButtonLoadingUseCase(BuildContext context) {
  return ActionButton(
    onPressed: () {
      print('Action Button is Loading');
    },
    child: CircularProgressIndicator(
      color: Theme.of(context).textTheme.displayLarge?.color,
    ),
  );
}
