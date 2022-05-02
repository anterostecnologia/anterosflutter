import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import './utils/app.dart';
import 'all_control_widgets.dart';
import 'color_picker_card.dart';
import 'picker_text_fields/text_field_focus_demo.dart';
import 'picker_toggle_buttons/actions_order_switch.dart';

class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  bool fav = false;
  bool fav1 = false;
  bool fav2 = false;
  @override
  Widget build(BuildContext context) {
    // Used for a simple scrollable column based responsive layout
    final double width = MediaQuery.of(context).size.width;
    // That can have 1 to max 4 columns
    int columns = width ~/ App.minColumnWidth;
    if (columns < 1) columns = 1;
    if (columns > 4) columns = 4;

    // ScrollControllers for potential 4 List views
    final ScrollController scrollOne = ScrollController();
    final ScrollController scrollTwo = ScrollController();
    final ScrollController scrollThree = ScrollController();
    final ScrollController scrollFour = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: AnterosColors.SUCCESS,
          ),
        ),
        title: const Text(
          'Seletor de cores',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
          child: Row(
            // The Row contains 1 to 4 ListViews, each in an Expanded widget.
            //
            // Based on width, the 1st one can contain, col 1, 1+2 or 1+2+3+4
            children: <Widget>[
              Expanded(
                child: Scrollbar(
                  controller: scrollOne,
                  isAlwaysShown: true,
                  interactive: true,
                  child: ListView(
                    controller: scrollOne,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).padding.top +
                              kToolbarHeight),
                      const _Column1(),
                      if (columns < 3) const _Column2(),
                      if (columns < 2) const _Column3(),
                      if (columns < 2) const _Column4(),
                    ],
                  ),
                ),
              ),
              //
              // Based on width, the 2nd one can contain, col 3+4 or col 2,
              // when we have 2 columns or more.
              if (columns > 1)
                Expanded(
                  child: Scrollbar(
                    controller: scrollTwo,
                    isAlwaysShown: true,
                    interactive: true,
                    child: ListView(
                      controller: scrollTwo,
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).padding.top +
                                kToolbarHeight),
                        if (columns == 3 || columns == 4) const _Column2(),
                        if (columns < 3) const _Column3(),
                        if (columns < 3) const _Column4(),
                      ],
                    ),
                  ),
                ),
              //
              // Based on width, the 3rd one can contain, col 3 or col 3+4,
              // when we have 3 columns or more.
              if (columns > 2)
                Expanded(
                  child: Scrollbar(
                    controller: scrollThree,
                    isAlwaysShown: true,
                    interactive: true,
                    child: ListView(
                      controller: scrollThree,
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).padding.top +
                                kToolbarHeight),
                        // Show the selected color in a dialog
                        const _Column3(),
                        if (columns < 4) const _Column4(),
                      ],
                    ),
                  ),
                ),
              //
              // The 4th one only shows the 4th column when we have 4 columns.
              if (columns > 3)
                Expanded(
                  child: Scrollbar(
                    controller: scrollFour,
                    isAlwaysShown: true,
                    interactive: true,
                    child: ListView(
                      controller: scrollFour,
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).padding.top +
                                kToolbarHeight),
                        const _Column4(),
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
}

