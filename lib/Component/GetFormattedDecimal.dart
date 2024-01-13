getFormattedDecimal({required double? value, int? dp}) {
  if (dp == null) {
    return value?.toStringAsFixed(2) ?? '';
  } else {
    return value?.toStringAsFixed(dp) ?? '';
  }
}
