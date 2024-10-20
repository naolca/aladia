// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/action_button_use_case.dart' as _i2;
import 'package:widgetbook_workspace/input_field_use_case.dart' as _i5;
import 'package:widgetbook_workspace/social_login_button_use_case.dart' as _i3;
import 'package:widgetbook_workspace/welcome_card_use_case.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'shared',
    children: [
      _i1.WidgetbookFolder(
        name: 'components',
        children: [
          _i1.WidgetbookFolder(
            name: 'buttons',
            children: [
              _i1.WidgetbookComponent(
                name: 'ActionButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Default',
                    builder: _i2.buildActionButtonDefaultUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Loading',
                    builder: _i2.buildActionButtonLoadingUseCase,
                  ),
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'SocialLoginButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Apple Login',
                    builder: _i3.buildSocialLoginButtonAppleUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Facebook Login',
                    builder: _i3.buildSocialLoginButtonFacebookUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Google Login',
                    builder: _i3.buildSocialLoginButtonGoogleUseCase,
                  ),
                ],
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'cards',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'WelcomeCard',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default Welcome',
                  builder: _i4.buildWelcomeCardUseCase,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'inputs',
            children: [
              _i1.WidgetbookComponent(
                name: 'InputField',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'Email Field',
                    builder: _i5.buildInputFieldEmailUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Email Field (Disabled)',
                    builder: _i5.buildInputFieldEmailDisabledUseCase,
                  ),
                  _i1.WidgetbookUseCase(
                    name: 'Password Field',
                    builder: _i5.buildInputFieldPasswordUseCase,
                  ),
                ],
              )
            ],
          ),
        ],
      )
    ],
  )
];
