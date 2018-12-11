// This example illustrates the one way binding from data to view.

import 'package:angular/angular.dart';
import 'dart:async';

typedef void TimeDoer();


/// This class implements a component that executes a given function periodically.
class LooperTime {
  final int _total;
  final int _delay;
  int _count=0;
  LooperTime(this._total, this._delay);
  void go(TimeDoer f) {
    Future.delayed(Duration(seconds: _delay)).then((var v) {
      f();
      if (_count < _total) {
        _count++;
        go(f);
      }
    });
  }
}

class LooperList {
  final List<String> _list;
  int _index=0;
  LooperList(this._list);
  String next() {
    _index = ++_index % _list.length;
    return _list[_index];
  }
}

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
  final String title = "One way binding from data to view";

  /// This property is bound to a DOM property of the view.
  bool propertyHideIt=true;
  /// This property is bound to an HTML attribute the view.
  String attributeSrc=_images[0];

  LooperTime looperTime = LooperTime(10, 1);
  LooperList looperList = LooperList(_images);

  /// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
  void ngOnInit() {
    looperTime.go(() {
      propertyHideIt = ! propertyHideIt;
      attributeSrc = looperList.next();
    });
  }
}