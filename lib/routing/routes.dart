abstract final class Routes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';

  /// Workspace
  static const workspace = '/workspace';

  static String workspaceDetails(String id) => '$workspace/$id';

  static String workspaceTimer(String id)  => '$workspace/$id/timer';

  /// Explore
  static const explore = '/explore';
  static String exploreDetails (String id) => '$explore/$id';

}
