import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
import '../../../router/route.dart';
import '../app_bar/i_app_bar.dart';
import '../button/i_button.dart';
import '../icon/i_icon.dart';
import '../image/i_image.dart';
import '../../../core/extensions/i_extensions.dart';

Future goToCameraIdCard(
  BuildContext context, {
  RouteType routeType = RouteType.push,
}) {
  return goTo(context, page: const ICameraIdCard(), routeType: routeType);
}

class ICameraIdCard extends StatefulWidget {
  const ICameraIdCard({Key? key}) : super(key: key);

  @override
  State<ICameraIdCard> createState() => _ICameraIdCardState();
}

class _ICameraIdCardState extends State<ICameraIdCard> {
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
                            controllerCamera.takePicture().then((value) async {
                              var file = File(value.path);
                              // final fileCrop =
                              var res = await goToCameraIdCardDisplay(context, file);
                              Navigator.pop(context,res);
                            });
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

Future goToCameraIdCardDisplay(BuildContext context, File? file) {
  return goTo(context,
      page: ICameraIdCardDisplay(file: file), routeType: RouteType.push);
}

class ICameraIdCardDisplay extends StatefulWidget {
  final File? file;
  const ICameraIdCardDisplay({Key? key, required this.file}) : super(key: key);

  @override
  State<ICameraIdCardDisplay> createState() => _ICameraIdCardDisplayState();
}

class _ICameraIdCardDisplayState extends State<ICameraIdCardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IAppBar.none(),
      backgroundColor: Palette.neutral100,
      body: Column(
        children: [
          const Spacer(),
          IImage(
            image: widget.file,
            width: context.mQWidth(1),
            height: context.mQWidth(1),
          ),
          context.sbHeight(),
          Padding(
            padding: EdgeInsets.all(context.padding3),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: IButton.primary(
                    onPressed: () {
                      Navigator.of(context).pop(widget.file);
                    },
                    title: "Gunakan Foto",
                  ),
                ),
                context.sbHeight(size: context.padding2),
                SizedBox(
                  width: double.infinity,
                  child: IButton.white(
                    onPressed: () {
                      goToCameraIdCard(context,
                          routeType: RouteType.pushReplace);
                    },
                    title: "Foto Ulang",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
