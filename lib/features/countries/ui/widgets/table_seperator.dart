import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableSeparator extends StatelessWidget {
  const TableSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: double.infinity,
      color: const Color(0xFFF2F2F2),
    );
  }
}
