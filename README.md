# Introduction

This repository contains some code I developed while learning AngularDart.

# Examples

* [One way data binding from data to view](https://github.com/denis-beurive/angulardart-playground/tree/master/one-way-binding-data-to-view)
* [One way data binding from view to data](https://github.com/denis-beurive/angulardart-playground/tree/master/one-way-binding-view-to-data)
* [Two way data binding with forms](https://github.com/denis-beurive/angulardart-playground/tree/master/two-way-binding-with-forms)
* [Template syntax](https://github.com/denis-beurive/angulardart-playground/tree/master/template-syntax). This includes:
  * Template interpolation (`{{template_expression}}`).
  * Template expressions. You find template expressions within interpolation or data binding. 
    Ex: `{{template_expression}}` or `[property]="template_expression"`.
  * Template statements: a template statement responds to an **event** raised by a binding target such 
    as an element, component, or directive. Ex: `(click)="template_statement"`.
  * Template reference variables (`#var`).
  * Built-in structural directives (`ngIf`, `ngFor`, `ngSwitch`).
* [Forms](https://github.com/denis-beurive/angulardart-playground/tree/master/forms). This includes:
  * The directive [NgModel](https://github.com/kulshekhar/angular2/blob/master/angular_forms/lib/src/directives/ng_model.dart).
  * The directive [NgForm](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_form.dart).
  * The implementation of validators (see [this link](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/validators.dart)).
* [Attribute directives](https://github.com/denis-beurive/angulardart-playground/tree/master/directive-attribute). This includes:
  * The basic.
  * The use of the @Directive property [exportAs](https://webdev.dartlang.org/api/angular/angular/Directive/exportAs).
  * The use of the directive [@HostListener](https://webdev.dartlang.org/api/angular/angular/HostListener-class).
  * The use of the directive [@Input](https://webdev.dartlang.org/api/angular/angular/Input-class).
* [Structural directives](https://github.com/denis-beurive/angulardart-playground/tree/master/directive-structural). This includes:
  * The use of "input template variables"... although I prefer the appellation "input _directive_ template variables", since there are two kinds of templates: **component templates** and **(structural) directive templates**. A clear distinction makes things clearer.
  * The concept of "directive local name". This appellation does not come from the official documentation. However, it seems interesting to "coin" it. when you start learning about structural directives the problem is that the same words are used for different things. That IS confusing, since you may adopt the wrong point of view.
  * The `$implicit` "directive local name".


# Important note: please read

## Make sure to use the last version of "build_runner"

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

## Read how to use Chrome to debug Agular applications

Read [Debugging Dart Web Apps](https://webdev.dartlang.org/guides/debugging).

# Notes

* [Troubleshooting](https://github.com/denis-beurive/angulardart-playground/blob/master/warnings.md) **MAKE SURE TO READ THIS !!!**
* [Template](https://github.com/denis-beurive/angulardart-playground/tree/master/template.md)
* [Binding](https://github.com/denis-beurive/angulardart-playground/tree/master/binding.md)

# Project organisation

Angular apps are made up of components. A component is the combination of an HTML template and a component class that controls a portion of the screen.

For example, the component "`app_component`" is made of the files below:

* `lib/app_component.dart`: the component class that controls a portion of the screen.
* `lib/app_component.html`: the HTML template.

The "component parts" are defined within the metadata `@Component`.

    /// This metadata defines data that will apply to the component "AppComponent".
    @Component(
        // Define the HTML tag that will serve a component anchor.
        selector: 'my-app',

        // Define the template:
        // - The template can be defined within a file. In this case, use the tag
        //   "templateUrl" to specify the path to the template file.
        // - The template can be defined by a simple string. In this case use the tag
        //   "template" to specify the string. Example:
        //   template: '{{debug}}'
        templateUrl: 'app_component.html',

        // Export code that can be used from within the template. Here we export nothing.
        exports: [ ],

        // If this component used other components, the components list goes in the list below.
        directives: [formDirectives]
    )

Components are placed in the subdirectory "`lib`". And the main entry point (index.html) is placed under the directory "web".


    ├── lib
    │   ├── app_component.dart
    │   └── app_component.html
    ├── pubspec.yaml
    └── web
        ├── index.html
        ├── main.dart
        └── style.css

# Nomenclature

* **HTML element**. For ex: `<img [src]="heroImageUrl">`
* **Component**. For ex: `<my-hero [hero]="currentHero"></my-hero>`
* **Directive**. For ex: `<div [ngClass]="{'special': isSpecial}">...</div>`
* **Attribute**: attributes refer to HTML elements.
* **Property**: properties refer to the DOM.

# Technical notes

## Installing the CLI tools

    pub global activate webdev
    pub global activate stagehand
    pub global activate angular_cli

> These tools are installed into the directory "`${HOME}/.pub-cache/bin`".
>
> Under Unbuntu, you may need to add this line to your `.profile` configuration file: `export PATH="${PATH}:/usr/lib/dart/bin:${HOME}/.pub-cache/bin"`

## Create a new AngularDart project

You can do it by either using `stagehand` or `ngdart`.

### stagehand

    mkdir project_name
    cd project_name
    stagehand web-angular

### ngdart

    ngdart new project_name
    cd project_name
    pub get

> See [https://pub.dartlang.org/packages/angular_cli](https://pub.dartlang.org/packages/angular_cli)

> Please note that the command will replace all characters "-" by characters "\_" in the name of the project. It does it because the given project name is used within the configure file "`pubspec.yaml`" (see the parameter "`name`").

## Check the versions of the build tools

    $ pub deps

## Updating the application package

Each time the file `pubspec.yaml` is edited, the command below must be run:

    pub get

## Testing the application


You can start a standalone WEB server by running the command below: 

    webdev serve

Please note that this command will generate Dart and JS codes:

* `.dart_tool/build/generated/<application name>/lib/app_component.template.dart`: this file should be imported from the application main Dart entry point.
* `.dart_tool/build/generated/<application name>/web/main.dart.js`: this file should be included from the application main HTML entry point.

> The value of `<application name>` is configured in the file "`pubspec.yaml`" (variable "`name`").

    
## JavaScript code

The JavaScript code that implements the application is produced by the Dart to JS transpiler.
It is included in the application through the line below (in the file `index.html`):

    <script defer src="main.dart.js"></script>
    
## Debug

If an error occurred, details about the error is written into the WEB console.

# Links to documentation

* **Examples**: [https://github.com/dart-lang/angular/tree/master/examples](https://github.com/dart-lang/angular/tree/master/examples).
* **AngularDart Components**: [https://webdev.dartlang.org/angular/components](https://webdev.dartlang.org/angular/components).
* **Template Syntax**: [https://webdev.dartlang.org/angular/guide/template-syntax](https://webdev.dartlang.org/angular/guide/template-syntax).
* **NgModel**: [https://angular.io/api/forms/NgModel#description](https://angular.io/api/forms/NgModel#description).
* **Core directives**: [https://webdev.dartlang.org/api/angular/angular/coreDirectives-constant
](https://webdev.dartlang.org/api/angular/angular/coreDirectives-constant).
* **User input**: [https://webdev.dartlang.org/angular/guide/user-input](https://webdev.dartlang.org/angular/guide/user-input).
* **Directives for forms**: see the file [directives.dart](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives.dart).
* **DOM events reference**: [https://developer.mozilla.org/en-US/docs/Web/Events](https://developer.mozilla.org/en-US/docs/Web/Events).
* **Life cycle for components and directives**: [https://webdev.dartlang.org/angular/guide/lifecycle-hooks](https://webdev.dartlang.org/angular/guide/lifecycle-hooks).
* **Attribute directives**: [https://webdev.dartlang.org/angular/guide/attribute-directives](https://webdev.dartlang.org/angular/guide/attribute-directives).
* **exportAs**: [https://webdev.dartlang.org/api/angular/angular/Directive/exportAs](https://webdev.dartlang.org/api/angular/angular/Directive/exportAs).
* **@HostListener**:[https://webdev.dartlang.org/api/angular/angular/HostListener-class](https://webdev.dartlang.org/api/angular/angular/HostListener-class).
* **@Input**: [https://webdev.dartlang.org/api/angular/angular/Input-class](https://webdev.dartlang.org/api/angular/angular/Input-class).
* **Validators**: [https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/validators.dart](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/validators.dart).
* **Debugging Dart Web Apps**: [https://webdev.dartlang.org/guides/debugging](https://webdev.dartlang.org/guides/debugging).

