import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';

class OrganizationSelectPage extends StatelessWidget {
  final List<OrganizationPosTerminalSber>? organizations;

  const OrganizationSelectPage({required this.organizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор Организации'),
      ),
      body: Center(
        child: SlectOrganizationSberWidget(
          organizations: organizations,
          onSelected: (selectedOrganization) {
            Navigator.pop(context, selectedOrganization);
          },
        ),
      ),
    );
  }
}

class SlectOrganizationSberWidget extends StatefulWidget {
  final List<OrganizationPosTerminalSber>? organizations;
  final Function(OrganizationPosTerminalSber?) onSelected;

  const SlectOrganizationSberWidget({
    required this.organizations,
    required this.onSelected,
    super.key,
  });

  @override
  State<SlectOrganizationSberWidget> createState() =>
      _SlectOrganizationSberWidgetState();
}

class _SlectOrganizationSberWidgetState
    extends State<SlectOrganizationSberWidget> {
  OrganizationPosTerminalSber? _selectedOrganization;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.organizations == null
            ? Text('Нету организация6 добавьте их')
            : DropdownButton<OrganizationPosTerminalSber>(
                hint: Text('Выбор Организации'),
                value: _selectedOrganization,
                onChanged: (OrganizationPosTerminalSber? newValue) {
                  setState(() {
                    _selectedOrganization = newValue;
                  });
                },
                items: widget.organizations!
                    .map((OrganizationPosTerminalSber organization) {
                  return DropdownMenuItem<OrganizationPosTerminalSber>(
                    value: organization,
                    child: Text(organization.name),
                  );
                }).toList(),
              ),
        ElevatedButton(
          onPressed: () {
            widget.onSelected(_selectedOrganization);
          },
          child: Text('Принять'),
        ),
      ],
    );
  }
}
