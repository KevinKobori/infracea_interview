import 'package:challenge_infracea/models/flight_model.dart';
import 'package:challenge_infracea/utils/consts.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class SeatsGridPage extends StatefulWidget {
  SeatsGridPage({this.flight});
  final FlightModel? flight;

  @override
  _SeatsGridPageState createState() => _SeatsGridPageState();
}

class _SeatsGridPageState extends State<SeatsGridPage> {
  int? seatSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: veppoBlue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Container(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Porto Alegre',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Florianópolis',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Select Your Seat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Total R\$49,00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                margin: EdgeInsets.fromLTRB(64, 16, 64, 16),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Spacer(),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: veppoBlue, width: 2),
                          ),
                        ),
                        Spacer(flex: 2),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: veppoBlue, width: 2),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: veppoBlue, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        child: GridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          children: widget.flight!.seats!
                              .asMap()
                              .map((index, element) {
                                return MapEntry(
                                  index,
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        seatSelected = index;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(16),
                                      child: Image.asset(
                                        seatSelected == index
                                            ? 'assets/images/seats/seat_3.jpg'
                                            : element.available!
                                                ? 'assets/images/seats/seat_1.jpg'
                                                : 'assets/images/seats/seat_2.jpg',
                                        width: 28,
                                      ),
                                    ),
                                  ),
                                );
                              })
                              .values
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/seats/seat_1.jpg',
                      width: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'available',
                      style: TextStyle(
                        color: veppoLightGrey,
                      ),
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/seats/seat_2.jpg',
                      width: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'booked',
                      style: TextStyle(
                        color: veppoLightGrey,
                      ),
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/seats/seat_3.jpg',
                      width: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'select',
                      style: TextStyle(
                        color: veppoLightGrey,
                      ),
                    ),
                  ],
                ),
              ),
              DelayedDisplay(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return veppoLightGrey;
                          return veppoBlue;
                        },
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text(
                        'Proceed to payment',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
