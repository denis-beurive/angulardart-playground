# Description

This application shows how to create an **attribute directive**.
We create the following attribute directives:

* [DirectiveMyBlinker](https://github.com/denis-beurive/angulardart-playground/blob/master/directive-attribute/lib/src/directive-my-blinker.dart):
  This very simple attribute directive illustrates the basics.
  It also shows the use of the `Directive` property [exportAs](https://webdev.dartlang.org/api/angular/angular/Directive/exportAs). 
* [DirectiveMyHighlight](https://github.com/denis-beurive/angulardart-playground/blob/master/directive-attribute/lib/src/directive_my_highlight.dart):
  This very simple directive shows how to build a directive that responds to user events ([@HostListener](https://webdev.dartlang.org/api/angular/angular/HostListener-class)).  
* [DirectiveColorAlternator](https://github.com/denis-beurive/angulardart-playground/blob/master/directive-attribute/lib/src/directive_color_alternator.dart).
  This very simple directive shows how to build a directive that takes input parameters ([@Input](https://webdev.dartlang.org/api/angular/angular/Input-class)).
  It also points out a very important fact about the directive life cycle. **Input parameters values are not available within the directive constructor**.

# Important notes

It should be pointed out that the following values are not available within the directive constructor:

* input parameters values.
* host element inner HTML.

However, you can have access to these values within the `ngOnInit` life cycle hook.

> See [https://webdev.dartlang.org/angular/guide/lifecycle-hooks](https://webdev.dartlang.org/angular/guide/lifecycle-hooks):
>
> ngOnInit: Initialize the directive/component after Angular first displays the
> data-bound properties and sets the **directive/component’s input properties**.

# Links

* [Attribute directives](https://webdev.dartlang.org/angular/guide/attribute-directives).
* [exportAs](https://webdev.dartlang.org/api/angular/angular/Directive/exportAs).
* [A good explanation for the exportAs property](https://netbasal.com/angular-2-take-advantage-of-the-exportas-property-81374ce24d26).
* [@HostListener](https://webdev.dartlang.org/api/angular/angular/HostListener-class).
* [@Input](https://webdev.dartlang.org/api/angular/angular/Input-class).
* [DOM events reference](https://developer.mozilla.org/en-US/docs/Web/Events).
* [Life cycle for the directives](https://webdev.dartlang.org/angular/guide/lifecycle-hooks).
