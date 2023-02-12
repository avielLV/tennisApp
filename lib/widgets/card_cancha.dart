import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennisapp/helpers/helpers.dart';
import 'package:tennisapp/models/models.dart';
import 'package:tennisapp/services/services.dart';
import 'package:tennisapp/widgets/widgets.dart';

class CardCancha extends StatelessWidget {
  ReservaModel reserva;
  CardCancha({super.key, required this.reserva});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeService = Provider.of<HomeService>(context);

    // String lluvia = '';
    String lluvia() {
      for (var element in homeService.clima) {
        if (element.datetime.format == reserva.fecha) {
          homeService.pop = '${element.pop}%';
          return '${element.pop}%';
        }
      }
      return '';
    }

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.58,
            height: 80,
            margin: const EdgeInsets.only(top: 12, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reserva.nombre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '${reserva.horainicio} a ${reserva.horafin}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  reserva.fecha,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: 68,
                height: 68,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloudy_snowing,
                        color: Colors.deepPurple,
                        size: 40,
                      ),
                      Text(
                        lluvia(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                    ]),
              ),
              InkWell(
                onTap: () {
                  DialogHelper.show(
                      context,
                      DialogPermiso(
                        fecha: reserva.fecha,
                        id: reserva.id!,
                        cancha: reserva.cancha,
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        // color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      width: 36,
                      height: 26,
                      child: const Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
