# Inroduction

This repository contains some code I developed while learning AngularDart.

# Examples

* [One way data binding from data to view](https://github.com/denis-beurive/angulardart-playground/tree/master/one-way-binding-data-to-view)
* [One way data binding from view to data](https://github.com/denis-beurive/angulardart-playground/tree/master/one-way-binding-view-to-data)

# Notes

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

# Misc

* **Examples**: [https://github.com/dart-lang/angular/tree/master/examples](https://github.com/dart-lang/angular/tree/master/examples)
* **AngularDart Components**: [https://webdev.dartlang.org/angular/components](https://webdev.dartlang.org/angular/components)
* **Template Syntax**: [https://webdev.dartlang.org/angular/guide/template-syntax](https://webdev.dartlang.org/angular/guide/template-syntax)
* **NgModel**: [https://angular.io/api/forms/NgModel#description](https://angular.io/api/forms/NgModel#description)
* **Core directives**: [https://webdev.dartlang.org/api/angular/angular/coreDirectives-constant
](https://webdev.dartlang.org/api/angular/angular/coreDirectives-constant)
* **User input**: [https://webdev.dartlang.org/angular/guide/user-input](https://webdev.dartlang.org/angular/guide/user-input)

