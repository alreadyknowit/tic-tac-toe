import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = ['', '', '', '', '', '', '', '', ''];
  String dialog = '';
  int xScore = 0;
  int oScore = 0;
  int filledBoxes = 0;
  bool turn = true; //First player X
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: Cr,
              children: [
                Text(
                  'SKOR TABLOSU',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      fontFamily: 'Disposable'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'OYUNCU X',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          fontFamily: 'Disposable'),
                    ),
                    Text(
                      'OYUNCU O',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          fontFamily: 'Disposable'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$xScore',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Disposable'),
                    ),
                    Text(
                      '$oScore',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Disposable'),
                    ),
                  ],
                ),
              ],
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _clicked(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[500])),
                        child: Center(
                          child: Text(
                            list[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 66,
                                fontFamily: 'Disposable'),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _turnCheck(turn),
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontFamily: 'Disposable',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _turnCheck(bool turn) {
    if (turn == true)
      return 'OYUN SIRASI X';
    else
      return 'OYUN SIRASI O';
  }

  void _clicked(int index) {
    setState(() {
      if (turn && list[index] == '') {
        list[index] = 'X';
        filledBoxes++;
        turn = false;
      } else if (!turn && list[index] == '') {
        list[index] = 'O';
        filledBoxes++;
        turn = true;
      }
      _isWinner();
    });
  }

//Hard coding winner choose
  void _isWinner() {
    if (list[0] == list[1] && list[0] == list[2] && list[0] != '') {
      _showWinner();
      return;
    }

    if (list[3] == list[4] && list[4] == list[5] && list[4] != '') {
      _showWinner();
      return;
    }
    if (list[6] == list[7] && list[6] == list[8] && list[6] != '') {
      _showWinner();
      return;
    }

    if (list[0] == list[3] && list[0] == list[6] && list[0] != '') {
      _showWinner();
      return;
    }
    if (list[1] == list[4] && list[4] == list[7] && list[4] != '') {
      _showWinner();
      return;
    }

    if (list[2] == list[5] && list[2] == list[8] && list[2] != '') {
      _showWinner();
      return;
    }

    if (list[2] == list[4] && list[4] == list[6] && list[4] != '') {
      _showWinner();
      return;
    }

    if (list[0] == list[4] && list[4] == list[8] && list[4] != '') {
      _showWinner();
      return;
    }

    if (filledBoxes == 9) {
      _showDraw();
      return;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < list.length; i++) {
        list[i] = '';
      }
      filledBoxes = 0;
    });
  }

  /* void _isDrawn() {
    setState(() {
      for (int i = 0; i < list.length; i++) 
      if (list[i] == '') 
      ;
     else drawn= true;
    });
  }*/

  void _showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'DOSTLUK KAZANDI',
              style: TextStyle(
                  fontFamily: 'Disposable',
                  fontSize: 36,
                  color: Colors.deepPurpleAccent),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Play again',
                    style: TextStyle(
                        fontFamily: 'Disposable',
                        fontSize: 36,
                        color: Colors.deepPurpleAccent),
                  )),
            ],
          );
        });
  }

  void _showWinner() {
    if (!turn)
      xScore++;
    else
      oScore++;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return !turn
              ? AlertDialog(
                  backgroundColor: Colors.grey[700],
                  title: Text(
                    'KAZANAN X',
                    style: TextStyle(
                        fontFamily: 'Disposable',
                        fontSize: 36,
                        color: Colors.deepOrange),
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        _clearBoard();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Tekrar oyna',
                        style: TextStyle(
                            fontFamily: 'Disposable',
                            fontSize: 20,
                            color: Colors.deepOrange),
                      ),
                    )
                  ],
                )
              : AlertDialog(
                  backgroundColor: Colors.grey[700],
                  title: Text(
                    'KAZANAN O',
                    style: TextStyle(
                        fontFamily: 'Disposable',
                        fontSize: 36,
                        color: Colors.blueAccent),
                  ),
                  actions: [
                    Center(
                      child: FlatButton(
                          onPressed: () {
                            _clearBoard();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Play again',
                            style: TextStyle(
                                fontFamily: 'Disposable',
                                fontSize: 20,
                                color: Colors.blueAccent),
                          )),
                    )
                  ],
                );
        });
  }
}
// 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 ,
// X , 0 , X , x , X , 0 , X , 0 , 0 ,
// x o x   0 1 2
// x x x   3 4 5
// x 0 0   6 7 8
//012-345-678-036-147-258-048-246
