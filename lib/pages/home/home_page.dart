import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_project/commponents/coordinator_layout.dart';
import 'package:loyalty_project/commponents/header.dart';
import 'package:loyalty_project/commponents/theme.dart';
import 'package:loyalty_project/dummy/transaction.dart';
import 'package:loyalty_project/models/merchant_model.dart';
import 'package:loyalty_project/pages/widgets/merchant_all.dart';
import 'package:loyalty_project/provider/merchant_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../main.dart';

class Menu {
  final IconData icon;
  final String title;

  Menu(this.icon, this.title);
}

List<Menu> menus = [
  Menu(Icons.home, "Home"),
  Menu(Icons.multiline_chart, "Visualize"),
  Menu(Icons.card_giftcard, "Reward"),
  Menu(Icons.settings, "Settings"),
];

class HomePage extends StatefulWidget {
  HomePage({Key key, this.merchant}) : super(key: key);
  final MerchantModel merchant;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  Future<dynamic> localStorage = MyApp.init();

  double minHeight;
  double maxHeight;
  int maxValue = 1000;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPref() async {
    SharedPreferences prefs = await localStorage;
    print(prefs.get('token'));
  }

  @override
  Widget build(BuildContext context) {
    MerchantProvider merchantProvider = Provider.of<MerchantProvider>(context);
    // getPref();
    minHeight ??= MediaQuery.of(context).padding.top + kToolbarHeight;
    maxHeight ??= 360;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            CoordinatorLayout(
              snap: true,
              scrollController: scrollController,
              header: buildCollapseHeader(context),
              body: buildMainContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBox() {
    double height = 48;
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2)),
      child: Container(
        height: height,
        padding: EdgeInsets.only(left: height / 2, right: height / 2 - 12),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 16, bottom: 14),
            hintText: "What you wish for?",
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget merchantAllTitle() {
    return Container(
      margin: EdgeInsets.only(
        right: defaultMargin,
        left: defaultMargin,
      ),
      child: Text('Merchant',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold)),
    );
  }

  Widget merchantAll() {
    return Container(
      margin: EdgeInsets.only(
        top: 14,
      ),
      child: Column(
        children: [
          MerchantAll(),
          MerchantAll(),
          MerchantAll(),
          MerchantAll(),
          MerchantAll(),
        ],
      ),
    );
  }

  Widget carrousel() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.92,
          aspectRatio: 480 / 143,
        ),
        items: [
          'assets/carouselslide1.webp',
          'assets/carouselslide2.webp',
          'assets/carouselslide3.webp',
        ].map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }

  SingleChildScrollView buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            //CategoriesList(),
            buildSearchBox(),
            SizedBox(
              height: 15,
            ),
            carrousel(),
            //merchantAllTitle(),
            merchantAll(),
            //widgetCard(),
            SizedBox(
              height: 16,
            ),
            //ItemList(label: "New"),
            //ItemList(label: "Hot"),
          ],
        ),
      ),
    );
  }

  NumberFormat _numberFormat = NumberFormat("###,###,###");

  Card buildPointSummary(
      {String title, double value, Color color, Widget icon, double rate}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Theme.of(context).hintColor)),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Text(_numberFormat.format(value),
                          style: Theme.of(context).textTheme.headline4),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 1,
                        height: 12,
                        //color: Theme.of(context).dividerColor,
                      ),
                      // Stack(
                      //   alignment: Alignment.centerLeft,
                      //   children: <Widget>[
                      //     Icon(
                      //         rate > 0
                      //             ? Icons.arrow_drop_up
                      //             : Icons.arrow_drop_down,
                      //         color: rate > 0
                      //             ? Colors.green.shade600
                      //             : Colors.red.shade600,
                      //         size: 24),
                      //     Container(
                      //       margin: EdgeInsets.only(left: 20),
                      //       child: Text(_numberFormat.format(rate),
                      //           style: Theme.of(context).textTheme.caption),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   height: 40,
            //   child: FloatingActionButton.extended(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed("/merchant");
            //     },
            //     label: Text("Card"),
            //   ),
            // ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 40,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).pushNamed("/voucher");
                },
                label: Text("Voucher"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double offset = 0;
  SliverCollapseHeader buildCollapseHeader(BuildContext context) {
    return SliverCollapseHeader(
      minHeight: minHeight + 90,
      maxHeight: maxHeight,
      builder: (context, offset) {
        this.offset = offset;
        return Stack(
          children: <Widget>[
            Positioned.fill(
              bottom: 20,
              child: buildHeader(context, offset),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: buildPointSummary(
                        title: "Active points",
                        value: 14 + sum(totalReceived),
                        rate: totalReceived.last.y - totalRedeem.last.y,
                        color: Colors.green,
                        icon: Icon(Icons.arrow_upward),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget buildHeader(BuildContext context, double offset) {
    return IgnorePointer(
      ignoring: false,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: backgroundColor3,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              16 * (1 - offset),
            ),
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: maxHeight - 50,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 24 * (1 - offset),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    centerTitle: false,
                    title: Container(
                      child: Text(
                        offset == 1 ? "Home" : "Hi Zainal Salamun,",
                        style: TextStyle(fontSize: 18 + 16 * (1 - offset)),
                      ),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          debugPrint("clicl");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double sum(List<FlSpot> data1) {
    return data1.fold(
      0,
      (previousValue, element) => previousValue + element.y,
    );
  }
}
