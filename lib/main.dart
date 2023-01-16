import 'package:covidapp_ui/constants.dart';
import 'package:covidapp_ui/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/counter.dart';
import 'widgets/myheader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          MyHeader(
            image: "assets/images/drcovid.svg",
            textTop: "Stay Safe,",
            textBottom: "Stay Home",
            width: 200,
            left: 0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5), blurRadius: 10, color: kShadowColor)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5))),
            child: Row(children: [
              SvgPicture.asset(
                "assets/icons/map.svg",
                height: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: "Delhi",
                      items: [
                        'Delhi',
                        'Chennai',
                        'Mumbai',
                        'Bangalore',
                        'Kolkatta',
                        'Hyderabad'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {}))
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                      TextSpan(
                          text: "Newest update January 13",
                          style: TextStyle(color: kTextLightColor))
                    ])),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor)
                      ]),
                  alignment: Alignment.center,
                  child: Row(children: [
                    counts(
                      colorout: kInfectedColor,
                      count: "1432",
                      type: "Infected",
                    ),
                    Spacer(),
                    counts(
                      colorout: kDeathColor,
                      count: "43",
                      type: "Deaths",
                    ),
                    Spacer(),
                    counts(
                      colorout: kRecoveryColor,
                      count: "390",
                      type: "Recovered",
                    )
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread of Virus",
                      style: kTitleTextstyle,
                    ),
                    Text(
                      "See Details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/maptrack.png",
                          ),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor)
                      ]),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
