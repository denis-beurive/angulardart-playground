import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';
import 'package:sprintf/sprintf.dart';
import 'package:myapp/src/ckecked_property.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',

    // *****************************
    // Do not forget the line below:
    // *****************************
    directives: const [formDirectives],

    // Export code that can be used from within the template.
    // Here we export nothing.
    exports: []
)

/// This class serves as a foundation for an auto-generated class that will be called
/// "AppComponentNgFactory".
/// Please note that it implements the interface "OnInit".
/// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
class AppComponent {
  static const String title = 'Two-way binding';
  String textNumber = "10";
  String selectNumber = "1";
  int factor = 1;

  // The variables below are used to control the radio buttons.
  static CheckedProperty sf1 = CheckedProperty(true);
  static CheckedProperty sf2 = CheckedProperty(false);
  static CheckedProperty sf3 = CheckedProperty(false);
  Map<int, CheckedProperty> radios = {1: sf1, 2: sf2, 3: sf3};

  void onChange(dynamic event) {
    factor = int.parse(event.target.value);
    print("Factor: " + factor.toString());
    textNumber = (int.parse(textNumber) * factor).toString();
    selectNumber = factor.toString();

    if ('input' == event.target.toString()) {
      // The change comes from a radio box.
      selectNumber = factor.toString();
    } else {
      // The change comes from the selection list.
      for (int i=1; i<=3; i++) {
        radios[i].checked =  i == factor;
      }
    }

    // The purpose of the code below is to show that Angular manipulates (DOM)
    // properties, not (HTML) attributes. Although the radio buttons get selected,
    // the attribute "checked" is not set.
    // Please note that if you try to manipulate the (HTML) attributes of the radio
    // buttons, then it will not work fine.
    for (int i=1; i<=3; i++) {
      Element e = querySelector(sprintf('#f%d', [i]));
      print(sprintf('#f%d', [i]) + "  " + e.attributes.toString());
    }
  }
}
