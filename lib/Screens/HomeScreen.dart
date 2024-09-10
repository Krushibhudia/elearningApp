import 'package:flutter/material.dart';
import 'CourseDetail_screen.dart';
import 'Notification_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi there!",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotificationScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Instructors",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("See All"),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    width: 100.0,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://delhivakil.com/wp-content/themes/generatepress_child/assets/images/person.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Instructor ${index + 1}",
                          style: TextStyle(fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),

            // Courses Section
            Text(
              "Courses",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),

            // TabBar Section
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Design"),
                Tab(text: "Technology"),
                Tab(text: "Gaming"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildCourseList(),
                  buildCourseList(),
                  buildCourseList(),
                  buildCourseList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Course List
  Widget buildCourseList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoursedetailScreen(
                  courseTitle: "Course Title ${index + 1}",
                  courseImage: 'https://s.tmimgcdn.com/scr/1600x1000/87300/edugroit-online-course-website-template-wordpress-theme_87334-3-original.png',
                  courseDescription: 'Description of Course ${index + 1}',
                  lectures: [
                    {'title': 'Lecture 1', 'instructor': 'Instructor A', 'duration': '10 mins'},
                    {'title': 'Lecture 2', 'instructor': 'Instructor B', 'duration': '20 mins'},
                  ],
                ),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://s.tmimgcdn.com/scr/1600x1000/87300/edugroit-online-course-website-template-wordpress-theme_87334-3-original.png',
                      height: 60.0,
                      width: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Course Title ${index + 1}",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(Icons.menu_book_rounded, color: Colors.green, size: 16.0),
                                  SizedBox(width: 4.0),
                                  Flexible(
                                    child: Text(
                                      "15 Lessons",
                                      style: TextStyle(fontSize: 14.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.0), // Space between items
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(Icons.star_border, color: Colors.orange, size: 16.0),
                                  SizedBox(width: 4.0),
                                  Flexible(
                                    child: Text(
                                      "4.5 Rating",
                                      style: TextStyle(fontSize: 14.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.0), // Space between items
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(Icons.person_3_outlined, color: Colors.deepPurple, size: 16.0),
                                  SizedBox(width: 4.0),
                                  Flexible(
                                    child: Text(
                                      "1500 Enrolled",
                                      style: TextStyle(fontSize: 14.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
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
        );
      },
    );
  }
}
