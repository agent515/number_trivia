import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'widgets/widgets.dart';

import '../../../../initial_register.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _buildBody(context)),
    );
  }

  BlocProvider<NumberTriviaBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                  builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(
                    message: 'Start Searching..',
                  );
                } else if (state is Error) {
                  return MessageDisplay(message: state.message);
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return TriviaWidget(trivia: state.trivia);
                }
                return Container();
              }),
              SizedBox(
                height: 20,
              ),
              TriviaControls(),
            ],
          ),
        ),
      ),
    );
  }
}

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color(0xFFbb86fc),
            primaryColorDark: Colors.red,
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: textEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).primaryColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 1.5),
              ),
              hintText: 'Enter a number',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            onSubmitted: (str) {
              BlocProvider.of<NumberTriviaBloc>(context)
                  .add(GetTriviaForConcreteNumber(textEditingController.text));
              textEditingController.clear();
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    BlocProvider.of<NumberTriviaBloc>(context).add(
                        GetTriviaForConcreteNumber(textEditingController.text));
                    textEditingController.clear();
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    onPrimary: Colors.grey[100],
                  ),
                  child: Text('Random'),
                  onPressed: () {
                    BlocProvider.of<NumberTriviaBloc>(context)
                        .add(GetTriviaForRandomNumber());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
