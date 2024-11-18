import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Theme:', style: Theme.of(context).textTheme.bodyLarge),
            ...List.generate(themeProvider.themes.length, (index) {
              return RadioListTile(
                value: index,
                groupValue:
                    themeProvider.getTheme() == themeProvider.themes[index]
                        ? index
                        : null,
                title: Text('Theme ${index + 1}'),
                onChanged: (val) {
                  themeProvider.setTheme(index);
                },
              );
            }),
            SizedBox(height: 20),
            Text('Select Font:', style: Theme.of(context).textTheme.bodyLarge),
            ...List.generate(themeProvider.fonts.length, (index) {
              return RadioListTile(
                value: index,
                groupValue:
                    themeProvider.getFont() == themeProvider.fonts[index]
                        ? index
                        : null,
                title: Text(themeProvider.fonts[index]),
                onChanged: (val) {
                  themeProvider.setFont(index);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
