import 'package:flutter/material.dart';
import '../models/name_entry.dart';
import '../utils/sample_names.dart';
import '../widgets/rating_selector.dart';
import 'results_screen.dart';

class NameRatingScreen extends StatefulWidget {
  const NameRatingScreen({super.key});

  @override
  State<NameRatingScreen> createState() => _NameRatingScreenState();
}

class _NameRatingScreenState extends State<NameRatingScreen> {
  late List<NameEntry> _names;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _names = List.of(sampleNames);
  }

  NameEntry get _currentEntry => _names[_currentIndex];

  void _rate(int rating) {
    setState(() {
      _names[_currentIndex] = _currentEntry.copyWith(rating: rating);
    });
  }

  void _goNext() {
    if (_currentIndex < _names.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultsScreen(names: _names),
        ),
      );
    }
  }

  void _goPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _names.length - 1;
    final hasRating = _currentEntry.rating != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate this name'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (_currentIndex + 1) / _names.length,
              ),
              const SizedBox(height: 8),
              Text(
                'Name ${_currentIndex + 1} of ${_names.length}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Text(
                _currentEntry.name,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              RatingSelector(
                selectedRating: _currentEntry.rating,
                onRatingSelected: _rate,
              ),
              const Spacer(),
              Row(
                children: [
                  if (_currentIndex > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _goPrevious,
                        child: const Text('Back'),
                      ),
                    ),
                  if (_currentIndex > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: hasRating ? _goNext : null,
                      child: Text(isLast ? 'Finish' : 'Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
