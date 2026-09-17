import 'package:flutter/material.dart';

/// لوحة الأرقام (1-9, 0, backspace)
/// onKeyTap بترجع النص اللي اتدوس عليه: '0'..'9' أو 'backspace'
class NumericKeypad extends StatelessWidget {
  final ValueChanged<String> onKeyTap;

  const NumericKeypad({super.key, required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', 'backspace'],
    ];

    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((key) => _buildKey(key)).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKey(String key) {
    if (key.isEmpty) {
      return const SizedBox(width: 64, height: 56);
    }

    return InkWell(
      // borderRadius: BorderRadius.circular(32),
      onTap: () => onKeyTap(key),
      child: SizedBox(
        width: 69,
        height: 54,
        child: Center(
          child: key == 'backspace'
              ? const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white,
                  size: 26,
                )
              : Text(
                  key,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
