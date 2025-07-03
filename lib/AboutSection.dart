import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  Widget _navButton(String t, bool s, double n) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            t,
            style: TextStyle(
                color: s ? const Color(0xfffc0362) : Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: s ? 1.0 : 0.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: s ? n : 0,
              curve: Curves.easeIn,
              height: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfffc0362),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
        ],
      );
  final _isHovered = [true, false, false];
  final sections = ["Achievements", "Experience", "Education"];
  bool show1 = true, show2 = false, show3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/space.json', fit: BoxFit.fill),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Expanded(child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      
                  "About Me",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color:Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                    style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.primary),
                    "I am pursuing my Btech in Information Technlogoy from National Institute of Technology Raipur. I am a Full-Stack developer and I have just finished learning Flutter and currenlty exloring new technologies. I am eager to grap new opportunities and learn from them. My goal as of now is to get placed in one of my Dream companies.",),
                const SizedBox(
                  height: 30,
                ),
                  ],
                )),
                Expanded(child: 
                Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 3; i++) ...[
                        InkWell(
                          onTap: () {
                            if (i == 0) {
                              setState(() {
                                _isHovered[0] = true;
                                _isHovered[1] = false;
                                _isHovered[2] = false;
                                show1 = true;
                                show2 = false;
                                show3 = false;
                              });
                            } else if (i == 1) {
                              setState(() {
                                _isHovered[1] = true;
                                _isHovered[0] = false;
                                _isHovered[2] = false;
                                show2 = true;
                                show1 = false;
                                show3 = false;
                              });
                            } else {
                              setState(() {
                                _isHovered[2] = true;
                                _isHovered[1] = false;
                                _isHovered[0] = false;
                                show3 = true;
                                show1 = false;
                                show2 = false;
                              });
                            }
                          },
                          child: _navButton(sections[i], _isHovered[i],
                              [120, 100, 90][i] as double),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ]
                  ),
                if (show1)
                   Column(
                    spacing: 5,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                          
                            "Reliance Foundation Scholar",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Won Reliance Foundation Scholarship ",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                if (show2)
                   Column(
                    spacing: 5,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            
                            "Web development Intern",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "1 month internship in the company Octanet",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            
                            "Coordinator at Icell for the year 2024",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Developed an android application to organize treasuer hunt for the event Avinya",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            
                            "Manager at E-cell",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Managed a team of executives to work upon the club's official app",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                if (show3)
                   Column(
                    spacing: 5,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            
                            "College",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Bachelor of Technology from NIT Raipur",
                            style: TextStyle(
                                color:Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            
                            "School",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Intermediate from Mar Gregorious Memorial Senior Secondary School",
                            style: TextStyle(
                                color:Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
