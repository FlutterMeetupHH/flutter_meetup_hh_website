enum ContentPadding {
  none,
  small,
  normal,
  large,
}

extension ContentPaddingFunctions on ContentPadding {
  double get value => const {
        ContentPadding.none: 0.0,
        ContentPadding.small: 8.0,
        ContentPadding.normal: 12.0,
        ContentPadding.large: 24.0,
      }[this];
}
