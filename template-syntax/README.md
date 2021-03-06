# Description

This application illustrates the syntax used within the templates. This includes:

* Template interpolation (`{{template_expression}}`).
* Template expressions. You find template expressions within interpolation or data binding. 
  Ex: `{{template_expression}}` or `[property]="template_expression"`.
* Template statements: a template statement responds to an **event** raised by a binding target such as an element,
  component, or directive. Ex: `(click)="template_statement"`.
* Template reference variables (`#var`).
* Built-in structural directives (`ngIf`, `ngFor`, `ngSwitch`).

# Troubleshooting

## Don't forget the import the required directives

In order to use the structural directives, make sure to import "coreDirectives".

    @Component(
        ...
        directives: const [coreDirectives],
        ...
    )

> See (coreDirectives top-level constant)[https://webdev.dartlang.org/api/angular/angular/coreDirectives-constant]

## Be careful with the "ngFor" syntax

You may write something like that (thinking about the syntax of `foreach` in other languages):

    <li *ngFor="let day in days">{{day}}</li>

The right syntax is (replace `in` by `of`):

    <li *ngFor="let day of days">{{day}}</li>

# Links

* [Template Syntax](https://webdev.dartlang.org/angular/guide/template-syntax)
* [Structural Directives](https://webdev.dartlang.org/angular/guide/structural-directives)
* [coreDirectives top-level constant](https://webdev.dartlang.org/api/angular/angular/coreDirectives-constant)
