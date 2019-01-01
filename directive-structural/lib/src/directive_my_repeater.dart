// This file implements a structural directive that adds and removes copies of
// its template (according to the value of its data-bound property "count").

import 'package:angular/angular.dart';

@Directive(
    selector: '[myRepeater]'
)
class MyRepeaterDirective implements AfterChanges {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;
  int _lastCount=0;

  @Input('myRepeaterCount')
  int count;

  MyRepeaterDirective(this._templateRef, this._viewContainer);

  // This hook is executed whenever at least one data-bound property changes.
  void ngAfterChanges() {
    if (count > _lastCount) {
      for (int i=_lastCount; i<count; i++) {
        _viewContainer.createEmbeddedView(_templateRef);
        _viewContainer.get(i).setLocal('index', i);
      }
    } else {
      for(int i=_lastCount-1; i>=count; i--) {
        _viewContainer.remove(i);
      }
    }
    _lastCount = count;
  }
}