import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../core/palette/palette.dart';
import '../icon/i_icon.dart';
import '../../../core/extensions/i_extensions.dart';
import '../image/i_image.dart';
class ICameraRecognition extends StatefulWidget {
  const ICameraRecognition({Key? key}) : super(key: key);

  @override
  State<ICameraRecognition> createState() => _ICameraRecognitionState();
}

class _ICameraRecognitionState extends State<ICameraRecognition> {
  late CameraController controllerCamera;
  late List<CameraDescription> cameras;
  @override
  void initState() {
    super.initState();
  }

  Future<void> getCameras() async {
    var cameras = await availableCameras();
    controllerCamera = CameraController(cameras[0], ResolutionPreset.medium);
    await controllerCamera.initialize().then((_) {
      if (!mounted) {
        return;
      }
    });
  }
  void cameraStream(){
    controllerCamera.startImageStream((image){

    });
  }

  @override
  void dispose() {
    super.dispose();
    controllerCamera.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.neutral100,
      body: SafeArea(
        child: FutureBuilder(
          future: getCameras(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(
                    child: CameraPreview(
                      controllerCamera,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(context.padding2),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(context.padding2),
                                border: Border.all(
                                    color: Palette.neutral10, width: 3)),
                          ),
                          Positioned(
                            top: context.mQHeight(0.05),
                            child: SizedBox(
                              width: context.mQWidth(1),
                              height: context.mQHeight(0.05),
                              child: const IIcon(
                                icon: "assets/icons/logo-jakone-mobile.png",
                                color: Palette.neutral10,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(context.padding6),
                                child: const IImage(
                                    image:
                                    "assets/images/border-camera-id-card.png"),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ),
                      InkWell(
                        onTap: () {
                          if (!controllerCamera.value.isTakingPicture) {
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IIcon(
                              icon: Icons.camera, size: context.mQHeight(0.1)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: IIcon(
                            icon: Icons.close,
                            color: Palette.neutral10,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
