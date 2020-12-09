import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/components/button.dart';
import 'package:the_jewel/components/textfield.dart';
import 'package:the_jewel/services/showtoast.dart';
import 'package:the_jewel/webservices/webservices.dart';

class RegisterActivity extends StatefulWidget {
  @override
  _RegisterActivityState createState() => _RegisterActivityState();
}

class _RegisterActivityState extends State<RegisterActivity> {
  final _usernamecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confpasswordcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _countrycontrller = TextEditingController();
  final _citycontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _picturecontroller = TextEditingController();
  bool _validateerrormsg =
      false; // this error will be toggled true if user did not fill all information about registering
  WebServices webServices = new WebServices();
  ShowToast _showToast = new ShowToast();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            RegisterBackgroundImage(),
            ColumnElements(),
          ],
        ),
      ),
    );
  } // end build

//-----------------------------Widget Tree--------------------------------------
  Widget ColumnElements() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 4.5.h,
          ),
          UserImage(),
          SizedBox(
            height: 7.0.h,
          ),
          Button(
            //register button
            onPressed: register,
            username_input: _usernamecontroller.text,
            colour: Colors.white,
            text: "register", //pass key from json file
          ),
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _usernamecontroller,
            hint_text: "signin_username",
            error_msg: _validateerrormsg ? 'Value can not be empty' : null,
          ), // username
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _passwordcontroller,
            hint_text: "signin_password",
            error_msg: _validateerrormsg ? 'Value can not be empty' : null,
          ), // password
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _confpasswordcontroller,
            hint_text: "confirmpassword",
            error_msg: _validateerrormsg ? 'Value can not be empty' : null,
          ), // confirm password
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _emailcontroller,
            hint_text: "email",
          ), // Email
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _phonecontroller,
            hint_text: "phonenumber",
          ), //phone number
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _countrycontrller,
            hint_text: "country",
          ), //country
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _citycontroller,
            hint_text: "city",
          ), // city
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            controller_text: _addresscontroller,
            hint_text: "address",
          ), // address
          SizedBox(
            height: 2.0.h,
          ),
        ],
      ),
    );
  }

//------------------------------------------------------------------------------
//-> Background Register
  Widget RegisterBackgroundImage() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'assets/register/register_background.png',
        fit: BoxFit.fill,
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget UserImage() {
    return GestureDetector(
        child: Container(
          height: 30.0.h,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/register/register_userimage.png',
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          setState(() {});
        });
  }

  //----------------------------------------------------------------------------
  Future<String> register() async {
    setState(() {
      _usernamecontroller.text.isEmpty || _passwordcontroller.text.isEmpty
          ? _validateerrormsg = true
          : _validateerrormsg = false;
    });
    // if all data is completed submit the request
    if (_validateerrormsg == false) {
      var messageResponse = await webServices.RegisterPost(
          _usernamecontroller.text,
          _phonecontroller.text,
          _passwordcontroller.text,
          _confpasswordcontroller.text,
          _emailcontroller.text,
          _countrycontrller.text,
          _citycontroller.text,
          _addresscontroller.text,
          _picturecontroller.text); // get the responose
      _showToast.showToast(messageResponse.toString());
    }
  }
  //-----------------------------------------------------------------------------
} //end class
