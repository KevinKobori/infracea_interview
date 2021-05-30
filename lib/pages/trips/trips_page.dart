import 'package:challenge_infracea/pages/trips/trip_ticket_page.dart';
import 'package:challenge_infracea/utils/consts.dart';
import 'package:flutter/material.dart';

class TripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripTicketPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(26),
                    margin: EdgeInsets.fromLTRB(26, 26, 26, 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/companies_logo/gol_logo.png',
                              ),
                            ),
                            SizedBox(height: 28),
                            Text(
                              '29 OTC',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            SizedBox(height: 28),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(color: veppoLightGrey),
                                    ),
                                    Text('Porto Alegre'),
                                    SizedBox(height: 28),
                                    Text(
                                      'To',
                                      style: TextStyle(color: veppoLightGrey),
                                    ),
                                    Text('Florianópolis'),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Depart',
                                      style: TextStyle(color: veppoLightGrey),
                                    ),
                                    Text('6:30'),
                                    SizedBox(height: 28),
                                    Text(
                                      'Arrive',
                                      style: TextStyle(color: veppoLightGrey),
                                    ),
                                    Text('11:30'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
