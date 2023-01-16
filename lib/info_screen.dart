import 'package:covidapp_ui/constants.dart';
import 'package:covidapp_ui/widgets/myheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          MyHeader(
            image: "assets/images/doctorinfo.svg",
            textTop: "Know More",
            textBottom: "About Covid",
            width: 120,
            left: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 24),
                scrollDirection: Axis.horizontal,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      symptom_card(
                        image: "assets/images/headacheee.jpg",
                        name: "Headache",
                      ),
                      symptom_card(
                        image: "assets/images/cough.jpg",
                        name: "Cough",
                      ),
                      symptom_card(
                        image: "assets/images/sorethroat.jpg",
                        name: "Sorethroat",
                      ),
                      symptom_card(
                        image: "assets/images/feverr.jpg",
                        name: "Fever",
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Prevention",
                  style: kTitleTextstyle,
                ),
              ),
              Column(
                children: [
                  prevention_card(
                    image: "assets/images/maskwear4.jpg",
                    title: "Wear Mask",
                    description:
                        "Masks are effective at reducing transmission.",
                  ),
                  prevention_card(
                    image: "assets/images/handwash.jpg",
                    title: "Wash Hands",
                    description:
                        "Wash hands with soap and water for at least 20 seconds.",
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class prevention_card extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const prevention_card({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10), color: kShadowColor, blurRadius: 20)
          ],
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            image,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        title,
                        style: kTitleTextstyle,
                      ),
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class symptom_card extends StatelessWidget {
  final String image;
  final String name;
  const symptom_card({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10), blurRadius: 20, color: kShadowColor)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Image.asset(
              image,
              height: 100,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}
