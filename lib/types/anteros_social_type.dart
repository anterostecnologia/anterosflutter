enum AnterosSocialType {
  facebook,
  whatsapp,
  twitter,
  google,
  dribble,
  linkedin,
  youtube,
  slack,
  pinterest,
  wechat,
  line,
}

enum AnterosSocialButtonType {
  /// Default type is [AnterosSocialButtonType.solid], used to fill with color for widget
  solid,

  /// Type [AnterosSocialButtonType.outline], used for widget with outline border and fill color with Colors.transparent
  outline,

  /// Type [AnterosSocialButtonType.outline2x], used for widget with outline2x border and border.width = 2.0 and fill color with Colors.transparent
  outline2x,

  /// Type [AnterosSocialButtonType.transparent], used for widget with fill color with Colors.transparent
  transparent,

  /// Type [AnterosSocialButtonType.icon], used for widget with just icon filled in square container
  icon,
}
