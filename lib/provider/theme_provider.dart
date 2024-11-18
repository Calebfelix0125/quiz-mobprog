import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = _themes[0];

  static final List<ThemeData> _themes = [
    ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.robotoTextTheme(const TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 16),
      )),
    ),
    ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.lightGreen[100],
      textTheme: GoogleFonts.robotoTextTheme(const TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 16),
      )),
    ),
    ThemeData(
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.purple[50],
      textTheme: GoogleFonts.robotoTextTheme(const TextTheme(
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 16),
      )),
    ),
  ];

  // Getter for themes
  List<ThemeData> get themes => _themes;

  // Getters and Setters for theme
  ThemeData getTheme() => _currentTheme;

  void setTheme(int index) {
    _currentTheme = _themes[index];
    // Update the text theme to reflect the current font selection
    _updateTextTheme();
    notifyListeners();
  }

  String _currentFont = 'Roboto';
  final List<String> _fonts = ['Roboto', 'Lobster', 'Montserrat'];

  List<String> get fonts => _fonts;

  String getFont() => _currentFont;

  void setFont(int index) {
    _currentFont = _fonts[index];
    _updateTextTheme();
    notifyListeners();
  }

  void _updateTextTheme() {
    switch (_currentFont) {
      case 'Lobster':
        _currentTheme = _currentTheme.copyWith(
          textTheme: GoogleFonts.lobsterTextTheme(
            const TextTheme(
              bodyLarge: TextStyle(fontSize: 18),
              bodyMedium: TextStyle(fontSize: 16),
            ),
          ),
        );
        break;
      case 'Montserrat':
        _currentTheme = _currentTheme.copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            const TextTheme(
              bodyLarge: TextStyle(fontSize: 18),
              bodyMedium: TextStyle(fontSize: 16),
            ),
          ),
        );
        break;
      default:
        _currentTheme = _currentTheme.copyWith(
          textTheme: GoogleFonts.robotoTextTheme(
            const TextTheme(
              bodyLarge: TextStyle(fontSize: 18),
              bodyMedium: TextStyle(fontSize: 16),
            ),
          ),
        );
        break;
    }
  }
}
