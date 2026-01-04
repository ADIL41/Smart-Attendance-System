import 'package:flutter/material.dart';
import 'package:smart_attandance_system/Theme/colors.dart';
import 'package:smart_attandance_system/Widgets/history_tile.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.salem,
      drawer: Drawer(
        elevation: 2,
        backgroundColor: AppColors.salem,
        child: Column(
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.salem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.person, size: 40, color: AppColors.salem),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Alex',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'alex@example.com',
                    style: TextStyle(color: AppColors.textWhite, fontSize: 14),
                  ),
                ],
              ),
            ),
            // Menu Items
            ListTile(
              leading: Icon(Icons.person, color: AppColors.textWhite),
              title: Text(
                'Profile',
                style: TextStyle(color: AppColors.textWhite),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: AppColors.textWhite),
              title: Text(
                'Settings',
                style: TextStyle(color: AppColors.textWhite),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout, color: AppColors.textWhite),
              title: Text(
                'Logout',
                style: TextStyle(color: AppColors.textWhite),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: AppColors.textWhite)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.salem,
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.salemLight,
            radius: 20,
            child: Icon(Icons.person, color: AppColors.textWhite),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Welcome, Alex',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Monday, October 26',
                style: TextStyle(color: AppColors.textSub, fontSize: 14),
              ),
              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'You are Checked IN',
                          style: TextStyle(
                            color: AppColors.salem,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last activity: Yesterday at 6:15 PM',
                      style: TextStyle(color: AppColors.salem, fontSize: 13),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.salemLight,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CHECK OUT',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Recent History',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),

              HistoryTile(
                title: 'Mon,Dec 29 ',
                subtitle: '10:00 AM - 12:00 PM',
                rightText: 'Present',
                bg: AppColors.white,
                textColor: AppColors.salem,
                subColor: AppColors.salem,
              ),
              const SizedBox(height: 16),
              HistoryTile(
                title: 'Mon,Dec 29 ',
                subtitle: '10:00 AM - 12:00 PM',
                rightText: 'Present',
                bg: AppColors.white,
                textColor: AppColors.salem,
                subColor: AppColors.salem,
              ),
              SizedBox(height: 16),
              HistoryTile(
                title: 'Mon,Dec 29 ',
                subtitle: '10:00 AM - 12:00 PM',
                rightText: 'Present',
                bg: AppColors.white,
                textColor: AppColors.salem,
                subColor: AppColors.salem,
              ),
              SizedBox(height: 16),
              HistoryTile(
                title: 'Mon,Dec 29 ',
                subtitle: '10:00 AM - 12:00 PM',
                rightText: 'Present',
                bg: AppColors.white,
                textColor: AppColors.salem,
                subColor: AppColors.salem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
