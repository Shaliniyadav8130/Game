import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/numbers.dart';

class Game extends StatelessWidget {
  final List bingo = ['B', 'I', 'N', 'G', 'O'];

  @override
  Widget build(BuildContext context) {
    return Consumer<Numbers>(
      builder: (BuildContext context, Numbers obj, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bingo with family'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 1),
                    color: Colors.yellow,
                    height: 16,
                    width: (obj.progress < 5) ? obj.progress * (MediaQuery.of(context).size.width / 5) : MediaQuery.of(context).size.width,
                    child: (obj.progress >= 5) ? Text('You Won') : Text(''),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.pinkAccent,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                    (index) => Text(
                      bingo[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: obj.numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      obj.cross(i);
                      obj.updateLists(i);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: (!obj.isCrossed[i]) ? [Colors.white10, Colors.black12] : [Color(0xff5d7fa3), Color(0xff6e97c2)],
                          ),
//                          border: Border.all(color: Colors.blueGrey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(1, 1),
                            ),
                            BoxShadow(
                              color: Colors.white10,
                              blurRadius: 5,
                              offset: Offset(-1, -1),
                            ),
                          ]),
                      child: Center(
                        child: Text(
                          '${obj.numbers[i]}',
                          style: TextStyle(
                            fontSize: 40,
                            decoration: (obj.isCrossed[i]) ? TextDecoration.lineThrough : TextDecoration.none,
                            decorationColor: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              obj.shuffle();
            },
            tooltip: 'Restart match',
            elevation: 20,
            focusColor: Colors.black,
            backgroundColor: Colors.pink,
            splashColor: Colors.green,
            hoverColor: Colors.yellow,
            child: Icon(Icons.scatter_plot),
          ),
        );
      },
    );
  }
}
