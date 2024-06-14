import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nimap_assignment/model/model.dart';

class RecordListItem extends StatelessWidget {
  final ProjectRecord record;

  const RecordListItem({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final endDate = DateFormat('dd/MM/yyyy').parse(record.endDate);
    final remainingDays = endDate.difference(DateTime.now()).inDays;
    final percentageFunded = (record.collectedValue / record.totalValue * 100).toStringAsFixed(0);

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(record.mainImageURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 150,
              color: const Color(0xFF216477),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹ ${record.collectedValue}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'FUNDED',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹ ${record.totalValue}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'GOALS',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$remainingDays',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'ENDS IN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        onPressed: () {}, 
                        child: const Text("Pledge"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: 5,
          right: 90,
          bottom: 90,
          child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        record.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    record.shortDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 170,
          right: 20,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Text(
              '$percentageFunded%',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
