// This example illustrates the one way binding from data to view.

import 'package:angular/angular.dart';
import 'package:myapp/src/Repeater.dart';
import 'package:myapp/src/ListLooper.dart';


/// This metadata defines data that will apply to the component "AppComponent".
@Component(
    // This is the body of the metadata. It must contain constant expressions only
    // (metadata is instantiated at compile-time). As a result, strings cannot use
    // the interpolation technique "${...}".

    // Define the HTML tag that will serve a component anchor.
    selector: 'my-app',

    // Define the template:
    // - The template can be defined within a file. In this case, use the tag
    //   "templateUrl" to specify the path to the template file.
    // - The template can be defined by a simple string. In this case use the tag
    //   "template" to specify the string. Example:
    //   template: '{{debug}}'
    templateUrl: 'app_component.html',

    // Export code that can be used from within the template.
    // Here we export nothing.
    exports: []
)

/// This class serves as a foundation for an auto-generated class that will be called
/// "AppComponentNgFactory".
/// Please note that it implements the interface "OnInit".
/// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
class AppComponent implements OnInit {
  static const List<String> _images = [
    'http://beurive.com/images/logos/bower.png',
    'http://beurive.com/images/logos/ruby.png',
    'http://beurive.com/images/logos/python-logo.png',
    'http://beurive.com/images/logos/delicious.png'
  ];
  static const List<String> _classes = ['info', 'success', 'error'];
  final String title = 'One way binding from data to view';

  /// This property is bound to a DOM property of the view.
  bool propertyHideIt = true;
  /// This property is bound to an HTML attribute the view.
  String attributeSrc = _images[0];
  String classMessage = _classes[0];
  bool styleIsBold = true;

  Repeater repeater = Repeater(10, 1);
  ListLooper imagesLooper = ListLooper(_images);
  ListLooper classesLooper = ListLooper(_classes);

  /// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
  /// Note: @override just points out that the function is also defined in an
  ///        ancestor class, but is being redefined to do something else in the
  ///        current class. It's also used to annotate the implementation of an
  ///        abstract method.
  ///        @override is optional to use but recommended as it improves readability.
  @override
  void ngOnInit() {
    repeater.go(() {
      propertyHideIt = ! propertyHideIt;
      styleIsBold = ! styleIsBold;
      attributeSrc = imagesLooper.next();
      classMessage = classesLooper.next();
    });
  }
}