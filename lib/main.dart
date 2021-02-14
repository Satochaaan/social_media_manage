import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// 定数
const kColorPrimary = Color(0xffffffff);
const kColorSecondary = Color(0xff435ebe);
const kColorText = Color(0xff303e65);
const kColorTextSub = Color(0xff8b9abe);
const kColorViewrsIcon = Color(0xff9694ff);
const kColorFollowersIcon = Color(0xff57caeb);
const kColorFollowingIcon = Color(0xff5ddab4);
const kColorSavedIcon = Color(0xffff7976);
const kColorSearchField = Color(0xfff2f7ff);
const kColorIconPurple = Color(0xff9694ff);
const kColorIconBlue = Color(0xff57caeb);
const kColorIconGreen = Color(0xff5ddab4);
const kColorIconOrange = Color(0xffff7976);
const kDashboardPeopleUrl =
    'https://user-images.githubusercontent.com/44778185/106063024-ef8e2600-613a-11eb-8ae4-a4f10a595f33.png';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: kColorPrimary,
        backgroundColor: kColorPrimary,
      ),
      home: SocialMediaManage(),
    );
  }
}

/// SocialMediaManage
class SocialMediaManage extends StatefulWidget {
  SocialMediaManage({Key key}) : super(key: key);

  @override
  _SocialMediaManageState createState() => _SocialMediaManageState();
}

/// SocialMediaManageState
class _SocialMediaManageState extends State<SocialMediaManage> {
  int _selectedIndex = 0;
  String dropDownValue = 'Weeks';

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                color: kColorText,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '14 Jan, 2021',
              style: TextStyle(color: kColorTextSub, fontSize: 20),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              kDashboardPeopleUrl,
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
      body: Container(
        color: kColorPrimary,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: kColorSearchField,
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      color: kColorSearchField,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      color: kColorSearchField,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Table(
                columnWidths: {1: FractionColumnWidth(.05)},
                children: [
                  TableRow(
                    children: [
                      TableItem(
                        iconData: Icons.remove_red_eye,
                        title: '112.000',
                        subTitle: 'Viewers',
                        iconColor: kColorIconPurple,
                      ),
                      SizedBox(width: 1),
                      TableItem(
                        iconData: Icons.person,
                        title: '183.000',
                        subTitle: 'Followers',
                        iconColor: kColorIconBlue,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 16),
                      SizedBox(height: 16),
                      SizedBox(height: 16),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableItem(
                        iconData: Icons.person_add_alt_1,
                        title: '80.000',
                        subTitle: 'Following',
                        iconColor: kColorIconGreen,
                      ),
                      SizedBox(width: 1),
                      TableItem(
                        iconData: Icons.bookmark,
                        title: '112',
                        subTitle: 'Saved',
                        iconColor: kColorIconOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile Visit',
                    style: TextStyle(
                      color: kColorText,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kColorSearchField,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropDownValue,
                        elevation: 16,
                        items: <String>['Weeks', 'Days']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            dropDownValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            BarChartSample()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: '',
          ),
        ],
        selectedItemColor: kColorSecondary,
        unselectedItemColor: kColorText,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onPageChanged,
      ),
    );
  }
}

// テーブルアイテムWidget
class TableItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subTitle;
  final Color iconColor;

  TableItem({
    this.iconData,
    this.title,
    this.subTitle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kColorSearchField,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: kColorText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kColorTextSub,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 棒グラフ
class BarChartSample extends StatelessWidget {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);
  final barWidth = 30.0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) =>
                      const TextStyle(color: Color(0xff939393), fontSize: 10),
                  margin: 10,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Mon';
                      case 1:
                        return 'Tue';
                      case 2:
                        return 'Wed';
                      case 3:
                        return 'Thu';
                      case 4:
                        return 'Fri';
                      case 5:
                        return 'Sat';
                      case 6:
                        return 'Sun';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      color: Color(
                        0xff939393,
                      ),
                      fontSize: 10),
                  margin: 0,
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 20,
              barGroups: getData(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 10,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 10, kColorSecondary),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 20,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 20, kColorSecondary),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 40,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 40, kColorSecondary),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 30,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 30, kColorSecondary),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 20,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 20, kColorSecondary),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 10,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 10, kColorFollowersIcon),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 30,
              width: barWidth,
              rodStackItems: [
                BarChartRodStackItem(0, 30, kColorSecondary),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
