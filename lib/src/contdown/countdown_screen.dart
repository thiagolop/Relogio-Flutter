import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relogio/src/contdown/countdown_controller.dart';
import '../../widgets/round_button.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({Key? key, required this.countdownController}) : super(key: key);
  final CountdownController countdownController;

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fbff),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: AnimatedBuilder(
                      animation: widget.countdownController,
                      builder: (context, child) => CircularProgressIndicator(
                        value: widget.countdownController.circularProgress,
                        backgroundColor: Colors.grey.shade300,
                        strokeWidth: 6,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: widget.countdownController.durationTotal,
                            onTimerDurationChanged: (value) {
                              setState(() {
                                widget.countdownController.durationTotal = value;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: AnimatedBuilder(
                      animation: widget.countdownController,
                      builder: (context, child) => Text(
                        widget.countdownController.timerText,
                        style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.countdownController.togglePause,
                  child: RoundButton(icon: widget.countdownController.estacorrendo ? Icons.pause : Icons.play_arrow),
                ),
                GestureDetector(
                  onTap: widget.countdownController.reset,
                  child: const RoundButton(icon: Icons.stop),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