class _Column1 extends StatelessWidget {
  const _Column1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 14),
          child: Text(
            'Color Picker',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        // Show the color selected in a dialog and open a dialog to change it.
        const DialogPickerColorIndicator(),
        // Show the color selected in the picker in a Card below.
        const CardPickerColorIndicator(),
        // Show the picker meta remote control widget.
        const MetaPickerColorIndicator(),
        // The color picker in a Card.
        const Padding(
          padding: EdgeInsets.all(6),
          child: ColorPickerCard(),
        ),

        ListTile(
          subtitle: Wrap(runSpacing: 8, children: const <Widget>[
            OnStartColorIndicator(),
            SizedBox(width: 8),
            OnChangedColorIndicator(),
            SizedBox(width: 8),
            OnEndColorIndicator(),
          ]),
        ),
        const ListTile(
          title: Text('Callbacks de mudança de cor'),
          subtitle: Text(
              'Os retornos de chamada acima são coloridos antes do início da mudança, '
              'during change and when change ended.'),
        ),
        const Divider(),
        const CopyFormatSwitch(),
        const SizedBox(height: 8),
        const ListTile(
          title: Text('Selecione e COPIE um valor de cor. COLE no selecionador '
              'com botões da barra de ferramentas, menu de contexto ou atalhos de teclado.\n'
              'Try these:'),
          subtitle: SelectableText('Primary FF7B1FA2  Accent FFCCFF90  '
              'BW FFF9F9F9\n'
              'Custom #014443  Wheel 0xFF6E55C4  ShortWeb 5EC\n'
              'Partial #DDFF  Opacity #99FF9800  Fail 94G02\n'
              'PASTE suporta todos os formatos acima. COPY no formato selecionado.'),
        ),
        const ParseShortHexCodeSwitch(),
        const Divider(),
        const TextFieldFocusDemo(),
        const Divider(),
      ],
    );
  }
}

class _Column2 extends StatelessWidget {
  const _Column2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 14),
          child: Text(
            'Mostrar e ocultar',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        //
        const PickersEnabledSwitch(),
        const SizedBox(height: 8),

        const ShadesSwitch(),
        const Index850Switch(),
        const TonalSwitch(),
        const OpacitySwitch(),
        const Divider(),
        //
        const MaterialNameSwitch(),
        const ColorNameSwitch(),
        const ColorCodeSwitch(),
        const ColorCodeHasColorSwitch(),
        const ColorCodeReadOnlySwitch(),
        const ColorValueSwitch(),
        const RecentColorsSwitch(),
        const Divider(),
        //
        const TitleSwitch(),
        const HeadingSwitch(),
        const SubheadingSwitch(),
        const TonalSubheadingSwitch(),
        const OpacitySubheadingSwitch(),
        const RecentSubheadingSwitch(),
        const Divider(),
      ],
    );
  }
}

class _Column3 extends StatelessWidget {
  const _Column3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 14),
          child: Text(
            'Design do seletor',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        // Color picker size
        const ItemSizeSlider(),
        const BorderRadiusSlider(),
        const ElevationSlider(),
        const SpacingSlider(),
        const RunSpacingSlider(),
        const HasBorderSwitch(),
        const Divider(),
        //
        const WheelDiameterSlider(),
        const WheelWidthSlider(),
        const WheelSquarePaddingSlider(),
        const WheelSquareBorderRadiusSlider(),
        const WheelHasBorderSwitch(),
        const Divider(),
        //
        const OpacityTrackHeightSlider(),
        const OpacityTrackWidthSlider(),
        const OpacityThumbRadiusSlider(),
        const Divider(),
        //
        const EnableTooltipsSwitch(),
        const Divider(),
      ],
    );
  }
}

class _Column4 extends StatelessWidget {
  const _Column4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 14),
          child: Text(
            'Layout do seletor',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const AlignmentSwitch(),
        const ColumnSpacingSlider(),
        const PaddingSlider(),
        const CloseButtonSwitch(),
        const OkButtonSwitch(),
        const CloseIsLastSwitch(),
        const DialogActionsButtonsSwitch(),
        const ActionsOrderSwitch(),
        const DialogActionIconsSwitch(),
        const Divider(),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 0, 14),
          child: Text(
            'Copiar e colar ações',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const ControlCopySwitch(),
        const ControlPasteSwitch(),
        const PickerAutoFocusSwitch(),
        const ToolbarCopySwitch(),
        const ToolbarPasteSwitch(),
        const EditFieldCopySwitch(),
        const SecondaryMenuSwitch(),
        const LongPressMenuSwitch(),
        const SecondaryDesktopLongDeviceSwitch(),
        const SecondaryDesktopLongWebDeviceSwitch(),
        const EditUsesParsedPasteSwitch(),
        const SnackbarParseErrorSwitch(),
        const FeedbackParseErrorSwitch(),
        const Divider(),
      ],
    );
  }
}
