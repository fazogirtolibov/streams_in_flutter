import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stream_flutter/ui/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: GoogleFonts.raleway(
            color: const Color.fromARGB(255, 49, 69, 90),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Enter number',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 49, 69, 90),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutName.first,
                    arguments: {
                      'number': int.parse(numberController.text),
                    },
                  );
                },
                child: Text(
                  'Degree of a number',
                  style: GoogleFonts.raleway(fontSize: 22),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutName.second,
                    arguments: {
                      'number': numberController.text,
                    },
                  );
                },
                child: Text(
                  'Length',
                  style: GoogleFonts.raleway(fontSize: 22),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutName.third,
                    arguments: {
                      'number': int.parse(numberController.text),
                    },
                  );
                },
                child: Text(
                  'Play with numbers',
                  style: GoogleFonts.raleway(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
