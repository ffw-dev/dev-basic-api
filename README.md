<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This is first version of dev-basic api package.

## Features

This package is responsible for comunicating with dev-basic server for dart as well as providing necessary serialization and models that the api returns.

Install pubspec.yaml file:
```
  dev_basic_api:
    git:
      url: https://github.com/ffw-dev/dev-basic-api.git
      ref: dev_basic_clients_apis_merged
```


!!! main.dart file includes configureInjectionDependencies function which has to be called before runnApp(); !!!

```
import 'package:dev_basic_api/main.dart';
void main() async {
      configureInjectionDependencies();
      runApp(const MyApp());
}
