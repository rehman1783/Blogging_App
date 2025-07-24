import 'package:blogging_app/ui/auth/login_screen.dart';
import 'package:blogging_app/ui/auth/signup_screen.dart';
import 'package:blogging_app/ui/screens/admin_-dashboard.dart';
import 'package:blogging_app/ui/screens/blog_detail_screen.dart';
import 'package:blogging_app/ui/screens/home_screen.dart';
import 'package:blogging_app/ui/screens/main_screen.dart';
import 'package:blogging_app/ui/screens/profile_screen.dart';
import 'package:blogging_app/ui/screens/reader.dashboard.dart';
import 'package:blogging_app/ui/screens/splash_screen.dart';
import 'package:blogging_app/ui/screens/writer_dashboard.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String main = '/main';
  static const String blogDetail = '/blogDetail';
  static const String profile = '/profile';
  static const String adminDashboard = '/adminDashboard';
  static const String writerDashboard = '/writerDashboard'; 
  static const String readerDashboard = '/readerDashboard';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case main:
        return MaterialPageRoute(builder: (_) => MainScreen()); 
        case blogDetail:
        return MaterialPageRoute(builder: (_) => BlogDetailScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case adminDashboard:
        return MaterialPageRoute(builder: (_) => AdminDashboard()); 
      case writerDashboard:
        return MaterialPageRoute(builder: (_) => WriterDashboard());  
      case readerDashboard:
        return MaterialPageRoute(builder: (_) => ReaderDashboard());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
