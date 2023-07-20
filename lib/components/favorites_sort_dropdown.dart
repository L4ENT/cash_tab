import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cash_tab/utils.dart';

class FavoritesSortDropdown extends StatefulWidget {
  const FavoritesSortDropdown({super.key});

  @override
  State<FavoritesSortDropdown> createState() => _FavoritesSortDropdownState();
}

class _FavoritesSortDropdownState extends State<FavoritesSortDropdown> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> list = <String>[
      l10n.sort_recents.capitalize(),
      l10n.sort_az.capitalize(),
    ];
    String dropdownValue = list.first;

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
