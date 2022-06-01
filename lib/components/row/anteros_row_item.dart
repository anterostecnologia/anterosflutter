import 'package:anterosflutter/components/layouts/src/row.dart';
import 'package:flutter/material.dart';

typedef OnChanged<T> = void Function(T);

/// Enum variable that is used for determinate icon style inside
/// a [RowItem.boolean] widget.
enum IconBooleanStyle { filled, outlined }

/// Defines icon properties, used mostly inside a [RowItem.boolean] widget.
/// These properties are [Color] and [IconData].
///
/// There's also a named constructor, which builds an instance
/// based on a boolean parameter.
class _IconProperties {
  final Color? color;
  final IconData? icon;
  final ImageProvider? image;

  const _IconProperties(this.icon, this.color, this.image);

  factory _IconProperties.fromBoolean(bool? value, {IconBooleanStyle? style}) =>
      props[style!]![value]!;

  static Color validColor = Colors.green;
  static Color invalidColor = Colors.red;
  static Color unknownColor = Colors.blueGrey;

  static Map<IconBooleanStyle, Map<bool?, _IconProperties>> props = {
    IconBooleanStyle.filled: {
      true: _IconProperties(Icons.check_circle, validColor, null),
      false: _IconProperties(Icons.cancel, invalidColor, null),
      null: _IconProperties(Icons.help, unknownColor, null),
    },
    IconBooleanStyle.outlined: {
      true: _IconProperties(Icons.check_circle_outline, Colors.green, null),
      false: _IconProperties(Icons.highlight_off, Colors.red, null),
      null: _IconProperties(Icons.help_outline, Colors.blueGrey, null),
    },
  };
}

/// This widget has been designed to represent a text, with its associated value.
/// The [title] widget will be located at the left of the [AnterosRowItem] widget,
/// and the [description] widget, at the right.
class AnterosRowItem extends StatelessWidget {
  /// Main text of the widget, located at the left.
  final Widget title;

  /// Associated value of the [title] parameter, localed at the right.
  final Widget description;

  const AnterosRowItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnterosRow(
      fill: true,
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: title,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: description,
        ),
      ],
    );
  }

  /// Builds a 'text-to-text' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory AnterosRowItem.textToText(
    String title,
    String description, {
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return AnterosRowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: _Text(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.end,
        textOverflow: textOverflow,
        maxLines: maxLines,
        useDefaultDescriptionColor: true,
      ),
    );
  }

  /// Builds a 'icon-to-text' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory AnterosRowItem.iconToText(
    String title,
    String description, {
    ImageProvider? image,
    IconData? icon,
    Color? iconColor,
    double iconSize = 18,
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return AnterosRowItem(
      key: key,
      title: _TextIcon(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        size: iconSize,
        maxLines: maxLines,
        properties: _IconProperties(icon, iconColor, image),
      ),
      description: _Text(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.end,
        textOverflow: textOverflow,
        maxLines: maxLines,
        useDefaultDescriptionColor: true,
      ),
    );
  }

  /// Builds a 'text-to-Icon' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory AnterosRowItem.textToIcon(
    String title,
    String description, {
    ImageProvider? image,
    IconData? icon,
    Color? iconColor,
    double iconSize = 18,
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return AnterosRowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        useDefaultDescriptionColor: true,
        maxLines: maxLines,
      ),
      description: _TextIcon(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.end,
        textOverflow: textOverflow,
        size: iconSize,
        maxLines: maxLines,
        properties: _IconProperties(icon, iconColor, image),
      ),
    );
  }

  /// Builds a 'text-to-any' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory AnterosRowItem.textToAny(
    String title,
    Widget description, {
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return AnterosRowItem(
      key: key,
      title: Container(
          child: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      )),
      description: _Any(description),
    );
  }

  /// Builds a 'any-to-text' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory AnterosRowItem.anyToText(
    Widget description,
    String title, {
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return AnterosRowItem(
        key: key,
        title: _Any(description),
        description: _Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.start,
          textOverflow: textOverflow,
          maxLines: maxLines,
        ));
  }

  /// Builds a 'any-to-any' widget. Useful when the associated
  /// value can be represented with a [Text] widget.
  factory AnterosRowItem.anyToAny(
    Widget title,
    Widget description, {
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    int? maxLines,
  }) {
    return AnterosRowItem(
      key: key,
      title: _Any(title),
      description: _Any(description),
    );
  }

  /// Builds a 'text-to-boolean' widget. Useful when the associated
  /// value with a boolean value, which can be represented with an icon.
  /// You can select outlined icons using the [outline] parameter.
  factory AnterosRowItem.boolean(
    String title,
    bool? value, {
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    int? maxLines,
    Color? iconColor,
    double iconSize = 18,
    IconBooleanStyle iconStyle = IconBooleanStyle.outlined,
  }) {
    return AnterosRowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: _Icon(
        properties: _IconProperties.fromBoolean(
          value,
          style: iconStyle,
        ),
        color: iconColor,
        size: iconSize,
      ),
    );
  }

  /// Builds a 'icon-to-boolean' widget. Useful when the associated
  /// value with a boolean value, which can be represented with an icon.
  /// You can select outlined icons using the [outline] parameter.
  factory AnterosRowItem.iconToBoolean(
    String title,
    bool? value,
    IconData? icon,
    ImageProvider? image,
    String description, {
    Color? iconColor,
    double iconSize = 18,
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
    IconBooleanStyle iconStyle = IconBooleanStyle.outlined,
  }) {
    return AnterosRowItem(
      key: key,
      title: _TextIcon(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.end,
        textOverflow: textOverflow,
        maxLines: maxLines,
        properties: _IconProperties(icon, iconColor, image),
      ),
      description: _Icon(
        properties: _IconProperties.fromBoolean(
          value,
          style: iconStyle,
        ),
        color: iconColor,
        size: iconSize,
      ),
    );
  }

  /// Builds a 'text-to-switch' widget. Useful when the associated
  /// value with a boolean value, which can be represented with an icon.
  /// You can select outlined icons using the [outline] parameter.
  factory AnterosRowItem.textToSwitchBool(
    String title,
    bool value, {
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    Color? activeColor,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    int? maxLines,
    bool enabled = true,
    OnChanged<bool>? onChanged,
  }) {
    return AnterosRowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: Container(
          height: 26,
          width: 40,
          child: Switch(
              activeColor: activeColor,
              activeTrackColor: activeTrackColor,
              inactiveThumbColor: inactiveThumbColor,
              inactiveTrackColor: inactiveTrackColor,
              value: value,
              onChanged: enabled ? onChanged : null)),
    );
  }

  /// Builds a 'icon-to-switch' widget. Useful when the associated
  /// value with a boolean value, which can be represented with an icon.
  /// You can select outlined icons using the [outline] parameter.
  factory AnterosRowItem.iconToSwitchBool(
    String title,
    bool value, {
    ImageProvider? image,
    IconData? icon,
    Color? iconColor,
    double iconSize = 18,
    Key? key,
    TextStyle? titleStyle,
    TextOverflow? textOverflow,
    Color? activeColor,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    int? maxLines,
    bool enabled = true,
    OnChanged<bool>? onChanged,
  }) {
    return AnterosRowItem(
        key: key,
        title: _TextIcon(
          title,
          style: titleStyle,
          textAlign: TextAlign.start,
          textOverflow: textOverflow,
          maxLines: maxLines,
          properties: _IconProperties(icon, iconColor, image),
        ),
        description: Container(
          height: 26,
          width: 40,
          child: Switch.adaptive(
              activeColor: activeColor,
              activeTrackColor: activeTrackColor,
              inactiveThumbColor: inactiveThumbColor,
              inactiveTrackColor: inactiveTrackColor,
              value: value,
              onChanged: enabled ? onChanged : null),
        ));
  }

  /// Builds a 'text-to-text' widget. It allows the associated value,
  /// in this case a [Text] widget, to be clickable by the user.
  factory AnterosRowItem.tap(
    String title,
    String description, {
    Key? key,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextOverflow? textOverflow,
    int? maxLines,
    VoidCallback? onTap,
  }) {
    return AnterosRowItem(
      key: key,
      title: _Text(
        title,
        style: titleStyle,
        textAlign: TextAlign.start,
        textOverflow: textOverflow,
        maxLines: maxLines,
      ),
      description: InkWell(
        onTap: onTap,
        child: _Text(
          description,
          style: descriptionStyle,
          textAlign: TextAlign.end,
          textOverflow: textOverflow,
          maxLines: maxLines,
          clickable: onTap != null,
          useDefaultDescriptionColor: true,
        ),
      ),
    );
  }
}

