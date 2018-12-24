import 'dart:html';
import 'package:angular/angular.dart';
import 'package:myapp/src/Repeater.dart';

// Please note the following line:
//
//   exportAs: 'blinker'
//
// The instance of the class "DirectiveMyBlinker" will be available within the
// template under the name "blinker". Thus, within the template, we can write
// something like:
//
//   <p><span my-blinker #tplRefBlinker="blinker" >This will blink</span></p>
//   {{tplRefBlinker.count}}

@Directive(
    selector: '[my-blinker]',
    exportAs: 'blinker'
)
class DirectiveMyBlinker {
  Repeater r;
  DirectiveMyBlinker(Element hostElement) {
    r = Repeater(20, 1);
    r.go(() {
      hostElement.style.backgroundColor = r.count % 2 == 0 ? '#BDB76B' : '';
    });
  }
  // This getter will be used directly from the template, through a template reference.
  // The template reference will be assigned to this instance (using the exported name - defined by the @Directive attribute "exportAs").
  int get count => r.count;
}

