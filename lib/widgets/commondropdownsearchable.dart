import 'package:flutter/material.dart';

Widget commonDropDownSearchable(List<String> items, String selected,
    String label, ValueChanged<String?> onChange) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SearchableDropdown(
          items: items,
          selected: selected,
          onChange: onChange,
        ),
      ),
    ],
  );
}

class SearchableDropdown extends StatefulWidget {
  final List<String> items;
  final String selected;
  final ValueChanged<String?> onChange;

  const SearchableDropdown({
    super.key,
    required this.items,
    required this.selected,
    required this.onChange,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  late List<String> filteredItems;
  late String selectedItem;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    selectedItem = widget.selected;
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showDropdownDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: UnderlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _filterItems(value);
                  });
                },
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredItems[index]),
                      onTap: () {
                        setState(() {
                          selectedItem = filteredItems[index];
                          widget.onChange(selectedItem);
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showDropdownDialog(context);
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedItem.isNotEmpty ? selectedItem : 'Select an option',
                  style: const TextStyle(fontSize: 18),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
