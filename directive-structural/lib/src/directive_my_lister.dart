import 'package:angular/angular.dart';

// The directive attribute name ("myMsExplorer" in this case) should be spelled
// in lowerCamelCase and begin with a prefix.
@Directive(
    selector: '[myLister]'
)
// The micro syntax for this directive is:
//
//   *myLister="let list From <items list> [evenColor '<color>'] [oddColor '<color>']"
//
// Note: brackets are used to designate an optional statement. That is "[<optional statement>]".
//
// For example:
//
//   *myLister="let list From <items list>"
//   *myLister="let list From [<items>] evenColor <color>"
//   *myLister="let list From [<items>] oddColor <color>"
//   *myLister="let list From [<items>] evenColor <color> oddColor <color>"

class MyListerDirective implements OnInit {
  // See "TemplateRef and ViewContainerRef" at https://webdev.dartlang.org/angular/guide/structural-directives.
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  // The name of this property come from the micro syntax:
  // *myLister="let list From <items list>" => myListerFrom
  @Input('myListerFrom')
  List<String> listFrom; // = <items list>

  // The name of this property come from the micro syntax:
  // myLister="let list From [<items>] evenColor <color>" => myListerEvenColor
  @Input('myListerEvenColor')
  String evenColor; // = <color>

  // The name of this property come from the micro syntax:
  // *myLister="let list From [<items>] oddColor <color>" => myListerOddColor
  @Input('myListerOddColor')
  String oddColor; // = <color>

  MyListerDirective(this._templateRef, this._viewContainer);

  void ngOnInit() {
    print(listFrom);
    print(evenColor);
    print(oddColor);
  }

}