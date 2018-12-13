# Description

This example illustrates the use of a two-way data binding within forms.

See [directives.dart](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives.dart) for the list of all directives.

**Syntax**: `[(...)]="..."`

> The [(x)] syntax combines the brackets of property binding, [x], with the parentheses of event binding, (x).
> See [this link](https://webdev.dartlang.org/angular/guide/template-syntax).

**Be aware that the directives for forms (used to create the two-way bindings) are not loaded by default!**

You need to **explicitly**:

* **install** required package [angular_forms](https://pub.dartlang.org/packages/angular_forms).
* **import** the package ("_angular_forms_").
* **declare** that the component uses the directives that are defined within the package.
  This declaration makes the directives available for the template.

That is, in detail:

**Install the package**: add `angular_forms: ^2.0.0` to the file `pubspec.yaml`:

    dependencies:
      angular: ^5.0.0-beta+2
      angular_forms: ^2.0.0

> Then don't forget to run the CLI command `pub get`.

**Import the package** into your component source code:

    import 'package:angular_forms/angular_forms.dart';

**Declare** that the component uses the directives that are defined within the package.

    @Component(
        ...
        // Do not forget the line below:
        directives: const [formDirectives]
    )

Please note that if you fail to install, import or declare the package, then you get the error below:

    [SEVERE] angular on lib/app_component.dart:
    Template parse errors:
    line 12, column 21 of AppComponent: ParseErrorLevel.FATAL: Can't bind to 'ngModel' since it isn't a known native property or known directive. Please fix typo or add to directives list.
    <input name="title" [(ngModel)]="inputTitle">
                        ^^^^^^^^^^^^^^^^^^^^^^^^

# Technical notes

Run:

    pub get # If not already done
    webdev serve

