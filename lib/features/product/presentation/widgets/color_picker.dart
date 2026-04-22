import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.textTitle,
    required this.colors,
    required this.onSelected,
    this.initialValue,
  });

  final String textTitle;
  final List<String> colors;
  final Function(String) onSelected;
  final String? initialValue;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;
  @override
  void initState() {
    super.initState();
    if(widget.initialValue !=null){
      _selectedColor = widget.initialValue;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textTitle,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              final color = widget.colors[index];
              return GestureDetector(
                onTap: () {
                  _selectedColor = color;
                  widget.onSelected(color);
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black54),
                    color: color == _selectedColor
                        ? AppColors.themeColor
                        : Colors.transparent,
                  ),
                  child: Text(color, style: TextStyle(
                    color: color == _selectedColor
                        ? Colors.white
                        : Colors.black54,
                  ),),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
