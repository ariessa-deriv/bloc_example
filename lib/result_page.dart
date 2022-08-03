import 'package:flutter/material.dart';
import 'package:bloc_example/calculation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late CalculationCubit calculationCubit;

  @override
  void didChangeDependencies() {
    calculationCubit = BlocProvider.of<CalculationCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: BlocBuilder<CalculationCubit, int>(
        builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '12',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 36),
                  child: Icon(Icons.emergency),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 10),
                Text(
                  '10',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(height: 20),
                Divider(
                  height: 10,
                  thickness: 5,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                Text(
                  '$state',
                  style: TextStyle(fontSize: 36),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
