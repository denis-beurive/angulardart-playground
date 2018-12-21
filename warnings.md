# Warnings

## Be aware of the nasty comma!

A single comma can generate tons of errors! For example, let's consider the code below:


    @Component(
      selector: 'app-component',
      templateUrl: 'app_component.html',
    )

This code will generate tons of errors!

    [SEVERE] build_web_compilers|ddc on lib/app_component.template.dartdevc.module (cached):
    Error compiling dartdevc module:myapp|lib/app_component.template.ddc.js

    [error] Target of URI doesn't exist: 'package:angular/angular.dart'. (package:myapp/app_component.dart, line 1, col 8)
    [error] The imported library ''package:angular/angular.dart'' can't have a part-of directive. (package:myapp/app_component.dart, line 1, col 8)
    [error] Undefined name 'Component' used as an annotation. (package:myapp/app_component.dart, line 4, col 1)
    [error] Target of URI doesn't exist: 'package:angular/angular.dart'. (package:myapp/app_component.template.dart, line 8, col 8)
    ...

Just remove the last comma and everything works fine!

    @Component(
      selector: 'app-component',
      templateUrl: 'app_component.html'
    )

## Make sure to export the built-in directives

You may think that "built-in" _something_ is automatically available. This seems obvious: if it is "**built-in**", then it is already included, isn't it ?

Well, this is not the case with built-in directives! If you need to use them within templates, then you must **explicitly** make then available within the template !

    @Component(
      ...
      directives: const [coreDirectives],
      ...
    )
    class AppComponent { ... }


## Make sure to import and export the form directives

These directives are heavily used. Thus you may assume that they are avalaible by default.
This is not the case. You must:

* import the packahe "`angular_forms/angular_forms.dart`".
* you must make the directives available within the template.

That is:

    import 'package:angular_forms/angular_forms.dart';
    ...
    @Component(
      ...

      directives: const [formDirectives],
      ...
    )
    class AppComponent { ... }

> Do you imagine a case where you import the package but you don't make the directives available within the template ? I do not.

## Use the "const" keyword with cautious!

The code below is OK:

    @Component(
      selector: 'app-component',
      templateUrl: 'app_component.html',
      directives: const [formDirectives, coreDirectives]
    )
    class AppComponent {
      static List<String> languages = const ['English', 'French', 'Spanish', 'Italian'];
    }

However, the following code is **NOT** OK:

    @Component(
      selector: 'app-component',
      templateUrl: 'app_component.html',
      directives: const [formDirectives, coreDirectives]
    )
    class AppComponent {
      static const List<String> languages = ['English', 'French', 'Spanish', 'Italian'];
    }

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


                        