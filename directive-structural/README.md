# Description

This application shows how to create a structural directive.

# Input template variable

## What is an input template variable ?

The [official documentation](https://webdev.dartlang.org/angular/guide/structural-directives) is not pretty clear on the matter.

First, there are two entities that we call "template":

* The component template.
* The (structural) directive template.

The term "input template variable" makes reference to the (structural) directive template.

> Some may say that it is obvious. I don't agree. When you first read the document, it's not clear.
> Thus I think that it would be better to use the appellation "input directive template variable".

I'll use the appellation "**input directive template variable**" instead of "input template variable".

Now, it's clear. The role of an _input directive template variable_ is to configure a _directive template_.

## Where does the value of an input (directive) template variable come from ?

Where doe the value of an _input directive template variable_ come from ?

The answer is: the value of an _input directive template variable_ gets assigned within the directive object.
You cannot define the value of an _input directive template variable_ directly within the component template.
For example, the code `<div *myDummy="let d=10">` below will **NOT** assign the value 10 to the variable `d`.

The value of the _input directive template variable_ is assigned from within the directive instance.
For example:

    TemplateRef _templateRef;
    ViewContainerRef _viewContainer;
    // ...
    _viewContainer.createEmbeddedView(_templateRef);
    _viewContainer.get(0).setLocal('data', 'MyDummyDirective.data');

And you write, within the component template:

    <div *myDummy="let d=data">

# Links

* [Structural directives](https://webdev.dartlang.org/angular/guide/structural-directives).
* [Micro syntax](https://gist.github.com/mhevery/d3530294cff2e4a1b3fe15ff75d08855).
* [Understanding Angular Structural Directives](https://netbasal.com/understanding-angular-structural-directives-659acd0f67e).
  This document refers to AngularJS. But the logic is identical for AngularDart.
* [The Power of Structural Directives in Angular](https://netbasal.com/the-power-of-structural-directives-in-angular-bfe4d8c44fb1).
  This document refers to AngularJS. But the logic is identical for AngularDart.
* [The ngFor directive source code](https://github.com/dart-lang/angular/blob/master/angular/lib/src/common/directives/ng_for.dart).
* StackOverflow: [AngularDart: using template input variables in structural directives](https://stackoverflow.com/questions/53958608/angulardart-using-template-input-variables-in-structural-directives).
