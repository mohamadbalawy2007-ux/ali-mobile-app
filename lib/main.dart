// ignore_for_file: use_super_parameters, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: false),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Ali Mobile App", style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          width: 350,
          child: Column(
            children: [
              Image.asset("assets/Logos/ali_mobile_logo.jpg"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 250),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactPage(),
                    ),
                  );
                },
                child: Container(
                  width: 280,
                  height: 70,

                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Icon(Icons.contact_phone_outlined, size: 40),
                        ),

                        Text(
                          "Contact us \t\t\t\t\t\t\t\t",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text("\n"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
                child: Container(
                  width: 280,
                  height: 70,
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Icon(Icons.info, size: 40),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  "\t\t\t\tAbout us",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                "\n\n\n\n\n\n\n\nMade By Mohammad Ali",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);
  static const String phoneNumber = '0599731369';
  static const String facebookUrl = 'https://www.facebook.com/alsindbad.ali.75';
  static const String whatsappNumber = '970599731369';

  Future<void> _callNumber() async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openFacebook() async {
    final Uri uri = Uri.parse(facebookUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openWhatsApp(BuildContext context) async {
    final Uri uri = Uri.parse('https://wa.me/$whatsappNumber');
    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('تعذر فتح الواتساب')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Contact us", style: TextStyle(fontSize: 25))),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: 350,
          child: Column(
            children: [
              Image.asset("assets/Logos/ali_mobile_logo.jpg"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  _callNumber();
                },
                child: Container(
                  width: 270,
                  height: 70,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 75),
                        child: Icon(Icons.call),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text("Call", style: TextStyle(fontSize: 30)),
                      ),
                    ],
                  ),
                ),
              ),
              Text("\n"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 8, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  _openFacebook();
                },
                child: Container(
                  width: 270,
                  height: 70,
                  child: Center(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 70),
                            child: Icon(Icons.facebook),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "\tFacebook",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Text("\n"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  _openWhatsApp(context);
                },
                child: Container(
                  width: 270,
                  height: 70,
                  child: Center(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 70),
                            child: Icon(Icons.chat),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "\tWhatsApp",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                "\n\n\n\n\n\nMade By Mohammad Ali",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  Future<void> _openMaps() async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent("Taj Mall Jenin")}',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("About us", style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              child: Image.asset("assets/Logos/ali_mobile_logo.jpg"),
            ),
            Container(
              width: 350,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 30),
                      SizedBox(width: 8),
                      Text(
                        "Our location",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Jenin\nAbu Bakr Street\nTaj Mall complex\nSecond entrance\nGround floor",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.6,
                    ),
                  ),
                  Divider(color: Colors.grey, height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "جنين - شارع أبو بكر\nمجمع تاج مول - المدخل الثاني\nالطابق الأرضي",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _openMaps,
              child: const SizedBox(
                width: 250,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, color: Colors.white),
                    SizedBox(width: 20),
                    Text(
                      "Open in maps",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "Made By Mohammad Ali",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
