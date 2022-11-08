import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:relogio/widgets/round_button.dart';
import 'package:flutter/cupertino.dart';

class CountdownScreem2 extends StatefulWidget {
  const CountdownScreem2({Key? key}) : super(key: key);

  @override
  State<CountdownScreem2> createState() => _CountdownScreem2State();
}

class _CountdownScreem2State extends State<CountdownScreem2> with TickerProviderStateMixin {
  late AnimationController animatedcontroller;

  bool isPlaying = false;

  String get countText {
    Duration count = animatedcontroller.duration! * animatedcontroller.value;
    return animatedcontroller.isDismissed
        ? '${(animatedcontroller.duration!.inHours).toString().padLeft(2, '0')} : ${(animatedcontroller.duration!.inMinutes % 60).toString().padLeft(2, '0')} : ${(animatedcontroller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inHours).toString().padLeft(2, '0')} : ${(count.inMinutes % 60).toString().padLeft(2, '0')} : ${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    animatedcontroller = AnimationController(vsync: this, duration: const Duration(seconds: 00));

    animatedcontroller.addListener(() {
      notify();
      if (animatedcontroller.isAnimating) {
        setState(() {
          progress = animatedcontroller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    animatedcontroller.dispose();
    super.dispose();
  }

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
                    child: CircularProgressIndicator(
                      value: animatedcontroller.value,
                      backgroundColor: Colors.grey.shade300,
                      strokeWidth: 6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (animatedcontroller.isDismissed) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            height: 300,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: animatedcontroller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  animatedcontroller.duration = time;
                                });
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: animatedcontroller,
                      builder: (context, child) => Text(
                        countText,
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
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
                  onTap: () {
                    if (animatedcontroller.isAnimating) {
                      animatedcontroller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      animatedcontroller.reverse(from: animatedcontroller.value == 0 ? 1.0 : animatedcontroller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                    icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    animatedcontroller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: const RoundButton(
                    icon: Icons.stop,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
