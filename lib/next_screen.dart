import "package:flutter/material.dart";

class NextScreen extends StatelessWidget {
  const NextScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: const Text("This is NextScreen")
      )
    );
  }
}
