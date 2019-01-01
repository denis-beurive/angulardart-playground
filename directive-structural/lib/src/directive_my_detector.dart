// This file implements a structural directive that, structurally, does nothing.
// It is used to illustrate the role of the "ngDoCheck" hook.
//
// This directive has no data-bound properties. However, the hook "ngDoCheck" is
// executed whenever something changes inside the host component.

import 'package:angular/angular.dart';

@Directive(
    selector: '[myDetector]'
)
// From a technical point of view, implementing the interface DoCheck is stupid here.
// We do that in order to show that the hook is executed whenever something changes
// within the host component.
class MyDetectorDirective implements DoCheck {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  MyDetectorDirective(this._templateRef, this._viewContainer);

  void ngDoCheck() {
    print("Changes have been detected within the host component.");
  }
}
