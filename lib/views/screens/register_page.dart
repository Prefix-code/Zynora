import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/views/screens/login_page.dart';
import 'package:marketky/views/screens/otp_verification_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordHidden = true;
  bool _isRepeatPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sign up',
          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg'),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark, // 👈 White BG + dark icons
      ),

      // Bottom Text (Already have account?)
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: AppColor.secondary.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Sign in',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        physics: BouncingScrollPhysics(),
        children: [
          // Header
          SizedBox(height: 20),
          Text(
            'Welcome to MarketKy 👋',
            style: TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.w700,
              fontFamily: 'poppins',
              fontSize: 20,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing \nelit, sed do eiusmod ',
            style: TextStyle(color: AppColor.secondary.withOpacity(0.7), fontSize: 12),
          ),
          SizedBox(height: 32),

          // Full Name
          buildTextField('Full Name', SvgPicture.asset('assets/icons/Profile.svg', color: AppColor.primary)),
          SizedBox(height: 16),

          // Username
          buildTextField('Username', Text('@', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColor.primary))),
          SizedBox(height: 16),

          // Email
          buildTextField('youremail@email.com',
              SvgPicture.asset('assets/icons/Message.svg', color: AppColor.primary),
              inputType: TextInputType.emailAddress),
          SizedBox(height: 16),

          // Password
          buildPasswordField('Password', _isPasswordHidden, () {
            setState(() => _isPasswordHidden = !_isPasswordHidden);
          }),
          SizedBox(height: 16),

          // Repeat Password
          buildPasswordField('Repeat Password', _isRepeatPasswordHidden, () {
            setState(() => _isRepeatPasswordHidden = !_isRepeatPasswordHidden);
          }),
          SizedBox(height: 24),

          // Sign Up Button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTPVerificationPage()));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 18),
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: Text(
              'Sign up',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),

          // Divider
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'or continue with',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),

          // Google Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primarySoft,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.symmetric(vertical: 12),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/Google.svg'),
                SizedBox(width: 16),
                Text(
                  'Continue with Google',
                  style: TextStyle(color: AppColor.secondary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  // Reusable TextField
  Widget buildTextField(String hint, Widget prefix, {TextInputType inputType = TextInputType.text}) {
    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Container(padding: EdgeInsets.all(12), child: prefix),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.border), borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.primary), borderRadius: BorderRadius.circular(8)),
        fillColor: AppColor.primarySoft,
        filled: true,
      ),
    );
  }

  // Reusable Password Field
  Widget buildPasswordField(String hint, bool isHidden, VoidCallback toggle) {
    return TextField(
      obscureText: isHidden,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Container(
          padding: EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/Lock.svg', color: AppColor.primary),
        ),
        suffixIcon: IconButton(
          onPressed: toggle,
          icon: SvgPicture.asset(isHidden ? 'assets/icons/Hide.svg' : 'assets/icons/Show.svg', color: AppColor.primary),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.border), borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.primary), borderRadius: BorderRadius.circular(8)),
        fillColor: AppColor.primarySoft,
        filled: true,
      ),
    );
  }
}
