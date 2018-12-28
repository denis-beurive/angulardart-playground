import 'package:angular/angular.dart';

// The directive attribute name ("myMsExplorer" in this case) should be spelled
// in lowerCamelCase and begin with a prefix.
@Directive(
    selector: '[myDummy]'
)

class MyDummyDirective implements OnInit {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  @Input('myDummyVariable')
  String variable;

  MyDummyDirective(TemplateRef templateRef, ViewContainerRef viewContainer) {
    print("One instance of MyDummyDirective is instantiated.");
    _templateRef = templateRef;
    _viewContainer = viewContainer;

    _viewContainer.createEmbeddedView(_templateRef);
    print("_viewContainer.length = ${_viewContainer.length.toString()}");
    _viewContainer.get(0).setLocal('data', 'MyDummyDirective.data');

  }

  void ngOnInit() {
    // WARNING: the property "variable" has no value assigned within the constructor.
    print('MyDummyDirective.variable = ${variable}');
    _viewContainer.get(0).setLocal('var', 'This is ' + variable);
  }
}