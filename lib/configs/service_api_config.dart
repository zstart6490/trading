import 'constants.dart';

abstract class BaseConfig {
  EnvironmentConfiguration get environment;
  String get host;
  String get protocol;
  String get appName;
  String get appBundle;
}


class DevConfig implements BaseConfig {
  @override
  EnvironmentConfiguration get environment => EnvironmentConfiguration.develop;
  @override
  String get host => "dev-api.trading.vn";
  @override
  String get protocol => "https://";
  @override
  String get appName => "Trading-Dev";
  @override
  String get appBundle => "com.trading.dev";
}


class StagingConfig implements BaseConfig {
  @override
  EnvironmentConfiguration get environment => EnvironmentConfiguration.staging;
  @override
  String get host => "stg-api.trading.vn";
  @override
  String get protocol => "https://";
  @override
  String get appName => "Trading-Stg";
  @override
  String get appBundle => "com.trading.stg";
}


class ProdConfig implements BaseConfig {
  @override
  EnvironmentConfiguration get environment => EnvironmentConfiguration.product;
  @override
  String get host => "api.trading.vn";
  @override
  String get protocol => "https://";
  @override
  String get appName => "Trading";
  @override
  String get appBundle => "com.trading";
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();
  static final Environment _singleton = Environment._internal();

  BaseConfig config =  DevConfig();

  initConfig(EnvironmentConfiguration environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(EnvironmentConfiguration environment) {
    switch (environment) {
      case EnvironmentConfiguration.product:
        return ProdConfig();
      case EnvironmentConfiguration.staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }


  String get backendUrl => '$config.protocol$config.host/';
  bool get isProduct => config.environment == EnvironmentConfiguration.product;
}