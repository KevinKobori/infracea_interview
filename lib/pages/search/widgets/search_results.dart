import 'package:challenge_infracea/providers/flight_provider.dart';
import 'package:challenge_infracea/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  PageController _cardController = PageController(initialPage: 0);
  int currentIndex = 0;
  bool direct = true;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: flightsAvailable.length,
      itemBuilder: (context, index) {
        return DelayedDisplay(
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              height: 134,
              margin: EdgeInsets.fromLTRB(
                  16, 0, 16, index == flightsAvailable.length - 1 ? 80 : 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        flightsAvailable[index].logo!,
                        width: 64,
                      ),
                      Spacer(),
                      Text(
                        '11:30',
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(width: 16),
                      direct
                          ? Column(
                              children: [
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: veppoBlue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      color: veppoBlue,
                                      height: 1,
                                      width: 50,
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: veppoBlue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'direct',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: veppoBlue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      color: veppoBlue,
                                      height: 1,
                                      width: 20,
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      color: veppoBlue,
                                      height: 1,
                                      width: 20,
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: veppoBlue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'semi-direct',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(width: 16),
                      Text(
                        '11:30',
                        style: TextStyle(
                          color: veppoLightGrey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Divider(),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          'One Way Total Price',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$ 129,90',
                          style: TextStyle(
                            color: veppoBlue,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
