class AllRecord {
  final int status;
  final String message;
  final List<ProjectRecord> records;

  AllRecord({
    required this.status,
    required this.message,
    required this.records,
  });

  factory AllRecord.fromJson(Map<String, dynamic> json) {
    var recordsJson = json['data']['Records'] as List? ?? [];
    List<ProjectRecord> recordsList = recordsJson.map((i) => ProjectRecord.fromJson(i)).toList();

    return AllRecord(
      status: json['Status'] ?? 0,
      message: json['Message'] ?? '',
      records: recordsList,
    );
  }
}

class ProjectRecord {
  final int id;
  final String title;
  final String shortDescription;
  final int collectedValue;
  final int totalValue;
  final String startDate;
  final String endDate;
  final String mainImageURL;

  ProjectRecord({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.collectedValue,
    required this.totalValue,
    required this.startDate,
    required this.endDate,
    required this.mainImageURL,
  });

  factory ProjectRecord.fromJson(Map<String, dynamic> json) {
    return ProjectRecord(
      id: json['Id'] ?? 0,
      title: json['title'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      collectedValue: json['collectedValue'] ?? 0,
      totalValue: json['totalValue'] ?? 0,
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      mainImageURL: json['mainImageURL'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'title': title,
      'shortDescription': shortDescription,
      'collectedValue': collectedValue,
      'totalValue': totalValue,
      'startDate': startDate,
      'endDate': endDate,
      'mainImageURL': mainImageURL,
    };
  }
}
