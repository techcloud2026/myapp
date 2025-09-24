import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  Widget _buildProjectOverviewCard({
    required String title,
    required int count,
    required double progress,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color.withAlpha((color.a * 0.1).round() & 0xff),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$count Projects',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: color.withAlpha((color.a * 0.3).round() & 0xff),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            const SizedBox(height: 5),
            Text(
              'Progress ${(progress * 100).toInt()}%',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Placeholder image
          ),
        ),
        title: const Text('Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  _buildProjectOverviewCard(
                    title: 'Ongoing Projects',
                    count: 16,
                    progress: 0.4,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 15),
                  _buildProjectOverviewCard(
                    title: 'Completed Projects',
                    count: 16,
                    progress: 1.0,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Project statistics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              // Placeholder for chart
              Container(
                height: 200,
                color: Colors.grey[200],
                child: const Center(child: Text('Chart will go here')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
