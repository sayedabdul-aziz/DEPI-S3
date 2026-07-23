enum FlavorEnv { staging, production }

class FlavorEnvironment {
  static FlavorEnv _flavorType = FlavorEnv.staging;

  static void setCurrentEnvironment(FlavorEnv type) {
    _flavorType = type;
  }

  static FlavorEnv get currentFlavor => _flavorType;
}

extension FlavorEnvExtension on FlavorEnv {
  FlavorEnvConfig get config {
    switch (this) {
      case FlavorEnv.staging:
        return FlavorStagingConfig();
      case FlavorEnv.production:
        return FlavorProductionConfig();
    }
  }
}

abstract class FlavorEnvConfig {
  String get baseUrl;
  String get geminiApiKey;
}

class FlavorStagingConfig implements FlavorEnvConfig {
  @override
  String get baseUrl => 'https://staging.com';

  @override
  String get geminiApiKey => 'gemini_api_key';
}

class FlavorProductionConfig implements FlavorEnvConfig {
  @override
  String get baseUrl => 'https://production.com';

  @override
  String get geminiApiKey => 'gemini_api_key';
}
