import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 900;
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: constraints.maxHeight,
              
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     const SizedBox(height: 50),
                      Text('Contact Me',
                            style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),),
                      const SizedBox(height: 5),
                      isWide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left: Contact Info
                                Expanded(
                                  flex: 2,
                                  child: _contactInfoSection(context),
                                ),
                                const SizedBox(width: 32),
                                // Right: Form
                                Expanded(
                                  flex: 3,
                                  child: _contactFormSection(context),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _contactInfoSection(context),
                                const SizedBox(height: 32),
                                _contactFormSection(context),
                              ],
                            ),
                      const SizedBox(height: 32),
                      Center(
                        child: Text(
                          "Copyright © Ratan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _contactInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          children: [
            const FaIcon(Icons.email, color: Colors.red, size: 28),
            const SizedBox(width: 8),
            Text(
              "ratankumarthakur2003@gmail.com",
              style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 16),
         Row(
          children: [
            const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 28),
            const SizedBox(width: 8),
            Text(
              "8462876262",
              style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github,color: Colors.black, size: 32), 
              onPressed: () => _launchUrl("https://github.com/ratankumarthakur"),
            ),
            
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin, size: 32,color: Colors.blue,), // LinkedIn
              onPressed: () => _launchUrl("https://www.linkedin.com/in/ratan-kumar-thakur-502162291/"),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 220,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 253, 46, 73),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              _launchUrl("https://drive.google.com/file/d/1WZhhfpSiPOqTC2zdHrLPAffOwuZfc_Vi/view?usp=sharing"); // Replace with your CV link
            },
            child: const Text(
              "Open Resume",
              style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _contactFormSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: "Your Name",
            filled: true,
            fillColor: Colors.grey[400],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 103, 103, 103)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          style: const TextStyle(fontSize: 20, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: "Your Email",
            filled: true,
            fillColor: Colors.grey[400],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(fontSize: 20, color:Color.fromARGB(255, 103, 103, 103)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          style: const TextStyle(fontSize: 20, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _messageController,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: "Your Message",
            filled: true,
            fillColor: Colors.grey[400],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(fontSize: 20, color:Color.fromARGB(255, 103, 103, 103)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          style: const TextStyle(fontSize: 20, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 56,
              //width: 100,
              width:150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 253, 46, 73),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if(_messageController.text.isEmpty || _nameController.text.isEmpty || _emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields before submitting.")),
                    );
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Your message successfully sent to Ratan")),
                  );
                  _nameController.clear();
                  _emailController.clear();
                  _messageController.clear();
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