/// Returns an icon based on the [value] variable.
/// Various [Icon] parameters can be set as well.
class _Icon extends StatelessWidget {
  final _IconProperties? properties;
  final Color? color;
  final double? size;

  const _Icon({
    Key? key,
    this.properties,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      properties!.icon,
      color: color ?? properties!.color,
      size: size,
    );
  }
}

/// Returns a [Text] widget com [Icon], using the [text] variable and .
/// It checks if can be clickable, with the [clickable] parameter.
/// Various of its paremeters can be set.
class _TextIcon extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final bool clickable;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool useDefaultDescriptionColor;
  final _IconProperties? properties;
  final Color? color;
  final double? size;

  const _TextIcon(
    this.data, {
    Key? key,
    this.style,
    this.clickable = false,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.useDefaultDescriptionColor = false,
    this.properties,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: useDefaultDescriptionColor
                  ? Theme.of(context).textTheme.caption!.color
                  : null,
              decoration:
                  clickable ? TextDecoration.underline : TextDecoration.none,
            ),
        child: AnterosRow(children: [
          properties!.icon != null
              ? Icon(
                  properties!.icon,
                  color: color ?? properties!.color,
                  size: size,
                )
              : SizedBox(width: 0, height: 0),
          properties!.image != null
              ? Image(
                  image: properties!.image!,
                  width: size,
                  height: size,
                )
              : SizedBox(width: 0, height: 0),
          SizedBox(width: 4),
          Text(
            data,
            overflow: textOverflow ?? TextOverflow.ellipsis,
            maxLines: maxLines,
            textAlign: textAlign,
            style: style,
          ),
        ]));
  }
}

/// Returns a [Text] widget, using the [text] variable.
/// It checks if can be clickable, with the [clickable] parameter.
/// Various of its paremeters can be set.
class _Text extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final bool clickable;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool useDefaultDescriptionColor;

  const _Text(
    this.data, {
    Key? key,
    this.style,
    this.clickable = false,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.useDefaultDescriptionColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: useDefaultDescriptionColor
                ? Theme.of(context).textTheme.caption!.color
                : null,
            decoration:
                clickable ? TextDecoration.underline : TextDecoration.none,
          ),
      child: Text(
        data,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}

/// Returns a [Text] widget, using the [text] variable.
/// It checks if can be clickable, with the [clickable] parameter.
/// Various of its paremeters can be set.
class _Any extends StatelessWidget {
  final Widget data;

  const _Any(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.data;
  }
}
