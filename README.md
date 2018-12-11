# Inroduction

This repository contains some code I developed while learning AngularDart.

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

# Interpolation

Interpolation takes place within double-curly braces (`{{templateExpression}}`) or double quotes ("templateExpression").

Please note that the two notations (`{{...}}` and `"..."`) are not interchangeable. You use one or the other depending on the context.

* `{{templateExpression}}` is used to "print" something that will be rendered. The text between the braces is a "template expression" that Angular first evaluates and then converts to a string (witch is then "printed").
* `"templateExpression"` is used to implement "internal logic".

The text to evaluate (that is the `"template expression"`) is evaluated within a "context". This means that what appears inside the double-curly braces or the double quotes cannot be arbitrary (Dart) code. This "evaluation context" covers:

* the component instance (its properties and methods). The "template expression" can refer to properties and methods of the instantiated component. In this example, the "component instance" is an instance of the class "AppComponent". And the "template expression" can contain the names of the properties and methods of the class "AppComponent". Please note that this context can be expanded using the "component parameter" "exports".
* the template (its variables). The template itself defines its own variables ("template input variables", "template reference variable"...).

The "template expression" may refer to any entity (variables or functions) available within the context of the template. These entities include: properties and methods from the component instance, and the variables defined by the template itself ("template input variables", "template reference variable"...).

> The context for terms in an expression is a blend of the template variables and the component’s members. If you reference a name that belongs to more than one of these namespaces, the template variable name takes precedence, followed by a name in the directive’s context, and, lastly, the component’s member names. See [this link](https://webdev.dartlang.org/angular/guide/template-syntax).

# Template statement

A template statement responds to an event raised by a binding target such as an element, component, or directive. See
[this link](https://webdev.dartlang.org/angular/guide/template-syntax).

Example: <button (click)="deleteHero()">Delete hero</button>

# Bindings

Bindings apply on:

* properties (which relate to the DOM).
  One way binding only: from data to view.
  `[...]="..."`
* attributes (which relate to the HTML).
  One way binding only: from data to view.
  `[...]="..."`
* classes (which relate to the HTML).
  One way binding only: from data to view.
  `[...]="..."`
* styles (which relate to the HTML).
  One way binding only: from data to view.
  `[...]="..."`
* events.
  One way binding only: from view to data.
  `(...)="..."`
* event/property.
  Two way binding: an event (xChange) from view to data, and a property (x) from data to view.
  `[(x)]="..."`

# Technical notes

## Updating the application package

Each time the file `pubspec.yaml` is edited, the command below must be run:

    pub get

## Using the CLI tools

First, install `webdev` and `stagehand`.

    pub global activate webdev
    pub global activate stagehand


> Under Unbuntu, you may need to add this line to your `.profile` configuration file: `export PATH="${PATH}:/usr/lib/dart/bin:${HOME}/.pub-cache/bin"`

Then, you can start a standalone WEB server by running the command below: 

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


