import 'package:flutter/material.dart';
import 'package:siti/login_fresh.dart';
import 'package:flutter/material.dart';
import 'package:siti/mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // as convert
import 'package:siti/dashboard/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //You have to create a list with the type of login's that you are going to import into your application

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'siti',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(body: buildLoginFresh()));
  }

  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // develop what they want the facebook to do when the user clicks
          },
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // develop what they want the Google to do when the user clicks
          },
          logo: TypeLogo.google),
      /*
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            print("APPLE");
            // develop what they want the Apple to do when the user clicks
          },
          logo: TypeLogo.apple),

       */
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
            ));
          },
          logo: TypeLogo.userPassword),
    ];

    return LoginFresh(
      pathLogo: 'assets/logo.png',
      isExploreApp: true,
      functionExploreApp: () {
        // develop what they want the ExploreApp to do when the user clicks
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      typeLoginModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetLoginFreshUserAndPassword() {
    return LoginFreshUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () async {

          final url =  Uri.http("192.168.0.178:5000", "/log");
          final response = await http.post(url, body: json.encode({"Email" : user, "Password" : password}));

          var response2 = await http.get(Uri.http('192.168.0.178:5000', '/log'));
          var decoded = jsonDecode(response2.body) as Map<String, dynamic>;
          var status = decoded['status'];
          print('0------------------------------------------------------->   $status');

          if (status == true){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GaugeApp()),
            );
          }

          print('-------------- function call------------- ');
          print(user);
          print(password);
          print('--------------   end call   ----------------');

          isRequest(false);
        });
      },
      logo: './assets/logo_head.png',
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/logo_head.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(email);
          print('--------------   end call   ----------------');
          isRequest(false);
        });
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
    );
  }

  Widget widgetFooter() {
    return LoginFreshFooter(
      logo: 'assets/logo_footer.png',
      text: 'Power by',
      funFooterLogin: () {
        // develop what they want the footer to do when the user clicks
      },
    );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
        isFooter: true,
        widgetFooter: this.widgetFooter(),
        logo: 'assets/logo_head.png',
        funSignUp: (BuildContext _context, Function isRequest,
            SignUpModel signUpModel) {
          isRequest(true);

          print(signUpModel.email);
          print(signUpModel.password);
          print(signUpModel.repeatPassword);
          print(signUpModel.surname);
          print(signUpModel.name);

          isRequest(false);
        });
  }
}


/*
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:siti/connexion_back_end/api.dart';
//import 'package:flutter_mqtt/mqtt_client.dart';
import 'package:siti/mqtt_client/mqtt_client.dart';
//import 'package:siti/connexion_back_end/api.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:siti/screen/login_signup.dart';

void main() {
  runApp(LoginSignupUI());
}

class LoginSignupUI extends StatelessWidget {
  const LoginSignupUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Signup UI",
      home: LoginSignupScreen(),
    );
  }
}

 */


