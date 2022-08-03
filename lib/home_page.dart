import 'package:bloc_example/calculation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc_example/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CounterCubit cubit;
  TextEditingController inputController = TextEditingController();
  int inputValue = 0;

  @override
  void didChangeDependencies() {
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies();
  }

  void navigateToResultPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
            create: (context) => CalculationCubit(),
            child: const ResultPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        centerTitle: true,
      ),
      body: BlocConsumer<CounterCubit, int>(
        bloc: cubit,
        listener: (context, state) {
          const snackBar = SnackBar(
            content: Text('State is reached'),
          );

          if (state == 5) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (BuildContext context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input',
                    ),
                  ),
                ),
                Text(
                  '$state',
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cubit.increment();
                      },
                      child: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(24)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          cubit.restart();
                        },
                        child: Icon(Icons.refresh),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(24))),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        cubit.decrement();
                      },
                      child: Icon(Icons.remove),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(24)),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        navigateToResultPage(context);
                      },
                      child: Icon(Icons.emergency),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(24)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          navigateToResultPage(context);
                        },
                        child: Icon(Icons.percent),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(24))),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
