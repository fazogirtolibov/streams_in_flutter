import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stream_flutter/view_models/counter_view_model.dart';

class ThirdPage extends StatefulWidget {
  final int number;
  const ThirdPage({Key? key, required this.number}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<CounterViewModel>(context, listen: false)
        .listenNumbers(widget.number);
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
          "Play with the number",
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
                Center(
                  child: Text(
                    viewModel.counter.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () {
                    context.read<CounterViewModel>().pauseCounterStream();
                  },
                  child: Text(
                    "Pause",
                    style: GoogleFonts.raleway(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    context.read<CounterViewModel>().resumeCounterStream();
                  },
                  child: Text(
                    "Resume",
                    style: GoogleFonts.raleway(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    context.read<CounterViewModel>().cancelCounterStream();
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.raleway(fontSize: 28),
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
