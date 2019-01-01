// This file implement a (really) dummy structural directive that does nothing
// interesting, from a functional point of view. It used to illustrates the
// following concepts:
//
// - Data-bound property
// - Input template variable
// - Directive local names
// - The "$implicit" directive local name.
// - The life cycle hook "ngOnChanges".

import 'package:angular/angular.dart';

// The directive attribute name ("myDummy" in this case) should be spelled
// in lowerCamelCase and begin with a prefix.
@Directive(
    selector: '[myDummy]'
)

// We could (and should) have implemented the interface "AfterChanges".
// But, for the sake of experimentation, we implement the interface "OnChanges".
class MyDummyDirective implements OnChanges {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;
  bool _initialized = false;

  // This line makes reference to the statement below (within the component template):
  //
  //     <div *myDummy="...; position:index; ...">
  //
  // The data-bound property alias "myDummyPosition" comes from the following elements:
  // * The name of the directive within the context of the component template (that is, "myDummy").
  // * The name of the directive data-bound property ("position"), as seen from the component template.
  //
  // "myDummy" + ucfirst("position") => myDummyPosition
  //
  // Note: "ucfirst" makes reference to PHP (http://php.net/manual/en/function.ucfirst.php).

  @Input('myDummyPosition') // This is an alias that makes sense in the template.
  int dbp_position; // This is a data-bound property.

  @Input('myDummyOf') // This is an alias that makes sense in the template.
  List<String> dbp_of; // This is a data-bound property.

  MyDummyDirective(this._templateRef, this._viewContainer);

  // this hook is executed whenever at least one data-bound property changes.
  // The hook receives as parameters a map that lists the states of all data-bound
  // properties (changed or unchanged).
  void ngOnChanges(Map changes) {
    print('MyDummyDirective.position = ${dbp_position}');
    print('MyDummyDirective.of = ${dbp_of}');
    print(changes);

    if (!_initialized) {
      _viewContainer.createEmbeddedView(_templateRef);
      _initialized = true;
    }

    // "directive_id" is a "directive local name".
    _viewContainer.get(0).setLocal('directive_id', 'MyDummyDirective');
    // "pos" is a "directive local name".
    _viewContainer.get(0).setLocal('pos', dbp_position);
    // "$implicit" is a "directive local name".
    _viewContainer.get(0).setLocal('\$implicit', dbp_of[dbp_position]);
  }
}