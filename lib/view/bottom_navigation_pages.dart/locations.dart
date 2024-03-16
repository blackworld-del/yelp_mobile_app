import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusinessLocationMapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  const BusinessLocationMapScreen(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('business_location'),
              position: LatLng(latitude, longitude),
              infoWindow: const InfoWindow(
                title: 'Business Location',
              ),
            ),
          },
        ),
      ),
    );
  }
}
