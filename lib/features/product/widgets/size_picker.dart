import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.textTitle,
    required this.sizes,
    required this.onSelected,
    this.initialValue,
  });

  final String textTitle;
  final List<String> sizes;
  final Function(String) onSelected;
  final String? initialValue;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  void initState() {
    super.initState();
    if(widget.initialValue !=null){
      _selectedSize = widget.initialValue;
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
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              final color = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  _selectedSize = color;
                  widget.onSelected(color);
                  setState(() {});
                },
                child: Container(
                  width: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black54),
                    color: color == _selectedSize
                        ? AppColors.themeColor
                        : Colors.transparent,
                  ),
                  child: Text(color, style: TextStyle(
                    color: color == _selectedSize
                        ? Colors.white
                        : Colors.black54,
                    fontWeight: FontWeight.bold
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
