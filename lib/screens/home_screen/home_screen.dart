import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennisapp/provider/provider.dart';
import 'package:tennisapp/services/services.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final homeService = Provider.of<HomeService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Tennis paraiso')),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 20, left: 0),
                // padding: const EdgeInsets.only(left: 2),
                child: const SelectDate()),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: SelectCancha(
                valor: homeProvider.cancha,
                initindex: homeProvider.cancha,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: homeService.reservas.length,
                  itemBuilder: (context, i) => CardCancha(
                        reserva: homeService.reservas[i],
                      )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, 'cancha');
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
