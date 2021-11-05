import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(GuideCarsousel());

class GuideCarsousel extends StatefulWidget {
  @override
  _GuideCarsouselState createState() => _GuideCarsouselState();
}

class _GuideCarsouselState extends State<GuideCarsousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'assets/logo1.png',
      'assets/logo1.png',
      'assets/logo1.png'
    ];
    return MaterialApp(
      home: InteractiveViewer(
        maxScale: 5.0,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //   width: 300.0,
                  //   height: 60.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     image: DecorationImage(
                  //       image: AssetImage('asstes/images/logo2.png'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SafeArea(
                child: InteractiveViewer(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 500,
                            autoPlay: true,
                            viewportFraction: 1.0,
                            aspectRatio: 2.0,
                            autoPlayInterval: Duration(seconds: 4),
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        items: list
                            .map((item) => Container(
                                  height: 80,
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x40000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Image.asset(item.toString())),
                                ))
                            .toList(),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: list.map((url) {
                    int index = list.indexOf(url);
                    return Container(
                      width: 16,
                      height: 16,
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(8, 25, 113, 1)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
