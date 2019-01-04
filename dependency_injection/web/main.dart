import 'package:angular/angular.dart';
import 'package:myapp/app_component.template.dart' as ng;
import 'package:myapp/src/session_service.dart';
import 'package:myapp/app_component_session_service.dart';

// Here we declare the service provider called "AppComponentSessionService".
// This service provider will be available "application wide".

final InjectorFactory createInjector = ([Injector parent]) {
  return Injector.map({
    AppComponentSessionService: SessionService()
  }, parent);
};

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: createInjector);
}
