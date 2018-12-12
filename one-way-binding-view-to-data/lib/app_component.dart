import 'package:angular/angular.dart';
import 'package:myapp/src/ListLooper.dart';

@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html'
)
class AppComponent {
  final String title =  'One way binding from view to data';
  static const List<String> _images = [
    'http://beurive.com/images/logos/bower.png',
    'http://beurive.com/images/logos/ruby.png',
    'http://beurive.com/images/logos/python-logo.png',
    'http://beurive.com/images/logos/delicious.png'
  ];
  ListLooper imagesLooper = ListLooper(_images);
  String imageSrc = _images[0];

  void onClick() {
    imageSrc = imagesLooper.next();
  }

}
