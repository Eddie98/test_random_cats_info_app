import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cats_app/bloc/cats_bloc.dart';
import 'package:test_cats_app/routes.dart';
import 'package:test_cats_app/ui/pages/home/widgets/buttons_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CatsBloc catsBloc;

  @override
  void initState() {
    super.initState();
    catsBloc = context.read<CatsBloc>();
    catsBloc.add(const CatsEvent.getCatDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: BlocBuilder<CatsBloc, CatsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (catImageBytes, catfact) => Column(
                      children: [
                        Image.memory(
                          Uint8List.fromList(catImageBytes),
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 12.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(catfact.fact.toString()),
                        ),
                        const SizedBox(height: 32.0),
                      ],
                    ),
                    error: () => const Center(
                      child: Text('Something went wrong!'),
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
      persistentFooterButtons: [
        ButtonsRow(
          anotherFactCallback: () {
            catsBloc.add(const CatsEvent.getCatDataEvent());
          },
          factHistoryCallback: () {
            Navigator.pushNamed(context, Routes.historyLink);
          },
        ),
      ],
    );
  }
}
