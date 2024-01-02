import 'package:flutter/material.dart';

class MySimpleTextTabs extends StatefulWidget {
  const MySimpleTextTabs({Key? key}) : super(key: key);

  @override
  State<MySimpleTextTabs> createState() => _MySimpleTextTabsState();
}

class _MySimpleTextTabsState extends State<MySimpleTextTabs> {
  late int tabIndex;

  @override
  void initState() {
    super.initState();
    tabIndex = 0;
  }

  setTabIndex(int value) {
    setState(() {
      tabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> myContent = [
      Text('This is my home screen'),
      Text('This is my notifications screen'),
      Text('This is my news screen')
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Center(
              child: SimpleTextTabs(
                labels: const ['Home', 'Notifications', 'News'],
                onTabChange: setTabIndex,
              ),
            ),
            const SizedBox(height: 32),
            myContent[tabIndex],
          ],
        ),
      ),
    );
  }
}

class SimpleTextTabs extends StatefulWidget {
  const SimpleTextTabs({required this.labels, this.onTabChange, Key? key})
      : super(key: key);
  final List<String> labels;
  final Function(int)? onTabChange;

  @override
  State<SimpleTextTabs> createState() => _SimpleTextTabsState();
}

class _SimpleTextTabsState extends State<SimpleTextTabs> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  callback() {
    if (widget.onTabChange != null) widget.onTabChange!(selectedIndex);
  }

  setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    callback();
  }

  Widget _buildIndividualTab({required String label, Function()? onTap}) {
    int indexOfLabel = widget.labels.indexOf(label);
    bool isActive = selectedIndex == indexOfLabel;

    return GestureDetector(
      onTap: () {
        setSelectedIndex(indexOfLabel);
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          border: isActive
              ? const Border(
                  bottom: BorderSide(
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.black : Colors.black.withOpacity(.6),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextTabs() {
    return widget.labels.map((label) {
      return _buildIndividualTab(
        
          label: label,
          onTap: () {
            setSelectedIndex(widget.labels.indexOf(label));
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: intersperse(
            const SizedBox(width: 24),
            _buildTextTabs(),
          ).toList(),
        ),
        const Divider(height: 0, thickness: 1),
      ],
    );
  }
}

// Util

// Copied from https://github.com/modulovalue/dart_intersperse/blob/master/lib/src/intersperse.dart
/// Puts [element] between every element in [list].
Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}
