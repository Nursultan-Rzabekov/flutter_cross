import 'package:flutter/material.dart';
import 'package:fluttercross/core/models/Movie.dart';
import 'package:fluttercross/core/viewmodels/base_model.dart';
import 'package:fluttercross/widgets/MagicAppBar.dart';
import 'package:fluttercross/widgets/PillShapedButton.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatelessWidget {
  final Movie item;

  const ItemDetailPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CinephileAppBar.build(context: context),
      body: ListView(
        children: <Widget>[
          Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Year ${item.year}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Watched on:' +
                DateTime.fromMillisecondsSinceEpoch(item.watchedOn).toString()),
          ),
          _buildRemoveButton(),
        ],
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Builder(
      builder: (contextWithScaffold) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PillShapedButton(
              title: 'I did not watch this',
              onPressed: () => removeFromWatched(contextWithScaffold)),
        );
      },
    );
  }

  void removeFromWatched(BuildContext context) async {
    final app = Provider.of<BaseModel>(context);
    //final repo = app.storage;
    //repo.removeFromWatched(item);
    app.refresh();
    Navigator.pop(context);
  }
}
