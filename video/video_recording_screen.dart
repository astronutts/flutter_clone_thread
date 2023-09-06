import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPermission = false;
  bool _selfiemode = false;
  late CameraController _cameraController;

  //카메라 초기화
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    print(cameras);

    _cameraController = CameraController(
        cameras[_selfiemode ? 1 : 0], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPermission();
  }

  Future<void> toggleSelfieMode() async {
    _selfiemode = !_selfiemode;
    await initCamera();
    setState(() {});
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
                        child: GestureDetector(
                          onTap: () {
                            toggleSelfieMode();
                          },
                          child: Icon(
                            Icons.cameraswitch_rounded,
                            color: Colors.black,
                            size: 50,
                          ),
                        ))
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
