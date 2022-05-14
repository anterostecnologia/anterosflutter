import 'package:anterosflutter/components/alert/anteros_cool_alert.dart';
import 'package:anterosflutter/components/alert/src/constants/images.dart';
import 'package:anterosflutter/components/alert/src/models/cool_alert_options.dart';
import 'package:anterosflutter/components/alert/src/utils/single_loop_controller.dart';
import 'package:anterosflutter/components/alert/src/widgets/cool_alert_buttons.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnterosCoolAlertContainer extends StatelessWidget {
  final AnterosCoolAlertOptions? options;

  const AnterosCoolAlertContainer({
    Key? key,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _header = _buildHeader(context);
    final _title = _buildTitle(context);
    final _text = _buildText(context);
    final _buttons = _buildButtons();
    final _widget = _buildWidget(context);

    final _content = Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _title,
          const SizedBox(
            height: 5.0,
          ),
          _text,
          _widget!,
          const SizedBox(
            height: 10.0,
          ),
          _buttons
        ],
      ),
    );

    return Container(
      width: options!.width ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_header, _content],
      ),
    );
  }

  Widget _buildHeader(context) {
    if (options!.type == AnterosCoolAlertType.loading) {
      return Container();
    } else {
      String? anim = AppAnim.success;

      switch (options!.type) {
        case AnterosCoolAlertType.success:
          anim = AppAnim.success;
          break;
        case AnterosCoolAlertType.error:
          anim = AppAnim.error;
          break;
        case AnterosCoolAlertType.warning:
          anim = AppAnim.warning;
          break;
        case AnterosCoolAlertType.confirm:
          anim = AppAnim.question;
          break;
        case AnterosCoolAlertType.info:
          anim = AppAnim.info;
          break;
        default:
          anim = AppAnim.info;
      }

      if (options!.flareAsset != null) {
        anim = options!.flareAsset;
      }
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: options!.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(options!.borderRadius!),
            topRight: Radius.circular(options!.borderRadius!),
          ),
        ),
        child: Container(
          height: 150,
          width: 150,
          child: options!.lottieAsset == null
              ? FlareActor(
                  anim,
                  animation: options!.loopAnimation
                      ? options!.flareAnimationName
                      : null,
                  controller: options!.loopAnimation
                      ? null
                      : SingleLoopController(
                          options!.flareAnimationName!,
                          1,
                        ),
                )
              : Lottie.asset(options!.lottieAsset!),
        ),
      );
    }
  }

  Widget _buildTitle(context) {
    if (options!.type == AnterosCoolAlertType.loading) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Container(
          height: 100,
          width: 100,
          child: options!.lottieAsset == null
              ? FlareActor(
                  AppAnim.loading,
                  animation: options!.flareAnimationName,
                )
              : Lottie.asset(options!.lottieAsset!),
        ),
      );
    } else {
      final title = options!.title ?? _whatTitle();
      return Visibility(
        visible: title != null,
        child: Text(
          '$title',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }
  }

  Widget _buildText(context) {
    if (options!.text == null &&
        options!.type != AnterosCoolAlertType.loading) {
      return Container();
    } else {
      String? text = '';
      if (options!.type == AnterosCoolAlertType.loading) {
        text = options!.text ?? 'Carregando...';
      } else {
        text = options!.text;
      }
      return Text(
        text ?? '',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget? _buildWidget(context) {
    if (options!.widget == null &&
        options!.type != AnterosCoolAlertType.custom) {
      return Container();
    } else {
      Widget widget = Container();
      if (options!.type == AnterosCoolAlertType.custom) {
        widget = options!.widget ?? widget;
      }
      return options!.widget;
    }
  }

  Widget _buildButtons() {
    if (options!.type == AnterosCoolAlertType.loading) {
      return Container();
    } else {
      return AnterosCoolAlertButtons(
        options: options,
      );
    }
  }

  String? _whatTitle() {
    switch (options!.type) {
      case AnterosCoolAlertType.success:
        return 'Sucesso!!!';
      case AnterosCoolAlertType.error:
        return 'Erro!!!';
      case AnterosCoolAlertType.warning:
        return 'Atenção!!!';
      case AnterosCoolAlertType.confirm:
        return 'Como vai você?';
      case AnterosCoolAlertType.info:
        return 'Informação!';
      case AnterosCoolAlertType.custom:
        return null;
      case AnterosCoolAlertType.loading:
        return null;
      default:
        return null;
    }
  }
}
