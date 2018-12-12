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

