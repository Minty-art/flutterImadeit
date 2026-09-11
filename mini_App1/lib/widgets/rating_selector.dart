import 'package:flutter/material.dart';

class RatingSelector extends StatelessWidget {
  final int? selectedRating;
  final ValueChanged<int> onRatingSelected;

  const RatingSelector({
    super.key,
    required this.selectedRating,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final value = index + 1;
        final isSelected = selectedRating == value;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () => onRatingSelected(value),
            child: CircleAvatar(
              radius: 26,
              backgroundColor:
                  isSelected ? colorScheme.primary : colorScheme.surfaceContainerHighest,
              child: Text(
                '$value',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
