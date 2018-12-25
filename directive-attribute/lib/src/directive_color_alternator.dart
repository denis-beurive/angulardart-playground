// This example illustrates the use of directive input parameters.

import 'dart:html';
import 'package:angular/angular.dart';

@Directive(
    selector: '[my-color-alternator]'
)
class DirectiveColorAlternator implements OnInit {

  Element _hostElement;

  // Please note that we give the property "colorOdd" an alias ("odd" in this case).
  // Thus, instead of using the name "colorOdd" within the template, we use the name "odd".
  @Input('odd')
  String colorOdd; // 1, 3, 5...

  // Please note that we give the property "colorEven" an alias ("even" in this case).
  // Thus, instead of using the name "colorEven" within the template, we use the name "even".
  @Input('even')
  String colorEven; // 0, 2, 4...

  // *******************************************
  // **** VERY BIG WARNING HERE - WATCH OUT ****
  // *******************************************
  //
  // The values below are not available in the constructor !!!
  //     - colorOdd
  //     - colorEven
  //     - hostElement.innerHtml
  //
  // Why ? The answer (or, at least, a hint) may be found here:
  // https://github.com/angular/angular/issues/6525
  //
  // Note : try adding the line below to the constructor.
  //        Future.delayed(Duration(seconds: 1)).then((var v) { print("${colorEven}"); });
  //        The value of the property "colorEven" will be printed.
  //
  // See: https://webdev.dartlang.org/angular/guide/lifecycle-hooks

  DirectiveColorAlternator(this._hostElement);

  // See: https://webdev.dartlang.org/angular/guide/lifecycle-hooks
  //
  // Initialize the directive/component after Angular first displays the
  // data-bound properties and sets the **directive/component’s input properties**.

  void ngOnInit() {
    List<String> characters = _hostElement.innerHtml.split('');
    List<String> newContent = [];

    for (int i=0; i<characters.length; i++) {
      newContent.add(0 == i % 2 ? _htmlColorize(characters[i], colorEven) : _htmlColorize(characters[i], colorOdd));
    }

    // *******************************************
    // **** VERY BIG WARNING HERE - WATCH OUT ****
    // *******************************************
    //
    // The method "setInnerHtml" is **VERY** bitchy !!!
    // You may notice that very soon !
    _hostElement.setInnerHtml(newContent.join(''));
  }

  String _htmlColorize(String text, String color) => "<font color=\"${color}\">${text}</font>";
}