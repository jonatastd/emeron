import 'package:emeron/core/enviroment/base_env.config.dart';

class EmeronDevelopmentEnvConfig extends BaseEnvConfig {
  @override
  String get api => 'http://127.0.0.1:3334/v1';
}
