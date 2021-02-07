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
              style: TextStyle(color: kColorText, fontSize: 26),
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
          Image.network(
            kDashboardPeopleUrl,
            width: 70,
            height: 70,
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: kColorPrimary,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Column(
                          children: [
                            TableItem(
                              iconData: Icons.remove_red_eye,
                              title: '112.000',
                              subTitle: 'Viewers',
                            ),
                            SizedBox(height: 8),
                            TableItem(
                              iconData: Icons.remove_red_eye,
                              title: '112.000',
                              subTitle: 'Viewers',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TableItem(
                              iconData: Icons.remove_red_eye,
                              title: '112.000',
                              subTitle: 'Viewers',
                            ),
                            SizedBox(height: 8),
                            TableItem(
                              iconData: Icons.remove_red_eye,
                              title: '112.000',
                              subTitle: 'Viewers',
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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

class TableItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subTitle;

  TableItem({
    this.iconData,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kColorSearchField,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(iconData),
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: kColorText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: kColorTextSub,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
