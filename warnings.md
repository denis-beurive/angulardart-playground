# Warnings

## Make sure to use the last version of build_runner

See: [https://github.com/dart-lang/angular/issues/1696](https://github.com/dart-lang/angular/issues/1696) and [https://github.com/dart-lang/webdev/issues/79](https://github.com/dart-lang/webdev/issues/79).

Make sure that you have the last version of `build_runner`.
Otherwise you may run into very annoying bugs.

    $ pub deps | grep build_runner

Go get the last version number od the tool `build_runner` [here](https://pub.dartlang.org/packages/build_runner).

Assuming that the last version is `1.1.2`, change your file `pubspec.yaml`.

    dev_dependencies:
        angular_test: ^2.0.0-beta+2
        build_runner: ^1.1.2
        build_test: ^0.10.3+1
        build_web_compilers: ^0.4.1
        pageloader: ^3.0.0-beta
        test: ^1.3.0

Then execute the commands below:

    $ pub upgrade
    $ pub deps | grep build_runner
    |-- build_runner 1.1.2
    |   |-- build_runner_core 1.1.2

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


                        