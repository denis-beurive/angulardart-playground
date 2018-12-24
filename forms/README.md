# Description

This example illustrates the form management.

# Preparation

## form directives

Be aware that the directives for forms (used to create the two-way bindings) are not loaded by default!

You need to explicitly:

* install required package "angular_forms".
* import the package ("angular_forms").
* declare that the component uses the directives that are defined within the package. This declaration makes the directives available for the template.

That is, in detail:

Install the package: `add angular_forms: ^2.0.0` to the file pubspec.yaml:

    dependencies:
        angular: ^5.0.0-beta+2
        angular_forms: ^2.0.0

Then don't forget to run the CLI command `pub get`.

    pub get

Import the package into your component source code:

    import 'package:angular_forms/angular_forms.dart';

Declare that the component uses the directives that are defined within the package.

    @Component(
        ...
        // Do not forget the line below:
        directives: const [formDirectives]
    )

## Core directives

Unlike form directives, core directives don't need to be imported.
**However, you need to explicitly make them available within the template.** (why ???).

    @Component(
        ...
        directives: const [coreDirectives],
        ...
    )

# Troubleshooting

## Watch out for the unexpected space !

The code below is WRONG:

    <input [(ngModel)]="member.fullName"
                        type="text"
                        name="fullName"
                        ngControl="fullName"
                        validator-full-name/>

The code below is OK (see the space after the name of the custom validator):

    <input [(ngModel)]="member.fullName"
                        type="text"
                        name="fullName"
                        ngControl="fullName"
                        validator-full-name />

## Notes

The "`ngModel`" directive only applies to form elements, which you can get the list on the link below:

(https://www.w3schools.com/html/html_form_elements.asp)[https://www.w3schools.com/html/html_form_elements.asp]

However, "ngModel" does not work for radio buttons (at least, I can't figure out how to use it).  

# Links

* An explanation on (two-way binding)[https://github.com/denis-beurive/angulardart-playground/tree/master/two-way-binding-with-forms].
* An explanation on (core directives)[https://github.com/denis-beurive/angulardart-playground/tree/master/template-syntax].
* [AngularDart forms](https://webdev.dartlang.org/angular/guide/forms).
* [W3C form elements](https://www.w3schools.com/html/html_form_elements.asp).
* [Attribute directive](https://webdev.dartlang.org/angular/guide/attribute-directives).
* [validators.dart](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/validators.dart).
* [A good explanation for the exportAs property](https://netbasal.com/angular-2-take-advantage-of-the-exportas-property-81374ce24d26).
* [NgModel](https://github.com/kulshekhar/angular2/blob/master/angular_forms/lib/src/directives/ng_model.dart).
* [NgForm](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_form.dart).
* [exportAs](https://webdev.dartlang.org/api/angular/angular/Directive/exportAs).
* [Web colors](https://en.wikipedia.org/wiki/Web_colors).

# Credits

The CSS style sheet for the form comes from [www.sanwebe.com](https://www.sanwebe.com/2014/08/css-html-forms-designs).

