class ServerAddresses {

  static const String _baseUrl = 'https://api.spacexdata.com/v4/';


  static const String _nextLaunch    = 'launches/next';
  static const String _pastLaunches  = 'launches/past';
  static const String _payloads      = "payloads";
  static const String _launchpadById = 'launchpads/';
  static const String _launchById    = 'launches/';
  static const String _rocketById    = 'rockets/';


  /// Should see => time remaining until the next rocket launch.
  static String get nextLaunch => _baseUrl + _nextLaunch;


  /// Should see => The name and the date of each launch should be in the list.
  ///               Filter past launches between two dates.
  static String get pastLaunches => _baseUrl + _pastLaunches;


  /// navigate to a page with the following details on the launch:
  /// 1. Information about the launch (Name, date, launchpad)
  /// 2. Information about the rocket
  /// 3. Information about the payload
  /// 4. Go to the video of the launch
  static String get launchById => _baseUrl + _launchById; /// + id of the launch


  /// Must see in specific launch screen.
  static String get rocketById => _baseUrl + _rocketById; /// + id of the rocket


  /// Must see in specific launch screen all this launch payloads.
  static String get payloads => _baseUrl + _payloads; /// + id of the rocket


  /// Must see in specific launch screen.
  static String get launchpadById => _baseUrl + _launchpadById; /// + id of the launchpad
}