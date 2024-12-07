abstract final class Routes {
  /// Home routes
  static const home = '/';

  /// Auth routes
  static const login = '/login';
  static const register = '/register';

  /// Workspace routes
  static const workspace = '/workspace';
  static const timer = '/timer';

  static String workspaceDetails(String id) => '$workspace/$id';

  static String workspaceTimer(String id) => '$workspace/$id/timer';

  /// Explore routes
  static const explore = '/explore';

  static String exploreDetails(String id) => '$explore/$id';
}
