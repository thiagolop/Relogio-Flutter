import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relogio/src/contdown/countdown_controller.dart';

import '../../widgets/round_button.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountdownController>(
      builder: (context, cdController, child) => Scaffold(
        backgroundColor: const Color(0xfff5fbff),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // SizedBox(
                    //   height: 300,
                    //   width: 300,
                    //   child: AnimatedBuilder(
                    //     animation: widget.countdownController,
                    //     builder: (context, child) => CircularProgressIndicator(
                    //       // value: widget.countdownController.circularProgress,
                    //       backgroundColor: Colors.grey.shade300,
                    //       strokeWidth: 6,
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            height: 300,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: cdController.duration,
                              onTimerDurationChanged: (value) {
                                setState(() {
                                  cdController.setTimer(value);
                                });
                              },
                            ),
                          ),
                        );
                      },
                      child: AnimatedBuilder(
                        animation: cdController,
                        builder: (context, child) => Text(
                          '${cdController.hours.toString()}:${cdController.minutes.toString().padLeft(2, '0')}:${cdController.seconds.toString().padLeft(2, '0')}',
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
                    onTap: () => (cdController.isStarted) ? cdController.stopTimer() : cdController.startTimer(),
                    child: RoundButton(icon: cdController.isStarted ? Icons.pause : Icons.play_arrow),
                  ),
                  // GestureDetector(
                  //   onTap: cdController.reset,
                  //   child: const RoundButton(icon: Icons.stop),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
