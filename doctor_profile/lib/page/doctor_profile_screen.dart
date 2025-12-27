import 'package:doctor_profile/widgets/details_tile.dart';
import 'package:doctor_profile/widgets/main_button.dart';
import 'package:doctor_profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              SizedBox(height: 20),
              Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text(
                'Professor of Dentistry, Graduated from Cairo University. Professor of Dentistry, Graduated from Cairo',
              ),
              SizedBox(height: 20),
              _buildAddressData(),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Text(
                'Contact Info',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              _buildContactInfo(),
              SizedBox(height: 10),
              MainButton(text: 'Book Appointment', onPressed: () {}),
              SizedBox(height: 10),
              MainButton(
                text: 'Call Now',
                bgColor: Colors.green,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContactInfo() {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.indigoAccent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          DetailsTile(icon: Icons.mail, label: 'sayed@gmail.com'),
          SizedBox(height: 10),
          DetailsTile(icon: Icons.call, label: '01000000000000'),
          SizedBox(height: 10),
          DetailsTile(icon: Icons.call, label: '200000000'),
        ],
      ),
    );
  }

  Container _buildAddressData() {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.indigoAccent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          DetailsTile(icon: Icons.local_hospital, label: 'Cairo Hospital'),
          SizedBox(height: 10),
          DetailsTile(icon: Icons.watch_later_outlined, label: '10:00 - 12:00'),
          SizedBox(height: 10),
          DetailsTile(
            icon: Icons.location_on_rounded,
            label: 'Nasr Street, Cairo',
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigoAccent,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      ),
      title: Text('Doctor Profile', style: TextStyle(color: Colors.white)),
    );
  }
}
