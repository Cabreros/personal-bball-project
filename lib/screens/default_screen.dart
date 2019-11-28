import 'dart:convert';
import 'package:fantasybball_tools/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:fantasybball_tools/constants.dart';

class DefaultScreen extends StatefulWidget {
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  List<Widget> getCategories() {
    List<Widget> stats = [];
    for (String stat in categories) {
      Widget catValue = Expanded(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                child: Text(
                  stat.substring(0, 3),
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      stats.add(catValue);
    }
    return stats;
  }

  List<Widget> getStats(var newData, int index) {
    List<Widget> stats = [];

    Color statBackground;
    for (String stat in categories) {
      int base = 255;

      double value = newData[index][stat];
      if (value > 0) {
        base -= (value * 60).toInt();
        if (base > 255) {
          base = 255;
        }
        statBackground = Color.fromRGBO(base, 255, base, 1);
      } else {
        base -= (-value * 65).toInt();
        if (base > 255) {
          base = 255;
        }
        statBackground = Color.fromRGBO(255, base, base, 1);
      }

      Widget catValue = Expanded(
        child: Container(
          color: statBackground,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                child: Text(
                  newData[index][stat].toStringAsFixed(2),
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      );
      stats.add(catValue);
    }
    return stats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30), // here the desired height
        child: AppBar(
          titleSpacing: 0,
          title: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: getCategories(),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Center(
          // Use future builder and DefaultAssetBundle to load the local JSON file
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/rankings.json'),
              builder: (context, snapshot) {
                // Decode the JSON
                var newData = json.decode(snapshot.data.toString());

                return ListView.builder(
                  // Build the ListView
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Image.asset(
                                      'images/OGanunoby.png',
                                      scale: 2,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return SubPage(
                                                text: newData[index]);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        newData[index]['FirstName'][0] +
                                            '. ' +
                                            newData[index]['LastName'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        'Value = ' +
                                            newData[index]['Value']
                                                .toStringAsFixed(2),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: getStats(newData, index),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: newData == null ? 0 : 156,
                );
              }),
        ),
      ),
    );
  }
}
