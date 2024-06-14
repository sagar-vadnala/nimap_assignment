import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nimap_assignment/model/model.dart';
import 'package:nimap_assignment/services/api_services.dart';
import 'package:nimap_assignment/services/db_services.dart';
import 'package:nimap_assignment/view/record_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecordListScreen(),
    );
  }
}

class RecordListScreen extends StatefulWidget {
  const RecordListScreen({super.key});

  @override
  _RecordListScreenState createState() => _RecordListScreenState();
}

class _RecordListScreenState extends State<RecordListScreen> {
  late Future<List<ProjectRecord>> futureRecords;

  @override
  void initState() {
    super.initState();
    futureRecords = fetchRecords();
  }

  Future<List<ProjectRecord>> fetchRecords() async {
    try {
      final records = await ApiService().fetchRecords();
      for (var record in records.records) {
        await DatabaseService().insertRecord(record);
      }
      return records.records;
    } catch (e) {
      return await DatabaseService().fetchRecords();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Record List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<ProjectRecord>>(
        future: futureRecords,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No records found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final record = snapshot.data![index];
                return RecordListItem(record: record);
              },
            );
          }
        },
      ),
    );
  }
}
