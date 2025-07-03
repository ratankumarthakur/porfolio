import 'package:dsa/homepage.dart';
import 'package:dsa/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>ThemeProvider(),
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Ratan\'s Portfolio',
      debugShowCheckedModeBanner: false,
      home: const homepage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}









// class rat extends StatefulWidget {
//   const rat({super.key});

//   @override
//   State<rat> createState() => _ratState();
// }

// class _ratState extends State<rat> {
//   final List<String> _images = [
//     // 'https://images.unsplash.com/photo-1513786704796-b35842f0dca6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8',
//     // 'https://images.unsplash.com/photo-1596501048547-e9acb71ca798?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     // 'https://media.istockphoto.com/id/529370381/photo/beautiful-views-of-the-mountains-in-the-alps.jpg?s=2048x2048&w=is&k=20&c=1m18ApOD9C_uICBpoMQtU_nxSHYnX6NK4UaMa4RFJrU=',
//     // 'https://plus.unsplash.com/premium_photo-1675805016043-0166fc57ad01?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//     'assets/images/img_3.png','assets/images/img_2.png'  //asset images are transitioning better.
//   ];

//   int _currentIndex = 0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 6), (timer) {
//       setState(() {
//         _currentIndex = (_currentIndex + 1) % _images.length;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Slider'),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height:  MediaQuery.of(context).size.height,
//         child:AnimatedSwitcher(
//           //switchInCurve: Easing.linear,
//           duration: Duration(seconds: 2),
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             return FadeTransition(opacity: animation, child: child);
//             // return FadeInDown(child: child,duration: Duration(seconds: 2),);
//           },
//           child: Image.asset(
//             _images[_currentIndex],
//             key: ValueKey<int>(_currentIndex),
//             fit: BoxFit.fill, width: MediaQuery.of(context).size.width,
//             height:  MediaQuery.of(context).size.height,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GlassmorphicContainer extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
//   return Scaffold(backgroundColor: Colors.green,
//     body: Container(
//       width: 300,
//       height: 300,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.2),
//           width: 1.5,
//         ),
//       ),
//       child: Stack(
//         children: [
//           // Blurred background
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//               ),
//             ),
//           ),
//           // Content inside the glassmorphic container
//           Center(
//             child: Text(
//               'Glassmorphic Container',
//               style: TextStyle(
//                 color: Colors.white.withOpacity(0.8),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }

// import 'package:dsa/contact.dart';
// import 'package:dsa/homepage.dart';
// import 'package:dsa/scroll.dart';
// import 'package:flutter/material.dart';
// // import 'sections/about.dart';
// // import 'sections/education.dart';
// // import 'sections/projects.dart';
// // import 'sections/skills.dart';
// // import 'sections/contact.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ratan Portfolio',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Contact(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   final PageController _pageController = PageController();

//   final List<Widget> _screens = [
//     // const AboutSection(),
//     // const SkillsSection(),
//     // const ProjectsSection(),
//     // const EducationSection(),
//     // const ContactSection(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Aditya Portfolio'),
//         centerTitle: true,
//       ),
//       body: PageView(
//         controller: _pageController,
//         children: _screens,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           _pageController.animateToPage(
//             index,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         },
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'About',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             label: 'Skills',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.work),
//             label: 'Projects',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'Education',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.mail),
//             label: 'Contact',
//           ),
//         ],
//       ),
//     );
//   }
// }
