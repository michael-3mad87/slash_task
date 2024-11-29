import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:slash_task/core/di/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
void configureDependencies() => serviceLocator.init();
