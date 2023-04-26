import 'package:flutter/material.dart';

/// A Selection menu, where the user can pick a Theme from available themes.
///
/// It displays all [themes] in a grid, shows a [headerText] above the window,
/// allows an action to be taken [onSelect].
void openThemeSwitchingDialog({required BuildContext context, required Function(int) onSelect, String headerText = 'Změnit motiv',}) {
  showModalBottomSheet(
    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.33),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                headerText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Světlý'),
                      leading: const Icon(Icons.light_mode),
                      onTap: () => onSelect.call(1),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Tmavý'),
                      leading: const Icon(Icons.dark_mode),
                      onTap: () => onSelect.call(2),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Systém'),
                      leading: const Icon(Icons.settings),
                      onTap: () => onSelect.call(0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}