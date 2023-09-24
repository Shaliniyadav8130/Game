import 'package:bingo/admin_home.dart';
import 'package:bingo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EnterOtp extends StatefulWidget {
  final String verificationId;

  const EnterOtp({required this.verificationId, Key? key}) : super(key: key);

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final AuthService authService = AuthService();

    void verifyOTP(String otp) async {
      try {
        // Create a PhoneAuthCredential using the entered OTP and verification ID
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otp,
        );

        // Sign in the user with the credential
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

        // Check if the user is signed in
        if (userCredential.user != null) {
          // OTP verification successful, navigate to the next screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const AdminHome();
            }),
          );
        } else {
          // Handle authentication failure
          // You can show an error message to the user
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('OTP verification failed. Please try again.'),
          ));
        }
      } catch (e) {
        print('Error verifying OTP: $e');
        // Handle other errors that may occur during OTP verification
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1,
                    colors: [
                      Color.fromARGB(245, 72, 98, 189),
                      Color.fromARGB(245, 19, 40, 114),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 11),
                        child: Container(
                          height: height / 6.5,
                          width: width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/bingo_img.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 14.55,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 9),
                        child: const Text(
                          'Enter OTP',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 124, 23, 23),
                                offset: Offset(-4, 0),
                              ),
                            ],
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 243, 228, 174),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 53.34,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            6,
                                (index) {
                              return Padding(
                                padding: EdgeInsets.only(right: width / 72),
                                child: Container(
                                  height: height / 12.3,
                                  width: width / 6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(255, 124, 23, 23),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: width / 36, bottom: height / 80),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 5,
                                          color: const Color.fromARGB(255, 255, 209, 70),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(255, 243, 228, 174),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: otpControllers[index],
                                          cursorColor: const Color.fromARGB(255, 124, 23, 23),
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(255, 124, 23, 23),
                                          ),
                                          onChanged: (otp) {
                                            // Automatically move to the next input field when a digit is entered
                                            if (otp.length == 1) {
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: width / 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Implement the resend OTP functionality here
                              },
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(255, 124, 23, 23),
                                      offset: Offset(-4, 0),
                                    ),
                                  ],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 243, 228, 174),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 24,
                            right: width / 24,
                            bottom: height / 80),
                        child: GestureDetector(
                          onTap: () {
                            // Get the OTP entered by the user
                            String enteredOTP = otpControllers.map((controller) => controller.text).join();

                            // Verify the entered OTP
                            verifyOTP(enteredOTP);
                          },
                          child: Container(
                            height: height / 11.5,
                            width: width / 1.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromARGB(255, 124, 23, 23),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: width / 35, bottom: height / 80),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5,
                                    color:
                                    const Color.fromARGB(255, 124, 23, 23),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                  const Color.fromARGB(255, 255, 209, 70),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color:
                                          Color.fromARGB(255, 124, 23, 23),
                                          offset: Offset(5, 5),
                                          blurRadius: 40,
                                        ),
                                      ],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 124, 23, 23),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
