import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {
  var index = 0;

  ListItem(int index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is item $index"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
         child: ShowText(),
        ),
      ),
    );
  }

}

class ShowText extends StatefulWidget {
  @override
  State<ShowText> createState() => ShowTextState();
}

class ShowTextState extends State<ShowText> {
  var inputName = '';
  var inputPhone = '';
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          getInputText('name', context),
          getInputText('phone', context),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 100.0),
            child: RaisedButton(
              onPressed: () {
                print('onPressed');
              },
              child: Text('input done!'),
            ),
          ),
          getShowText(context)
        ]
    );
  }

  Widget getInputText(String labelText, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: labelText == 'name' ? TextInputType.text : TextInputType.number,
        style: Theme.of(context).textTheme.body1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),
          hintText: 'Please enter $labelText',
          labelText: labelText,
        ),
        onChanged: (String text) {
          print('$labelText input onChanged: $text');
          if (labelText == 'name') {
            inputName = text;
          } else {
            inputPhone = text;
          }
        },
      ),
    );
  }

  // todo make show text change
  Widget getShowText(BuildContext context)  {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
          decoration: new BoxDecoration(
              border: new Border.all(
                  color: Colors.blueAccent,
                  style: BorderStyle.solid)
          ),

          child: Text(
            'name: $inputName\nphone: $inputPhone',
            style: Theme.of(context).textTheme.headline,
          ),
        )
    );
  }
}
