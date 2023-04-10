import 'package:get/get.dart';
import 'package:tourapp/views/auth/sign_in.dart';
import 'package:tourapp/views/auth/sign_up.dart';
import 'package:tourapp/views/drawer_pages/faq.dart';
import 'package:tourapp/views/drawer_pages/how_to_use.dart';
import 'package:tourapp/views/drawer_pages/privacy.dart';
import 'package:tourapp/views/drawer_pages/profile.dart';
import 'package:tourapp/views/drawer_pages/settings.dart';
import 'package:tourapp/views/drawer_pages/support.dart';
import 'package:tourapp/views/main_home_screen.dart';
import 'package:tourapp/views/onboarding.dart';
import 'package:tourapp/views/privacy_policy.dart';
import 'package:tourapp/views/splash_screen.dart';
import 'package:tourapp/views/user_form.dart';
import 'package:tourapp/views/widgets/pages/details_screen.dart';
import 'package:tourapp/views/widgets/pages/navadd_last_step.dart';
import 'package:tourapp/views/widgets/pages/see_all_screen.dart';




const String splash = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String signup = '/sign-up-screen';
const String signin = '/sign-in-screen';
const String userForm = '/user-form-screen';
const String privacypolicy = '/privacy-policy-screen';
const String mainHomeScreen = '/main-home-screen';
const String supportScreen = '/support-screen';
const String privacyScreen = '/privacy-screen';
const String faqScreen = '/faq-screen';
const String howtoUseScreen = '/how-to-use-screen';
const String settingsScreen = '/settings-screen';
const String seeALLScreen = '/see-All-screen';
const String detailsScreen = '/details-screen';
const String navAddLastStep = '/navAddLastStep-screen';
const String profileScreen = '/profile-screen';


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
    name: mainHomeScreen,
    page: () => MainHomeScreen(),
  ),
  GetPage(
    name: supportScreen,
    page: () => Support(),
  ),
  GetPage(
    name: privacyScreen,
    page: () => Privacy(),
  ),
  GetPage(
    name: faqScreen,
    page: () => Faq(),
  ),
  GetPage(
    name: howtoUseScreen,
    page: () => How_to_use(),
  ),
  GetPage(
    name: settingsScreen,
    page: () => Settings(),
  ),
   GetPage(
    name: seeALLScreen,
    page: () => SeeALL(),
  ),

   GetPage(
    name: detailsScreen,
    page: () => DetailsScreen(),
  ),
  GetPage(
    name: navAddLastStep,
    page: () {
      NavAddLastStep _addLastStep = Get.arguments;
      return _addLastStep;
    },
  ),
   GetPage(
    name: profileScreen,
    page: () => UserProfile(),
  ),
  
    
  
  

  
];
