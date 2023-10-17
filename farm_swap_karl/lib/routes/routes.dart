import 'dart:js';

import 'package:farm_swap_karl/pages/admin_account_detials/screen/admin_details.dart';
import 'package:farm_swap_karl/pages/admin_account_page/admin_account.dart';
import 'package:farm_swap_karl/pages/admin_accounts_page/screens/admin_accounts.dart';
import 'package:farm_swap_karl/pages/admin_logs/screens/admin_logs_screen.dart';
import 'package:farm_swap_karl/pages/admin_sign_page/screens/admin_signin.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/screens/admin_signup.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/screens/admin_signup2.dart';
import 'package:farm_swap_karl/pages/admin_signup_page/screens/admin_signup3.dart';
import 'package:farm_swap_karl/pages/chat_page/screens/admin_chat_screen.dart';
import 'package:farm_swap_karl/pages/dashboard_page/screens/dashboard.dart';
import 'package:farm_swap_karl/pages/intro_page/intro_page.dart';
import 'package:flutter/material.dart';

class RoutesManager {
//VARIABLES THAT WILL HOLD THE LOCATION OR THE ROUTE
  static const introPage = "/";
  static const signInPage = "/signinpage";
  static const dashboard = "/dashboard";
  static const adminAccount = "/adminaccount";
  static const adminSignUp = "/adminsignup";
  static const adminSignUp2 = "/adminsignup2";
  static const adminsignup3 = "/adminsignup3";
  static const displayAccount = "/adminaccountsdisplay";
  static const displayadmindetails = "/adminaccountdetailsdisplay";
  static const overalladminlogs = "/overalladminlogs";
  static const adminchat = "/adminchate";

//METHOD THAT WILL SWITCH THE ROUTE BASED ON THE PROVIDED ROUTENAME
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //WHEN THE  PUSHNAMED USES INTRO PAGE, THIS WILL BE USED
      case introPage:
        return MaterialPageRoute(
          builder: (context) => const IntroPage(),
        );

      //WHEN THE PUSHNAMED USES SIGNIN PAGE THIS WILL BE USED
      case signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInAdmin(),
        );

      //WHEN THE PUSHNAMED USES DASHBOARD PAGE THIS WILL BE USED
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );

      case adminAccount:
        return MaterialPageRoute(
          builder: (context) => const AdminAccount(),
        );

      case adminSignUp:
        return MaterialPageRoute(
          builder: (context) => const AdminSignUp(),
        );

      case adminSignUp2:
        return MaterialPageRoute(builder: (context) => const AdminSignUp2());

      case adminsignup3:
        return MaterialPageRoute(builder: (context) => const AdminSignup3());

      case displayAccount:
        return MaterialPageRoute(
          builder: (context) => const AdminAccountsDisplay(),
        );
      case displayadmindetails:
        return MaterialPageRoute(builder: (context) => AdminDetails());

      case overalladminlogs:
        return MaterialPageRoute(builder: (context) => OverAllAdminLogsList());

      case adminchat:
        return MaterialPageRoute(builder: (context) => const AdminChatPage());
      default:
        throw const FormatException("No route");
    }
  }
}
