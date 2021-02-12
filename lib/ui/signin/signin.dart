import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/services/sharedpref.dart';
import 'package:the_jewel/services/showtoast.dart';
import 'package:the_jewel/services/snackbarmessage.dart';
import 'package:the_jewel/ui/navigation.dart';
import 'package:the_jewel/ui/register.dart';
import 'package:the_jewel/webservices/Signin/Login.dart';
import 'package:the_jewel/webservices/webservices.dart';

class SignIn extends StatefulWidget {
  static final id = 'sign_in';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //-----------------------------Varaibles--------------------------------------
  bool _isHidden = false; // this is for hide / show the password
  bool _saving = false;
  bool _rememberme = false; // checkbox state
  final TextEditingController username_text =
      TextEditingController(); // variable for holding username
  final TextEditingController password_text =
      TextEditingController(); // variable for holding password
  bool validatorUsername = false;
  bool validatorPassword = false;
  snackbarMessage snackmessage = snackbarMessage();
  WebServices webServices = new WebServices();
  ShowToast _showToast = new ShowToast();
  SharedPref sharedPref = new SharedPref();
  //----------------------------------------------------------------------------
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getLoginInfo();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: Scaffold(
        //resizeToAvoidBottomInset:       false, // to avoid overflow when keyboard opens or just wrap the content with singlechildscrollview
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignInImageBackground(),
                UsernameInput(),
                PasswordInput(),
                RememberMeCheckBox(),
                SizedBox(
                  height: 3.0.h,
                ),
                SignInButton(),
                NoAccountButton(),
                SignInAsGuestButton(),
              ],
            ),
          ),
        ),
      ),
      inAsyncCall: _saving,
    );
  } // end build

//--------------------------Widget Tree----------------------------------------
  //-> sign in background
  Widget SignInImageBackground() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 51.0.h,
          child: Image.asset(
            'assets/signin/signin_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child:
              SignInIcon(), // stacking icon in the botto of the background at the right postion
        ),
      ],
    );
  }

  //-> Widget Sign in user Icon
  Widget SignInIcon() {
    return Container(
      // fit: BoxFit.contain,
      child: Image.asset(
        'assets/signin/signin_icon.png',
        fit: BoxFit.contain,
      ),
    );
  }

//----------------------------------Username------------------------------------
  //-> Text view of username
  Widget UsernameTextView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0),
      child: Text(
        "signin_username".tr().toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16.0.sp,
          color: Color(0xFF707070),
        ),
      ),
    );
  }

  //-> Username Input
  Widget UsernameInput() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        controller: username_text,
        decoration: InputDecoration(
            // hintText: 'Enter u',
            errorText:
                validatorUsername ? "valuecannotbeempty".tr().toString() : null,
            labelText: "signin_username".tr().toString(),
            suffixIcon: Icon(Icons.sentiment_satisfied_alt)),
      ),
    );
  }

//---------------------------------Password Input-------------------------------
  //-> password user
  Widget PasswordInput() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        autofocus: false,
        obscureText: _isHidden,
        controller: password_text,
        decoration: InputDecoration(
          errorText:
              validatorPassword ? "valuecannotbeempty".tr().toString() : null,
          labelText: "signin_password".tr().toString(),
          suffix: InkWell(
            onTap: () {
              setState(() {
                _isHidden = !_isHidden;
              });
            },
            child:
                _isHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          ),

          // helperText: "Please put your password",
        ),
      ),
    );
  }

//---------------------------Remember Password----------------------------------
  //-> CheckBox for remember password
  Widget RememberMeCheckBox() {
    return Container(
      //alignment: Alignment.bottomLeft,
      width: double.infinity,
      color: Colors.transparent,
      height: 7.0.h,
      child: CheckboxListTile(
        activeColor: Colors.black87,
        controlAffinity:
            ListTileControlAffinity.leading, // to make checkbox left aligned
        title: Text(
          "rememberme".tr().toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12.0.sp,
            color: Color(0xFF2D2E39),
          ),
        ),
        secondary: Icon(Icons.privacy_tip),
        value: _rememberme,
        onChanged: (bool value) {
          setState(() {
            _rememberme = value; //checkbox remember me
            if (_rememberme == true) {
              sharedPref.setData('signin_username',
                  username_text.text); // save username to shared pref
              sharedPref.setData('signin_password',
                  password_text.text); // save password to shared pref
            }

            // if user changed to not rememmber it will add null for loading null data
            if (_rememberme == false) {
              sharedPref.setData(
                  'signin_username', null); // save username to shared pref
              sharedPref.setData(
                  'signin_password', null); // save password to shared pref
            }
          });
        },
      ),
    );
  }

//---------------------------------Sign In--------------------------------------
  //-> Button for Sign in
  Widget SignInButton() {
    return Container(
      width: 170,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color(0xff2d2e39),
      ),
      child: TextButton(
        onPressed: () async {
          // check if the text field all is not empty
          setState(() {
            username_text.text.isEmpty
                ? validatorUsername = true
                : validatorUsername = false;

            password_text.text.isEmpty
                ? validatorPassword = true
                : validatorPassword = false;
          });

          // if username and password are empty return
          if (validatorUsername || validatorPassword) {
            return;
          }
          setState(() {
            _saving = true;
          });

          Login login = await webServices.LoginPost(
              username_text.text, password_text.text);
          var messageResponse = login.message; // get the message from the api
          var userId =
              login.customerId; //  get the user id and save it to shared

          // var messageResponse = await webServices.LoginPost(
          //     username_text.text, password_text.text); // get the responose
          //print(messageResponse);
          _showToast.showToast(messageResponse.toString());

          setState(() {
            _saving = false;
          });
          //  if we have a success user login in then navigate to another activity
          if (messageResponse == 'login success') {
            sharedPref.setData(
                'userID', userId.toString()); // save the user id to shared pref
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NavigationBar()));
          }
        },
        child: Text(
          "signin_button".tr().toString(),
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(),
      ),
    );
  }

//---------------------------Don't have an account------------------------------
  //-> Don't have account button
  Widget NoAccountButton() {
    return Container(
      height: 40,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RegisterActivity(),
            ),
          );
        },
        child: Text(
          "havenoaccount".tr().toString(),
          style: TextStyle(
            color: Color(0xFF2D2E39),
          ),
        ),
        style: ButtonStyle(),
      ),
    );
  }

//---------------------------Sign in as Guest----------------------------------
  Widget SignInAsGuestButton() {
    return Container(
      width: 40.0.w,
      height: 5.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color(0xfffdb952),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _saving = true;
          });
        },
        child: Text(
          "signinasguest".tr().toString(),
          style: TextStyle(color: Color(0xFF2D2E39), fontSize: 10.0.sp),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------
//****************************Functions*****************************************
  //-> this function will check if there is username and password saved in shared pref
  void getLoginInfo() async {
    String username_sharedpref; // get username from shared pref
    String password_sharedpref; // get password from shared pref
    username_sharedpref = await sharedPref.LoadData('signin_username');
    password_sharedpref = await sharedPref.LoadData('signin_password');
    if (username_sharedpref != null && password_sharedpref != null) {
      setState(() {
        username_text.text = username_sharedpref.toString();
        password_text.text = password_sharedpref.toString();
        _rememberme = true; // change the remember check box to true
      });
    }
  }
//------------------------------------------------------------------------------
} // end class
//TODO: get the user id and save it to shared pref
