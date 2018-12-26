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
* [Structural directives](https://github.com/denis-beurive/angulardart-playground/tree/master/directive-structural).

# Important note: please read

It seems that the utility `webdev` is buggy. And **the bug can make you lose lots of time !** (until you figure out what's the real problem - and, as you will notice, _it's not at all obvious_).

Let's say that you instantiate a "metadata" (to implement a component or a directive, for example). You write something like:

    @Component(
        selector: 'app-component',
        templateUrl: 'app_component.html',
        directives: [MyListerDirective]
    )
    class AppComponent {

    }

Everything compiles... you are happy.

You change something in your code, in another file... And, suddenly, you get tons of errors ! Your first reaction is to look at your last changes. But everything seems OK. You restart the CLI command `webdev serve`... maybe there is something that needs to be reinitialised somewhere. Nothing changes. You still have tons of errors !

Then, your intuition tells you to add a comma in the declaration :

    @Component(
        selector: 'app-component',
        templateUrl: 'app_component.html',
        directives: [MyListerDirective],
    )
    class AppComponent {

    }

Do you see the difference ?

> How does your intuition find out ? You have no idea. But the code compiles all right !

Everything compiles !

And that's not the end of the story. Now you remove the comma you've just added.

    @Component(
        selector: 'app-component',
        templateUrl: 'app_component.html',
        directives: [MyListerDirective]
    )
    class AppComponent {

    }

And guess what : it compiles all right !

Seems pretty inconsistent, doesn't it ?

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

    ngdart new project_name
    cd project_name
    pub get

> See [https://pub.dartlang.org/packages/angular_cli](https://pub.dartlang.org/packages/angular_cli)

> Please note that the command will replace all characters "-" by characters "\_" in the name of the project. It does it because the given project name is used within the configure file "`pubspec.yaml`" (see the parameter "`name`").

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
