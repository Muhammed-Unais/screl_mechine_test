import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screl_mechine_test/data/response/enums.dart';
import 'package:screl_mechine_test/features/home/view_model/get_all_user_view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    var getAllUserProvider = context.read<GetAllUserViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllUserProvider.getAllUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Consumer<GetAllUserViewModel>(
        builder: (context, value, child) {
          switch (value.getAllUsersapiResponse.status) {
            case Status.loading:
              return const CircularProgressIndicator();
            case Status.completed:
              var data = value.getAllUsersapiResponse.data;
              return ListView.builder(
                padding: const EdgeInsets.only(left: 20,right: 20),
                itemCount: data?.users.length,
                itemBuilder: (context, index) {
                  var user = data?.users[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      leading: Text("${index +1}"),
                      title: Text(user?.name ?? ""),
                      subtitle: Text(user?.address.street ??""),
                    ),
                  );
                },
              );
            case Status.error:
              return const Text("error");
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
