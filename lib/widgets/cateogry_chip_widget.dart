import 'package:flutter/material.dart';

class CategoryChipSelection extends StatefulWidget {
  @override
  _CategoryChipSelectionState createState() => _CategoryChipSelectionState();
}

class _CategoryChipSelectionState extends State<CategoryChipSelection> {
  int _selectedIndex = 0; // Track selected index

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List.generate(
        3,
        (index) => ChoiceChip(
          label: Text(
            _getChipLabel(index), // Get label based on index
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.black, // Set font color based on selection state
            ),
          ),
          selected: _selectedIndex == index,
          selectedColor: Colors.white, // Check if current chip is selected
          backgroundColor: Colors.white, // White background for all chips
          onSelected: (selected) {
            setState(() {
              print(_selectedIndex);
              _selectedIndex = selected ? index : -1; // Update selected index
            });
          },
        ),
      ),
    );
  }

  String _getChipLabel(int index) {
    switch (index) {
      case 0:
        return 'Recommended';
      case 1:
        return 'Popular';
      case 2:
        return 'Top Rated';
      default:
        return '';
    }
  }
}
