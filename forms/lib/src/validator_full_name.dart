import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

/// This validator is used to validate the full name of the subscriber.
/// Notes:
///     - Import "package:angular/angular.dart": for @directive.
///     - Import "package:angular_forms/angular_forms.dart": for Validator.
///     - Validators are directives.
/// See https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/validators.dart
/// See https://webdev.dartlang.org/angular/guide/attribute-directives

@Directive(
  // Below, we set the attribute selector.
  // The square brackets mean that the selector is an (HTML) attribute.
  selector: '[validator-full-name]',
  providers: const [
    const ExistingProvider.forToken(
      NG_VALIDATORS,
      ValidatorFullName,
    ),
  ]
)

class ValidatorFullName extends Validator {
  @override
  Map<String, dynamic> validate(AbstractControl control) {
    Map<String, bool> status = {
      'empty': false,
      'too-long': false,
      'too-short': false,
      'invalid-characters': false
    };

    RegExp v = RegExp(r'^[a-z\- ]+$', caseSensitive: false);

    if (0 == control.value.toString().length) {
      status['empty'] = true;
    } else if (control.value.toString().length > 30) {
      status['too-long'] = true;
    } else if (control.value.toString().length < 2) {
      status['too-short'] = true;
    } else if (! v.hasMatch(control.value.toString())) {
      status['invalid-characters'] = true;
    } else {
      // Everything is OK. There is no error.
      return null;
    }

    return status;
  }
}
