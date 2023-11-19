import 'package:flutter/material.dart';
import 'package:the_journey/variable/variable.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm>
    with SingleTickerProviderStateMixin {
  final String _name = 'Sarina';
  Variable publicVaiable = Variable();
  final List<Tab> _tab = [
    Tab(text: "Tab1"),
    Tab(text: "Tab2"),
    Tab(text: "Tab3")
  ];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Row(
              children: [
                profilePicture(),
                Column(
                  children: [
                    greating(),
                    ownerName(),
                  ],
                ),
                search(),
                notification(),
              ],
            ),
            listviws1(),
            filter()
          ],
        ),
      ),
    );
  }

  getGreating() {
    var now = DateTime.now();
    var greating = now.hour;

    if (greating < 12) {
      return "Good Morning,";
    } else if (greating < 18) {
      return "Good Afternoon,";
    } else {
      return "Good Evening,";
    }
  }

  Widget profilePicture() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 4, color: publicVaiable.buttonBackground),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/icon/imoji.png"),
          )),
    );
  }

  Widget ownerName() {
    return Text(
      '$_name' + "!",
      style: TextStyle(
          fontSize: 30,
          fontFamily: 'NotoSans Bold',
          color: publicVaiable.buttonBackground),
    );
  }

  Widget greating() {
    return Text(
      getGreating(),
      style: TextStyle(fontSize: 20, fontFamily: 'NotoSans Regular'),
    );
  }

  Widget listviws1() {
    return Container(
      height: 200,
      child: EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {},
        activeColor: publicVaiable.buttonBackground,
        dayProps: EasyDayProps(
          borderColor: publicVaiable.buttonBackground,
          width: 60,
          height: 100,
          activeDayStyle: const DayStyle(
            borderRadius: 20,
            dayStrStyle: TextStyle(color: Colors.white),
            monthStrStyle: TextStyle(color: Colors.white),
            dayNumStyle: TextStyle(
                color: Colors.white, fontFamily: "NotoSans Bold", fontSize: 20),
          ),
          inactiveDayStyle: DayStyle(
            borderRadius: 20,
            dayStrStyle: TextStyle(color: publicVaiable.buttonBackground),
            monthStrStyle: TextStyle(color: publicVaiable.buttonBackground),
            dayNumStyle: TextStyle(
                color: publicVaiable.buttonBackground,
                fontFamily: "NotoSans Bold",
                fontSize: 20),
          ),
        ),
        timeLineProps: const EasyTimeLineProps(
          hPadding: 10.0, // padding from left and right
          separatorPadding: 16.0, // padding between days
        ),
      ),
    );
  }

  Widget search() {
    return Container(
      width: 100,
      height: 100,
      child: IconButton(
          onPressed: () {}, icon: Image.asset('assets/icon/search.png')),
    );
  }

  Widget notification() {
    return Container(
      //margin: EdgeInsets.only(right: 100),
      width: 100,
      height: 100,
      child: IconButton(
          onPressed: () {}, icon: Image.asset('assets/icon/notification.png')),
    );
  }

  Widget filter() {
    return const Expanded(
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
              Tab(text: 'Tab 4'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('Tab 1 Content')),
                Center(child: Text('Tab 2 Content')),
                Center(child: Text('Tab 3 Content')),
                Center(child: Text('Tab 4 Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
