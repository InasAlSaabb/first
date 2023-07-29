import '../network_config.dart';
class PostEndpoints{
  static String getAll=NetworkConfig.getFullApiRoute('/posts/');
  static String create=NetworkConfig.getFullApiRoute('/posts/');
  static String update=NetworkConfig.getFullApiRoute('/posts/');
  static String delete=NetworkConfig.getFullApiRoute('/posts/');
}
