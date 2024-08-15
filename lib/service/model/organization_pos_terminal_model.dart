import 'dart:convert';

class OrganizationPosTerminalSber {
  final String name;
  int number;

  OrganizationPosTerminalSber({
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'number': number,
    };
  }

  factory OrganizationPosTerminalSber.fromMap(Map<String, dynamic> map) {
    return OrganizationPosTerminalSber(
      name: map['name'] as String,
      number: map['number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationPosTerminalSber.fromJson(String source) =>
      OrganizationPosTerminalSber.fromMap(
          json.decode(source) as Map<String, dynamic>);

  OrganizationPosTerminalSber copyWith({
    String? name,
    int? number,
  }) {
    return OrganizationPosTerminalSber(
      name: name ?? this.name,
      number: number ?? this.number,
    );
  }

  @override
  bool operator ==(covariant OrganizationPosTerminalSber other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
