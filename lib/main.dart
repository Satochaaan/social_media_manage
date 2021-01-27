import 'package:flutter/material.dart';

// 定数
const kColorPrimary = Color(0xffffffff);
const kColorSecondary = Color(0xff435ebe);
const kColorText = Color(0xff303e65);
const kColorTextSub = Color(0x9aa7c6);
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
        title: Text(
          'Dashboard',
          style: TextStyle(color: kColorText, fontSize: 26),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          Image.network(kDashboardPeopleUrl),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                // labelText: 'Search',
                hintText: 'Search',
                filled: true,
                fillColor: kColorSearchField,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    color: kColorSearchField,
                  ),
                ),
              ),
            ),
            Table(),
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
