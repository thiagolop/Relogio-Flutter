import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relogio/src/contdown/countdown_controller.dart';
import '../../widgets/round_button.dart';

class CountdownScreen extends StatelessWidget {
  const CountdownScreen({Key? key, required this.countdownController}) : super(key: key);
  final CountdownController countdownController;
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
                      animation: countdownController,
                      builder: (context, child) => CircularProgressIndicator(
                        value: countdownController.circularProgress,
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
                            initialTimerDuration: countdownController.durationTotal,
                            onTimerDurationChanged: (value) => countdownController.durationTotal = value,
                          ),
                        ),
                      );
                    },
                    child: AnimatedBuilder(
                      animation: countdownController,
                      builder: (context, child) => Text(
                        countdownController.timerText,
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
                  onTap: countdownController.togglePause,
                  child: RoundButton(icon: countdownController.estacorrendo ? Icons.pause : Icons.play_arrow),
                ),
                GestureDetector(
                  onTap: countdownController.reset,
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
