import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/ProductSize.dart';

class SelectableCircleSize extends StatefulWidget {
  final List<ProductSize> productSize;
  final Color? selectedColor;
  final Color? baseColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final int initialIndex;
  final ValueChanged<int>? onChanged; // ✅ notify parent

  const SelectableCircleSize({
    Key? key,
    required this.productSize,
    this.margin,
    this.padding,
    this.selectedColor,
    this.baseColor,
    this.textStyle,
    this.selectedTextStyle,
    this.initialIndex = -1, // -1 = none selected
    this.onChanged,
  }) : super(key: key);

  @override
  _SelectableCircleSizeState createState() => _SelectableCircleSizeState();
}

class _SelectableCircleSizeState extends State<SelectableCircleSize> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _change(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(index);
    }
  }

  TextStyle _getTextStyle(int index) {
    if (index == _selectedIndex) {
      return widget.selectedTextStyle ??
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600);
    } else {
      return widget.textStyle ??
          const TextStyle(color: AppColor.primary, fontWeight: FontWeight.w600);
    }
  }

  Color _getBackgroundColor(int index) {
    if (index == _selectedIndex) {
      return widget.selectedColor ?? AppColor.secondary;
    } else {
      return widget.baseColor ?? AppColor.primarySoft;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Wrap(
        spacing: 20,
        runSpacing: 8,
        children: List.generate(widget.productSize.length, (index) {
          return InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => _change(index),
            child: Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: _getBackgroundColor(index),
              ),
              child: Text(
                widget.productSize[index].name,
                style: _getTextStyle(index),
              ),
            ),
          );
        }),
      ),
    );
  }
}
