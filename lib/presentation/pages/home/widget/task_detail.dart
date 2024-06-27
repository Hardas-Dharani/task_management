import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Detail'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Task'),
              Tab(text: 'Revision'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TaskTab(),
            RevisionTab(),
          ],
        ),
      ),
    );
  }
}

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Task Content'));
  }
}

class RevisionTab extends StatelessWidget {
  const RevisionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Revision Content'));
  }
}
