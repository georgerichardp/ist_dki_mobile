import 'package:flutter/material.dart';
import '../../../core/palette/palette.dart';
import '../../style/text_style/i_text_style.dart';
import '../../../core/extensions/i_extensions.dart';
import '../app_bar/i_app_bar.dart';
import '../icon/i_icon.dart';
import '../indicator/i_indicator_rounded.dart';

class ITextFieldPin extends StatefulWidget {
  final Function(String value)? onSubmit;

  ///pakai function ini untuk mode konfirmasi pin.
  ///jika return false maka konfirmasi pin gagal,
  ///jika true maka konfirmasi pin sukses.
  ///silahkan masukan logic anda
  final Future<bool> Function(String value)? validator;
  final String title;
  final String description;
  const ITextFieldPin(
      {Key? key,
      required this.onSubmit,
      this.validator,
      this.title = "",
      this.description = ""})
      : super(key: key);

  @override
  State<ITextFieldPin> createState() => _ITextFieldPinState();
}

class _ITextFieldPinState extends State<ITextFieldPin> {
  String value = "";
  bool confirmFailed = false;
  bool showFailedDialog = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IAppBar.center(title: widget.title),
      body: Column(
        children: [
          Expanded(
            child: _data(),
          ),
          _showFailed(),
          _keyPad(),
        ],
      ),
    );
  }

  Widget _showFailed() {
    return showFailedDialog
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding2),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Palette.dangerMain,
                  borderRadius: BorderRadius.circular(context.padding1)),
              child: Padding(
                padding: EdgeInsets.all(context.padding2),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "PIN Tidak Sesuai",
                      style: IBody.regular(color: Palette.neutral10),
                    )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            showFailedDialog = false;
                          });
                        },
                        child: const IIcon(
                          icon: Icons.close,
                          color: Palette.neutral10,
                        ))
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _data() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding7),
      child: Column(
        children: [
          context.sbHeight(size: context.padding3),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: IBody.regular(),
          ),
          context.sbHeight(size: context.padding3),
          IIcon(
            icon: "assets/icons/Lock-Dollar.png",
            size: context.mQWidth(0.2),
            color: Palette.successMain,
          ),
          context.sbHeight(size: context.padding3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 6; i++)
                confirmFailed
                    ? IIndicatorRounded.pin(
                        indicatorTypePin: IIndicatorTypePin.failed,
                      )
                    : value.length > i
                        ? IIndicatorRounded.pin(
                            indicatorTypePin: IIndicatorTypePin.success,
                          )
                        : IIndicatorRounded.pin(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _keyPad() {
    return Column(
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            _buttonNumber(1),
            _buttonNumber(2),
            _buttonNumber(3),
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            _buttonNumber(4),
            _buttonNumber(5),
            _buttonNumber(6),
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            _buttonNumber(7),
            _buttonNumber(8),
            _buttonNumber(9),
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 50, width: 50, child: Text("")),
            _buttonNumber(0),
            InkWell(
              onTap: () {
                setState(() {
                  if (value.isNotEmpty) {
                    confirmFailed = false;
                    showFailedDialog = false;
                    value = value.substring(0, value.length - 1);
                  }
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.backspace_outlined,
                  color: Palette.neutral80,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buttonNumber(int number) {
    return SizedBox(
      height: 50,
      width: 50,
      // decoration: BoxDecoration(
      //   color: Palette.neutral20,
      //   borderRadius: BorderRadius.circular(8)
      // ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              if (value.length < 6) {
                value += number.toString();
              }
              if (value.length == 6) {
                if (widget.validator != null) {
                  widget.validator!(value).then((value) {
                    if (!value) {
                      setState(() {
                        confirmFailed = true;
                        showFailedDialog = true;
                      });
                      Future.delayed(const Duration(milliseconds: 2000))
                          .then((value) {
                        setState(() {
                          showFailedDialog = false;
                        });
                      });
                    } else {
                      if (widget.onSubmit != null) {
                        widget.onSubmit!(this.value);
                      }
                    }
                  });
                } else {
                  if (widget.onSubmit != null) {
                    widget.onSubmit!(value);
                  }
                }
              }
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Text(
              number.toString(),
              textAlign: TextAlign.center,
              style: ITitle.xlBold(color: Palette.neutral80),
            ),
          ),
        ),
      ),
    );
  }
}
