import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wechana_app/model/hospital.dart';

class HospitalCard extends StatelessWidget {
  final Hospital hospital;
  const HospitalCard({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          print('Tapped');
          context.push('/hospital/${hospital.id}');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                hospital.hospitalName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
