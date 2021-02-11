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
                        TableItem(
                          iconData: Icons.remove_red_eye,
                          title: '112.000',
                          subTitle: 'Viewers',
                          iconColor: kColorIconPurple,
                        ),
                        // SizedBox(width: 1),
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
                        // SizedBox(height: 16),
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
                        // SizedBox(width: 1),
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
        horizontal: 16,
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 18,
            ),
          ),
          SizedBox(
            width: 8,
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
                    fontSize: 15,
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
