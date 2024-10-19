import 'dart:async';

import 'package:camera/camera.dart';
import 'package:espoir_model_application/main.dart';
import 'package:flutter/material.dart';

class CameraDetectorPage extends StatefulWidget {
  const CameraDetectorPage({super.key});

  @override
  State<CameraDetectorPage> createState() => _CameraDetectorPageState();
}

class _CameraDetectorPageState extends State<CameraDetectorPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;
  late AnimationController _animationController;
  late AnimationController _recController;
  bool _isBlinking = false;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _flashModeControlRowAnimationController;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;
  double _baseScale = 1.0;
  double _currentScale = 1.0;
  final double _minAvailableZoom = 1.0;
  final double _maxAvailableZoom = 1.0;

  Timer? _timer;
  Timer? _timerTakePicture;
  int _elapsedSeconds = 0;
  bool _isRunning = false;

  void _togglePlayPause() {
    setState(() {
      if (_isRunning) {
        _timer!.cancel();
        _timerTakePicture!.cancel();
      } else {
        _startTimer();
        // _startDection();
      }
      _isRunning = !_isRunning;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  // void _startDection() {
  //   _timerTakePicture = Timer.periodic(
  //     const Duration(seconds: 5),
  //     (timer) async {
  //       await onTakePictureButtonPressed();
  //     },
  //   );
  // }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _recController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    ); // Animation qui se répète indéfiniment

    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );

    controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    controller!.initialize().then(
      (_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      },
    ).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'Accès à la caméra refusée !!!':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _flashModeControlRowAnimationController.dispose();
    _animationController.dispose();
    _recController.dispose();
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    if (_timerTakePicture != null && _timerTakePicture!.isActive) {
      _timerTakePicture!.cancel();
    }
    super.dispose();
  }

  void _toggleBlinking() {
    setState(() {
      if (_isBlinking) {
        _recController.stop(); // Arrête le clignotement
      } else {
        _recController.repeat(reverse: true); // Relance le clignotement
      }
      _isBlinking = !_isBlinking;
    });
  }

  void _toggleIcon() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Center(child: _cameraPreviewWidget()),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 10),
                          child: FadeTransition(
                            opacity: _isBlinking
                                ? _recController
                                : const AlwaysStoppedAnimation<double>(1.0),
                            child: const Icon(
                              Icons.circle,
                              color: Colors.red,
                              size: 15.0,
                            ),
                          ),
                        ),
                        Text(
                          _formatTime(_elapsedSeconds),
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                          icon: const Icon(Icons.flash_on),
                          color: Colors.red,
                          onPressed: controller != null
                              ? onFlashModeButtonPressed
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        left: 20,
                      ),
                      child: _flashModeControlColumnWidget(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (controller != null &&
                              controller!.value.isInitialized &&
                              !controller!.value.isRecordingVideo &&
                              _animationController.status ==
                                  AnimationStatus.completed) {
                            await onTakePictureButtonPressed();
                          }
                        },
                        icon: const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _toggleIcon();
                          _togglePlayPause();
                          _toggleBlinking();
                        },
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.pause_play,
                          color: Colors.white,
                          size: 100,
                          progress: _animationController,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const ReportPage(),
                          //     ));
                          // Navigator.replace(context,
                          //     oldRoute: MaterialPageRoute(
                          //       builder: (context) => const ModelDetectorPage(),
                          //     ),
                          //     newRoute: MaterialPageRoute(
                          //       builder: (context) => const ReportPage(),
                          //     ));
                        },
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Taper la caméra',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onTapDown: (TapDownDetails details) =>
                  onViewFinderTap(details, constraints),
            );
          }),
        ),
      );
    }
  }

  Future onTakePictureButtonPressed() async {
    takePicture().then((XFile? file) async {
      if (mounted) {
        setState(() {
          imageFile = file;
          // videoController?.dispose();
          // videoController = null;
        });
        if (file != null) {
          // showInSnackBar('Picture saved to ${file.path}');
          showInSnackBar('Photo prise et bien envoyer au model');
          // await DectorRemoteDatasource().dection(file);
          showInSnackBar('Réponse du model reçu avec succès.');
        }
      }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
      // _exposureModeControlRowAnimationController.reverse();
      // _focusModeControlRowAnimationController.reverse();
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller!.setZoomLevel(_currentScale);
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final CameraController cameraController = controller!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 700),
    ));
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  Widget _flashModeControlColumnWidget() {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.flash_off),
              color: controller?.value.flashMode == FlashMode.off
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.off)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_auto),
              color: controller?.value.flashMode == FlashMode.auto
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_on),
              color: controller?.value.flashMode == FlashMode.always
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.always)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.highlight),
              color: controller?.value.flashMode == FlashMode.torch
                  ? Colors.orange
                  : Colors.white,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
