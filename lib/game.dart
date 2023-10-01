import 'package:bingo/game_win.dart';
import 'package:bingo/models/numbers.dart';
import 'package:bingo/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final List bingo =['B', 'I', 'N', 'G', 'O'];

    return Consumer<Numbers>(
      builder: (BuildContext context,Numbers obj,Widget? child){
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(left: width / 20, top: height / 25),
                            child: SizedBox(
                              height: height / 14,
                              width: width / 6,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(255, 124, 23, 23),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: width / 70, bottom: height / 140),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 5,
                                        color:
                                        const Color.fromARGB(255, 255, 209, 70),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                      const Color.fromARGB(255, 243, 228, 174),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Color.fromARGB(255, 124, 23, 23),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: width / 20, top: height / 25),
                            child: SizedBox(
                              height: height / 13.34,
                              width: width / 2.8,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(255, 124, 23, 23),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: width / 70, bottom: height / 140),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 5,
                                        color:
                                        const Color.fromARGB(255, 255, 209, 70),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                      const Color.fromARGB(255, 243, 228, 174),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: width / 72),
                                        ),
                                        Container(
                                          height: height / 22.85,
                                          width: width / 11,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: const Color.fromARGB(
                                                255, 124, 23, 23),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 40,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                      return const Profile();
                                                    }));
                                          },
                                          child: const Text(
                                            'Dhruvil',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color:
                                              Color.fromARGB(255, 124, 23, 23),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Column(
                        children: [
                          Container(
                            height: height / 4,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 124, 23, 23),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: width / 35, bottom: height / 80),
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
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                      const Color.fromARGB(255, 255, 162, 41),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) {
                                                return const GameWin();
                                              }));
                                        },
                                        child: const Text(
                                          'Youtube live \n  video here',
                                          style: TextStyle(
                                            fontSize: 20,
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
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
                                    padding: EdgeInsets.only(
                                        right: width / 80, bottom: height / 100),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: const Color.fromARGB(
                                              255, 255, 244, 189),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        color: (index+1<=obj.progress)?Color.fromARGB(100, 255, 212, 69):
                                        Color.fromARGB(255, 255, 212, 69),
                                      ),
                                      child: Center(
                                        child: Text(
                                          bingo[index],
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(255, 124, 23, 23),
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
                      SizedBox(
                        height: height / 100,
                      ),
                      Column(
                        children: [
                          Container(

                            width: width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 124, 23, 23),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: width / 35, bottom: height / 80),
                              child: Container(
                                child:GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: obj.numbers.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    mainAxisExtent: 52,
                                    crossAxisSpacing: 6,
                                    mainAxisSpacing: 6,
                                  ),
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: () {
                                        obj.cross(i);
                                        obj.updateLists(i);
                                        if(obj.progress >= 5){
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(builder: ((context) {
                                            return GameWin();
                                          })));
                                        }
                                      },
                                      child:
                                      Container(
                                        decoration:
                                        BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: (!obj.isCrossed[i]) ? Color.fromARGB(255, 255, 212, 69) :Color.fromARGB(255, 243, 212, 174),

                                          border:  Border.all(
                                            width:(!obj.isCrossed[i]) ? 5.0: 2.0, // Border width
                                            color: Color(0xFF7C1717), // Color #7C1717
                                          ),
                                               // Conditionally add the border
                                          boxShadow:
                                               [
                                            BoxShadow(
                                              offset: Offset(3, 3), // Adjust the offsets for box shadow
                                              blurRadius: 0.0,
                                              color: Color(0xFF7C1717), // Box shadow color #7C1717
                                            ),
                                            BoxShadow(
                                              offset:
                                              Offset(-10, -10), // Adjust the offsets for box shadow
                                              blurRadius: 24.0,
                                              color: Color(0x3600004D), // Box shadow color #3600004D
                                              spreadRadius: -12.0, // Use negative value for inset
                                            ),
                                            BoxShadow(
                                              offset: Offset(10, 10), // Adjust the offsets for box shadow
                                              blurRadius: 20.0,
                                              color: Color(0xFFFFFF63), // Box shadow color #FFFFFF63
                                              spreadRadius: -10.0, // Use negative value for inset
                                            ),
                                          ]
                                             , // Conditionally add the box shadows
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${obj.numbers[i]}',
                                            style: TextStyle(
                                              fontSize: 35,
                                              decoration:  TextDecoration.none,
                                              decorationColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                               decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5,
                                    color: const Color.fromARGB(255, 255, 209, 70),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(255, 243, 228, 174),

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
      },
    );

  }
}
