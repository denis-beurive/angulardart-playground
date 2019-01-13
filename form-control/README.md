# Description

This project illustrates the use of  ̀ngFormControl ̀ and  ̀ngControl ̀.

# ngFormControl vs ngControl ?

You can set `ngFormControl` or `ngControl` to a DOM element, but not both.

CORRECT:

    <input type="text" [ngFormControl]="fullName"/>

**NOT** CORRECT:

    <input type="text" [ngFormControl]="fullName" ngControl="myFullName"/>

## ngFormControl directive

See: [https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_form_control.dart](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_form_control.dart).

    @Directive(
      selector: '[ngFormControl]',
      providers: [
        ExistingProvider(NgControl, NgFormControl),
      ],
      exportAs: 'ngForm',
    )
    class NgFormControl extends NgControl implements AfterChanges { ... }
    
The `ngFormControl` binds a `Control` object to a from input.

**app_component.html**:

    <input type="text" [ngFormControl]="fullName"/>
   
**app_component.dart**: 
   
    Control fullName = Control('');
    ...
    print(fullName.value);
   
## ngControl directive

Be aware that there is a class named [NgControl](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_control.dart).
However, this class does not implement the `ngControl` directive!

See [https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_control_name.dart](https://github.com/dart-lang/angular/blob/master/angular_forms/lib/src/directives/ng_control_name.dart).

    @Directive(
      selector: '[ngControl]',
      providers: [
        ExistingProvider(NgControl, NgControlName),
      ],
      exportAs: 'ngForm',
    )
    class NgControlName extends NgControl implements AfterChanges, OnDestroy { ... }

The `ngControl` just assigns a key value to the map that is provided to the submit handler.

**app_component.html**:
    
    <form #f="ngForm" (submit)='onSubmit(f.value)'>
    ...
    <input type="text" ngControl="address"/>

**app_component.dart**:

    void onSubmit(var value) {
        print(value['address']);
    }
 
 