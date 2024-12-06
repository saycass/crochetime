abstract final class Routes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';

  /// Workspace
  static const workspace = '/workspace';

  static String workspaceDetails(int id) => '$workspace/$id';

  static String workspaceTimer(int id)  => '$workspace/$id/timer';

  /// Explore
  static const explore = '/explore';
  static String exploreDetails (int id) => '$explore/$id';
}
