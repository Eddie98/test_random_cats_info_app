import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_cats_app/data/hive/hive.dart';
import 'package:test_cats_app/data/models/cat_fact_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatFactModel> facts = List.from(
      hiveCatFactsBox.values
          .toList()
          .reversed
          .map((e) => CatFactModel.fromMap(e)),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fact History'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
        itemCount: facts.length,
        itemBuilder: (context, index) {
          final fact = facts.elementAt(index);
          final formattedDate =
              DateFormat('MM-dd-yyyy HH:mm').format(fact.datetime!);

          return ListTile(
            title: Text(
              formattedDate,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              fact.fact.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
      ),
    );
  }
}
