import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  HasuraConnect conn =
      HasuraConnect('https://dart-hasura.herokuapp.com/v1alpha1/graphql');

Snapshot snap;
  HomeBloc() {
    snap = conn.subscription(docSubscription);
  }

  //document
  String docQuery = """
        query {
        chat {
          cha_id
          cha_name
        }
      }

      """;

  carrega() async {
    //query
    var r = await conn.query(docQuery);
    print(r);
  }

  String docSubscription = """
subscription {
  message(order_by: {mes_created_at: asc}) {
    mes_cha_id
    mes_content
    mes_created_at
    mes_id
    mes_use_id
  }
}

""";

  @override
  void dispose() {
  /*   _chatControllor.close(); */
    super.dispose();
  }
}
