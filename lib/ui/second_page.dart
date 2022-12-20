import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stream_flutter/view_models/counter_view_model.dart';

class SecondPage extends StatefulWidget {
  final String number;
  const SecondPage({super.key, required this.number});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CounterViewModel>(context, listen: false)
        .lengthNumber(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 49, 69, 90),
          ),
        ),
        title: Text(
          "Length of the number",
          style: GoogleFonts.raleway(
            color: const Color.fromARGB(255, 49, 69, 90),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<CounterViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.number,
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 18),
                Center(
                  child: Text(
                    '${viewModel.numberLength}',
                    style: GoogleFonts.raleway(fontSize: 48),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
