import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/ColorWay.dart';

class SelectableCircleColor extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<ColorWay> colorWay;
  final int initialIndex;
  final ValueChanged<int>? onChanged; // ✅ callback to parent

  const SelectableCircleColor({
    Key? key,
    required this.colorWay,
    this.margin,
    this.padding,
    this.initialIndex = -1, // -1 = none selected
    this.onChanged,
  }) : super(key: key);

  @override
  _SelectableCircleColorState createState() => _SelectableCircleColorState();
}

class _SelectableCircleColorState extends State<SelectableCircleColor> {
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
      widget.onChanged!(index); // ✅ Notify parent
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
        children: List.generate(widget.colorWay.length, (index) {
          final isSelected = index == _selectedIndex;

          return InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => _change(index),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: AppColor.primarySoft,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: widget.colorWay[index].color,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 4,
                    color: isSelected
                        ? AppColor.primarySoft.withOpacity(0.9)
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
