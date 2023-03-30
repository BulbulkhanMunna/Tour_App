import 'package:get/get.dart';
import 'package:tourapp/views/auth/sign_in.dart';
import 'package:tourapp/views/auth/sign_up.dart';
import 'package:tourapp/views/onboarding.dart';
import 'package:tourapp/views/privacy_policy.dart';
import 'package:tourapp/views/splash_screen.dart';
import 'package:tourapp/views/user_form.dart';
import 'package:tourapp/views/widgets/bottom_nav.dart';



const String splash = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String signup = '/sign-up-screen';
const String signin = '/sign-in-screen';
const String userForm = '/user-form-screen';
const String privacypolicy = '/privacy-policy-screen';
const String bottomNav = '/bottom-nav-screen';

// control our page route flow

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnboardingScreen(),
  ),
  GetPage(
    name: signup,
    page: () => SignUp(),
  ),
  GetPage(
    name: signin,
    page: () => SignIn(),
  ),
    GetPage(
    name: userForm,
    page: () => UsrForm(),
  ),
    GetPage(
    name: privacypolicy,
    page: () => PrivacyPolicy(),
  ),

   GetPage(
    name: bottomNav,
    page: () => BottomNav(),
  ),
  
];
