import 'package:angular/angular.dart';

@Directive(
    selector: '[myRepeater]'
)
class MyRepeaterDirective implements OnInit {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  @Input('myRepeaterCount')
  int count;

  MyRepeaterDirective(TemplateRef templateRef, ViewContainerRef viewContainer) {
    _templateRef = templateRef;
    _viewContainer = viewContainer;
  }

  /// [ngOnInit] is called right after the component or directive's data-bound
  /// properties have been checked for the first time, and before any of its
  /// children have been checked. It is normally only invoked once when the
  /// directive is instantiated.
  void ngOnInit() {
    // Please note that we could (and should) have put all the code within a
    // single loop block. However, for the sake of the demonstration, it is
    // interesting to show that we can clearly the creation of a new template
    // instance from tis customisation.

    for (int i=0; i<count; i++) {
      _viewContainer.createEmbeddedView(_templateRef);
    }

    for (int i=0; i<_viewContainer.length; i++) {
      _viewContainer.get(i).setLocal('index', i);
    }
  }
}