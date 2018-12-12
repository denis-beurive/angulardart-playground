# Templates

## Interpolation

Interpolation takes place within double-curly braces (`{{templateExpression}}`) or double quotes ("templateExpression").

Please note that the two notations (`{{...}}` and `"..."`) are not interchangeable. You use one or the other depending on the context.

* `{{templateExpression}}` is used to "print" something that will be rendered. The text between the braces is a "template expression" that Angular first evaluates and then converts to a string (witch is then "printed").
* `"templateExpression"` is used to implement "internal logic".

The text to evaluate (that is the `"template expression"`) is evaluated within a "context". This means that what appears inside the double-curly braces or the double quotes cannot be arbitrary (Dart) code. This "evaluation context" covers:

* the component instance (its properties and methods). The "template expression" can refer to properties and methods of the instantiated component. In this example, the "component instance" is an instance of the class "AppComponent". And the "template expression" can contain the names of the properties and methods of the class "AppComponent". Please note that this context can be expanded using the "component parameter" "exports".
* the template (its variables). The template itself defines its own variables ("template input variables", "template reference variable"...).

The "template expression" may refer to any entity (variables or functions) available within the context of the template. These entities include: properties and methods from the component instance, and the variables defined by the template itself ("template input variables", "template reference variable"...).

> The context for terms in an expression is a blend of the template variables and the component’s members. If you reference a name that belongs to more than one of these namespaces, the template variable name takes precedence, followed by a name in the directive’s context, and, lastly, the component’s member names. See [this link](https://webdev.dartlang.org/angular/guide/template-syntax).

## Template statement

A template statement responds to an event raised by a binding target such as an element, component, or directive. See
[this link](https://webdev.dartlang.org/angular/guide/template-syntax).

Example: <button (click)="deleteHero()">Delete hero</button>

