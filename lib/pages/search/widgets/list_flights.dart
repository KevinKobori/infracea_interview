import 'package:challenge_infracea/pages/search/seats_grid_page.dart';
import 'package:challenge_infracea/providers/flight_provider.dart';
import 'package:challenge_infracea/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class ListFlights extends StatefulWidget {
  @override
  _ListFlightsState createState() => _ListFlightsState();
}

class _ListFlightsState extends State<ListFlights>
    with TickerProviderStateMixin {
  PageController _cardController = PageController(initialPage: 0);
  List<int> passengers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  int currentPassengers = 1;
  int currentIndex = 0;

  @override
  dispose() {
    super.dispose();
    _cardController.dispose();
  }

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
            child: AnimatedContainer(
              height: currentIndex == index ? 134 : 66,
              duration: Duration(milliseconds: 200),
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
              child: PageView(
                controller: _cardController,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            flightsAvailable[index].logo!,
                            width: 64,
                          ),
                          SizedBox(width: 16),
                          Container(
                            color: veppoLightGrey,
                            height: 32,
                            width: 1,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
                              Text(
                                'Travel Date',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: currentIndex == index ? 32 : 0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return veppoLightGrey;
                                return veppoBlue;
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Selecionar data',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.supervised_user_circle,
                            size: 32,
                          ),
                          SizedBox(width: 16),
                          Container(
                            color: veppoLightGrey,
                            height: 32,
                            width: 1,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Passengers',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
                              Text(
                                'Adults (12+)',
                                style: TextStyle(
                                  color: veppoLightGrey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 34,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return veppoLightGrey;
                                    return veppoBlue;
                                  },
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SeatsGridPage(
                                        flight: flightsAvailable[index]),
                                  ),
                                );
                              },
                              child: Text(
                                'continuar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: passengers.map((e) {
                            return Container(
                              margin: EdgeInsets.all(4),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: currentPassengers == e
                                      ? veppoBlue
                                      : veppoLightGrey.withOpacity(0.4),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPassengers = e;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    e.toString(),
                                    style: TextStyle(
                                      color: currentPassengers == e
                                          ? veppoBlue
                                          : veppoLightGrey.withOpacity(0.4),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
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
