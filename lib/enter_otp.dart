import 'package:bingo/admin_home.dart';
import 'package:bingo/services/auth_service.dart';
import 'package:flutter/material.dart';

class EnterOtp extends StatefulWidget {

  const EnterOtp({super.key});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final AuthService authService = AuthService();

    

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
                            4,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(right: width / 72),
                                child: Container(
                                  height: height / 12.3,
                                  width: width / 6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(255, 124, 23, 23),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: width / 36, bottom: height / 80),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 5,
                                          color: const Color.fromARGB(
                                              255, 255, 209, 70),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 243, 228, 174),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          // maxLength: 1,
                                          cursorColor: const Color.fromARGB(
                                              255, 124, 23, 23),
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(
                                                255, 124, 23, 23),
                                          ),
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
                              onPressed: () {},
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
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: ((context) {
                              return const AdminHome();
                            })));
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
