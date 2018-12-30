import 'package:angular/angular.dart';

// The directive attribute name ("myMsExplorer" in this case) should be spelled
// in lowerCamelCase and begin with a prefix.
@Directive(
    selector: '[myDummy]'
)

class MyDummyDirective implements DoCheck {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;
  bool _initialized = false;

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

  @Input('myDummyPosition') // This is an alias that makes sense in the template.
  int position; // This is a data-bound property.

  @Input('myDummyOf') // This is an alias that makes sense in the template.
  List<String> of; // This is a data-bound property.

  MyDummyDirective(this._templateRef, this._viewContainer);

  /// What does "ngDoCheck" do ?
  ///
  /// The presence of the hook "ngDoCheck" tells Angular to watch for any change
  /// on the values of the data bound properties of the directive. If the value
  /// of a data bound property changes, then the hook is executed.
  ///
  /// Note: here, we have 2 data-bound properties:
  ///       - variable
  ///       - of
  ///
  /// What would happen if you choose to use the hook "ngOnInit" instead of
  /// "[ngDoCheck]" ? If you use "ngOnInit", then the host element will be modified
  /// **only once** by the structural directive. Any change to a data-bound property
  /// will just have no effect.

  void ngDoCheck() {
    print('MyDummyDirective.position = ${position}');
    print('MyDummyDirective.of = ${of}');
    if (!_initialized) {
      _viewContainer.createEmbeddedView(_templateRef);
      _initialized = true;
    }

    _viewContainer.get(0).setLocal('directive_id', 'MyDummyDirective');
    _viewContainer.get(0).setLocal('pos', position);
    _viewContainer.get(0).setLocal('\$implicit', of[position]);
  }
}