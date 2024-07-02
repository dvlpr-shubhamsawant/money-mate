import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox customFilledButton({title, icon, onpress}) {
  return SizedBox(
    width: double.infinity,
    height: 45.h,
    child: FilledButton.icon(
      onPressed: onpress,
      label: Text(
        "$title",
      ),
      icon: Icon(
        icon,
      ),
    ),
  );
}
