import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class TakePicture extends StatefulWidget {
  TakePicture({super.key});

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  late CameraController _controller;
  late Future<void>? _initializeControllerFuture;

  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeControllerCamera();
  }

  Future<void>? _initializeControllerCamera() async {
     // Verifica e solicita permissão para usar a câmera
    var status = await Permission.camera.status;
    if (status.isDenied) {
      status = await Permission.camera.request();
      if (status.isDenied) {
        // Permissão negada permanentemente, você pode guiar o usuário para a tela de configurações
        openAppSettings();
        return;
      }
    }
    try {
      var cameras = await availableCameras();
      CameraDescription camera = cameras.first;
      _controller = CameraController(camera, ResolutionPreset.medium);
      await _controller.initialize();
    } catch(e) {
      return Future.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(future: _initializeControllerFuture, 
      builder: (context, snapshot) {
        var connectionState = snapshot.connectionState;
        if (connectionState == ConnectionState.done) {
          if (_controller.value.isInitialized) {
          return CameraPreview(_controller);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      ),
      floatingActionButton: IconButton(onPressed: () async {
        try {
          XFile file = await _controller.takePicture();
          Navigator.of(context).pop(file.path);
        } catch(e) {
          print(e);
        }
      }, icon: Icon(Icons.camera),),
    );
  }
}