import 'package:angular/angular.dart';

// The directive attribute name ("myMsExplorer" in this case) should be spelled
// in lowerCamelCase and begin with a prefix.
@Directive(
    selector: '[myDummy]'
)

class MyDummyDirective implements OnInit {
  // See "TemplateRef and ViewContainerRef" at https://webdev.dartlang.org/angular/guide/structural-directives.
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  MyDummyDirective(TemplateRef templateRef, ViewContainerRef viewContainer) {
    _templateRef = templateRef;
    _viewContainer = viewContainer;
  }

  @Input('let-d')
  List<int> d;

  void ngOnInit() {
    print("One instance of MyDummyDirective is instantiated.");
    EmbeddedViewRef vr = _viewContainer.createEmbeddedView(_templateRef);
    vr.setLocal('d', [1,2,3]);
    print(d.toString());
  }
}