import 'package:covidapp_ui/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double left;
  final double width;
  const MyHeader({
    Key? key,
    required this.image,
    required this.textTop,
    required this.textBottom,
    required this.left,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/covidcover.png"))),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen();
                }));
              },
              child: SvgPicture.asset(
                "assets/icons/boxmenu.svg",
                height: 50,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: left,
                top: 0,
                child: SvgPicture.asset(
                  image,
                  width: width,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
              Positioned(
                  right: 40,
                  bottom: 80,
                  child: Text(
                    "$textTop\n$textBottom",
                    style: kHeadingTextStyle.copyWith(color: Colors.white),
                  ))
            ],
          )),
        ]),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
