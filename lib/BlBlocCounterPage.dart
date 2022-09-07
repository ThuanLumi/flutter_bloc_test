import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/BlBlocCounterBloc.dart';
import 'package:flutter_bloc_test/BlBlocCounterState.dart';
import 'package:flutter_bloc_test/events.dart';

class BlBlocCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    BlocProvider manage's bloc lifecycle,
     */
    return BlocProvider(
      create: (BuildContext context) => BlBlocCounterBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // Section one
    final bloc = BlocProvider.of<BlBlocCounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bloc-Bloc Example')),
      body: Center(
        //Section two
        child: BlocBuilder<BlBlocCounterBloc, BlBlocCounterState>(
          builder: (context, state) {
            return Text(
              'Pressed ${bloc.state.count} times',
              style: TextStyle(fontSize: 30.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(CounterIncrementEvent()),
        child: Icon(Icons.add),
      ),
    );
  }
}
