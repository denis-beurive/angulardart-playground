import 'package:angular/angular.dart';

// The directive attribute name ("myMsExplorer" in this case) should be spelled
// in lowerCamelCase and begin with a prefix.
@Directive(
    selector: '[myDummy]'
)

class MyDummyDirective implements OnInit {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  // This line makes reference to the statement below (within the component template):
  //
  //     <div *myDummy="...; variable:'value'; ...">
  //
  // The alias "myDummyVariable" comes from the following elements:
  // * The name of the directive within the context of the component template (that is, "myDummy").
  // * The name of the directive configuration parameter ("variable"), as seen from the component template.
  //
  // "myDummy" + ucfirst("variable") => myDummyVariable
  //
  // Note: "ucfirst" makes reference to PHP (http://php.net/manual/en/function.ucfirst.php).
  @Input('myDummyVariable')
  String variable;

  // Same comment that for "myDummyVariable".
  @Input('myDummyOf')
  List<String> of;

  MyDummyDirective(TemplateRef templateRef, ViewContainerRef viewContainer) {
    print("One instance of MyDummyDirective is instantiated.");
    _templateRef = templateRef;
    _viewContainer = viewContainer;
    _viewContainer.createEmbeddedView(_templateRef);
    print("_viewContainer.length = ${_viewContainer.length.toString()}");
    _viewContainer.get(0).setLocal('data', 'MyDummyDirective.data');
  }

  void ngOnInit() {
    // WARNING: the properties "variable" and "of" have no value assigned within
    //          the constructor.
    print('MyDummyDirective.variable = ${variable}');
    print('MyDummyDirective.of = ${of}');
    _viewContainer.get(0).setLocal('var', 'This is ' + variable);
    _viewContainer.get(0).setLocal('\$implicit', of);
  }
}