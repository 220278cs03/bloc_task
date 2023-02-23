import 'package:bloc_listener_lesson/validate/validate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validate Page"),
      ),
      body: BlocListener<ValidateCubit, ValidateState>(
        listenWhen: (prev, current) {
          return current.check;
        },
        listener: (context, state) async {
          if (state.check) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Gulnoza")));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  label: Text("Username"),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              BlocBuilder<ValidateCubit, ValidateState>(
                  builder: (context, state) {
                return state.check
                    ? const SizedBox.shrink()
                    : const Text(
                        "Error",
                        style: TextStyle(color: Colors.red),
                      );
              }),
              // BlocConsumer<ValidateCubit, ValidateState>(
              //     builder: (context, state) {
              //   return state.check
              //       ? const SizedBox.shrink()
              //       : const Text(
              //           "Error",
              //           style: TextStyle(color: Colors.red),
              //         );
              // }, listenWhen: (prev, current) {
              //   return current.check;
              // }, listener: (context, state) async {
              //   if (state.check) {
              //     ScaffoldMessenger.of(context)
              //         .showSnackBar(const SnackBar(content: Text("Gulnoza")));
              //   }
              // })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ValidateCubit>().check(_controller?.text ?? "");
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
