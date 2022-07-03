import 'package:book_app/constants/color_constant.dart';
import 'package:book_app/models/popularbook_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/newbook_model.dart';
import '../widget/tab_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            //wellcome
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Pham',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor),
                    ),
                    Text(
                      'Discover Latest Book',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                  ],
                )),
            //Searh
            Container(
              height: 39,
              margin: EdgeInsets.only(left: 25, right: 25, top: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightGreyColor),
              child: Stack(
                children: [
                  TextField(
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search box',
                        hintStyle: GoogleFonts.openSans(
                            fontSize: 12,
                            color: kGreyColor,
                            fontWeight: FontWeight.w600)),
                  ),
                  Positioned(
                      right: 0,
                      child:
                          SvgPicture.asset('assets/svg/background_search.svg')),
                  Positioned(
                      top: 8,
                      right: 9,
                      child: SvgPicture.asset(
                          "assets/icons/icon_search_white.svg"))
                ],
              ),
            ),
            //tab layout
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  labelColor: kBlackColor,
                  unselectedLabelColor: kGreyColor,
                  labelStyle: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w700),
                  unselectedLabelStyle: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  indicator: RoundedRectangleTabIndicator(
                      weight: 2, width: 10, color: kBlackColor),
                  tabs: [
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('New'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Trending'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Desciption'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Content tab
            Container(
              margin: EdgeInsets.only(top: 21),
              height: 210,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 25, right: 6),
                  itemCount: newbooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 19),
                      height: 210,
                      width: 153,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kMainColor,
                          image: DecorationImage(
                              image: AssetImage(newbooks[index].image!))),
                    );
                  }),
            ),
            //Popular
            Padding(
              padding: EdgeInsets.only(top: 25, left: 25),
              child: Text(
                'Popular',
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kBlackColor,
                ),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: populars.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 19),
                      height: 81,
                      width: MediaQuery.of(context).size.width - 50,
                      color: kBackgroundColor,
                      child: Row(children: [
                        Container(
                          height: 81,
                          width: 62,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(populars[index].image),
                              ),
                              color: kMainColor),
                        ),
                        SizedBox(
                          width: 21,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              populars[index].title,
                              style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kBlackColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              populars[index].author,
                              style: GoogleFonts.openSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: kGreyColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '\$' + populars[index].price,
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: kBlackColor),
                            )
                          ],
                        )
                      ]));
                })
          ],
        ),
      ),
    );
  }
}
