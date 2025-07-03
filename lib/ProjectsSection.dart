import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.7;
    final double containerWidth = 380;

    // List of URLs for each project
    final List<String> projectUrls = [
      "https://github.com/ratankumarthakur/project1",
      "https://github.com/ratankumarthakur/project2",
      "https://github.com/ratankumarthakur/project3",
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("My Projects",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color:Theme.of(context).colorScheme.primary,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => _AnimatedProjectCard(
                width: containerWidth,
                height: containerHeight,
                image: 'assets/images/img_${index + 2}.png',
                title: "",
                overlayText: "Details for Project ${index + 1}",
                url: projectUrls[index],
              ),
            ),
          ),
          _BottomHoverButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _BottomHoverButton extends StatefulWidget {
  @override
  State<_BottomHoverButton> createState() => _BottomHoverButtonState();
}

class _BottomHoverButtonState extends State<_BottomHoverButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _hovered ? Colors.pink : Colors.white,
              foregroundColor: _hovered ? Colors.white : Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 6,
              shadowColor: Colors.pink
            ),
            onPressed: () => _launchUrl("https://github.com/ratankumarthakur"),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                "See More",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

class _AnimatedProjectCard extends StatefulWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String overlayText;
  final String url;

  const _AnimatedProjectCard({
    required this.width,
    required this.height,
    required this.image,
    required this.title,
    required this.overlayText,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<_AnimatedProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Base container with zooming image
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  AnimatedScale(
                    scale: _hovered ? 1.15 : 1.0,
                    duration: const Duration(milliseconds: 550),
                    curve: Curves.easeInOut,
                    child: Image.asset(
                      widget.image,
                      width: widget.width,
                      height: widget.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black.withOpacity(0.18),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Animated overlay container
            AnimatedPositioned(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: _hovered ? 0 : -widget.height,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _hovered ? 1.0 : 0.0,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.pink[400]!.withOpacity(0.0), // Transparent at top
                        Colors.pink[400]!, // Solid at bottom
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.overlayText,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      IconButton(
                        icon: const Icon(Icons.open_in_new, color: Colors.white, size: 36),
                        onPressed: () => _launchUrl(widget.url),
                       // tooltip: "Open Project",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}