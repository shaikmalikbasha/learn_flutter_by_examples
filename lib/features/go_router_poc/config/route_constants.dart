class RouteMap {
  String name;
  String path;
  RouteMap({required this.name, required this.path});
}

class RouterConfigConstants {
  static RouteMap home = RouteMap(name: 'home', path: '/');
  static RouteMap profile = RouteMap(name: 'profile', path: '/profile');
  static RouteMap about = RouteMap(name: 'about', path: '/about');
  static RouteMap contact = RouteMap(name: 'contact', path: '/contact');
}
