abstract final class Routes {
  /// Home routes
  static const root = Route('/');

  /// Wishlist routes
  static const wishlist = Route('/wishlist', root);

  /// Workspace routes
  static const workspace = Route('/workspace', root);
  static const workspaceDetails = Route('/:id', workspace);
  static const workspaceCreate = Route('/create', workspace);

  /// StopWatch routes
  static const stopwatch = Route('/stopwatch', root);
  static const stopwatchDetails = Route('/:id', stopwatch);

  /// Explore routes
  static const explore = Route('/explore', root);
  static const exploreDetails = Route('/:id', explore);
}

class Route {
  final String path;
  final Route? root;

  const Route(
    this.path, [
    this.root,
  ]);

  String get complete {
    final root = this.root?.complete ?? '';
    return root.endsWith('/')
        ? '$root${path.replaceFirst('/', '')}'
        : '$root$path';
  }

  String withId(String value) {
    return complete.replaceAll(':id', value);
  }

  @override
  String toString() => complete;
}
