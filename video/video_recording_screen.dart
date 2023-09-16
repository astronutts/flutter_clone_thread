// ignore_for_file: unused_field

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/video/video_preview_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin {
  bool _hasPermission = false;
  bool _selfiemode = false;
  String flashState = "";
  late CameraController _cameraController;
  late FlashMode _flashMode;
  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: 200,
    ),
  );

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  late final AnimationController _progressAnimationControlloer =
      AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  //카메라 초기화
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    print(cameras);

    _cameraController = CameraController(
      cameras[_selfiemode ? 1 : 0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermission() async {
    final cameraPermisson = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final camerDenied =
        cameraPermisson.isDenied || cameraPermisson.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!camerDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPermission();
    _progressAnimationControlloer.addListener(() {
      setState(() {});
    });
    _progressAnimationControlloer.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  Future<void> toggleSelfieMode() async {
    _selfiemode = !_selfiemode;
    await initCamera();
    setState(() {});
  }

  Future<void> _startRecording(TapDownDetails _) async {
    if (_cameraController.value.isRecordingVideo) return;

    await _cameraController.startVideoRecording();
    _buttonAnimationController.forward();
    _progressAnimationControlloer.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) return;

    _buttonAnimationController.reverse();
    _progressAnimationControlloer.reset();

    final video = await _cameraController.stopVideoRecording();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          video: video,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _progressAnimationControlloer.dispose();
    _cameraController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasPermission
          ? _cameraController.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    CameraPreview(_cameraController),
                    Positioned(
                        top: 50,
                        right: 20,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                toggleSelfieMode();
                              },
                              child: Icon(
                                Icons.cameraswitch_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              onPressed: () => _setFlashMode(FlashMode.off),
                              icon: Icon(
                                Icons.flashlight_on_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _setFlashMode(FlashMode.off),
                              icon: Icon(
                                Icons.flashlight_off_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: 40,
                      child: GestureDetector(
                        onTapDown: _startRecording,
                        onTapUp: (details) => _stopRecording,
                        child: ScaleTransition(
                          scale: _buttonAnimation,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  color: Colors.red.shade400,
                                  strokeWidth: 6,
                                  value: _progressAnimationControlloer.value,
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : null
          : SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Requesting permissons....'),
                    SizedBox(
                      height: 50,
                    ),
                    CircularProgressIndicator.adaptive()
                  ],
                ),
              ),
            ),
    );
  }
}
