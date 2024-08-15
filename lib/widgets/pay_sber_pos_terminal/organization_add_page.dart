import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';

class OrganizationAddPage extends StatefulWidget {
  final List<OrganizationPosTerminalSber>? initialOrganizations;

  OrganizationAddPage({Key? key, this.initialOrganizations}) : super(key: key);

  @override
  _OrganizationAddPageState createState() => _OrganizationAddPageState();
}

class _OrganizationAddPageState extends State<OrganizationAddPage> {
  late List<TextEditingController> _nameControllers;
  late List<OrganizationPosTerminalSber> _organizations;

  @override
  void initState() {
    super.initState();
    if (widget.initialOrganizations != null) {
      _organizations = List.from(widget.initialOrganizations!);
    } else {
      _organizations = [];
    }

    _nameControllers = _organizations
        .map((org) => TextEditingController(text: org.name))
        .toList();

    if (_nameControllers.isEmpty) {
      _nameControllers.add(TextEditingController());
      _organizations.add(OrganizationPosTerminalSber(name: '', number: 1));
    }
  }

  void _addNewField() {
    setState(() {
      _nameControllers.add(TextEditingController());
      _organizations.add(
        OrganizationPosTerminalSber(
          name: '',
          number: _organizations.length + 1,
        ),
      );
    });
  }

  void _apply() {
    List<OrganizationPosTerminalSber> nonEmptyLists = [];
    for (int i = 0; i < _nameControllers.length; i++) {
      if (_nameControllers[i].text.isNotEmpty) {
        nonEmptyLists.add(
          OrganizationPosTerminalSber(
            name: _nameControllers[i].text,
            number: i + 1,
          ),
        );
      }
    }

    Navigator.pop(context, nonEmptyLists.isNotEmpty ? nonEmptyLists : null);
  }

  void _updateOrder() {
    for (int i = 0; i < _organizations.length; i++) {
      _organizations[i].number = i + 1;
    }
  }

  @override
  void dispose() {
    _nameControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выбор организации')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addNewField,
                ),
              ],
            ),
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _nameControllers.length,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final item = _organizations.removeAt(oldIndex);
                    _organizations.insert(newIndex, item);

                    final nameController = _nameControllers.removeAt(oldIndex);
                    _nameControllers.insert(newIndex, nameController);

                    _updateOrder();
                  });
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    key: ValueKey(_organizations[index].number),
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text('${_organizations[index].number}.'),
                            const SizedBox(width: 40),
                            Expanded(
                              child: TextField(
                                controller: _nameControllers[index],
                                decoration: InputDecoration(
                                  labelText:
                                      'Название организации ${index + 1}',
                                ),
                              ),
                            ),
                            const SizedBox(width: 60),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _apply,
              child: const Text('Применить'),
            ),
          ],
        ),
      ),
    );
  }
}
