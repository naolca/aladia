import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the WelcomeCard widget
import 'package:aladia/shared/components/cards/welcome_card.dart';

@widgetbook.UseCase(name: 'Default Welcome', type: WelcomeCard)
Widget buildWelcomeCardUseCase(BuildContext context) {
  return const WelcomeCard();
}
