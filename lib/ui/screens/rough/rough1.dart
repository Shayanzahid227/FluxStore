import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeSlot? _selectedTimeSlot;

  // Sample time slots
  final List<TimeSlot> timeSlots = [
    TimeSlot(id: "01", startTime: "08:00am", endTime: "08:30am"),
    TimeSlot(id: "02", startTime: "08:30am", endTime: "09:00am"),
    TimeSlot(id: "03", startTime: "09:00am", endTime: "09:30am"),
    TimeSlot(id: "04", startTime: "09:30am", endTime: "10:00am"),
    TimeSlot(id: "01", startTime: "10:00am", endTime: "10:30am"),
    TimeSlot(id: "02", startTime: "10:30am", endTime: "11:00am"),
    TimeSlot(id: "03", startTime: "11:00am", endTime: "11:30am"),
    TimeSlot(id: "04", startTime: "11:30am", endTime: "12:00am"),
    // Add more time slots as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF6D1B3C), // Dark red background
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Arabic Title
                const Text(
                  "قاعة ستريهلين للمناسبات",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),

                // Location Text
                const Text(
                  "طرابلس, التوفيلين, شارع احمد رفيق المهدوي",
                  style: TextStyle(color: Colors.white70),
                  textDirection: TextDirection.rtl,
                ),

                const SizedBox(height: 20),

                // Calendar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: CalendarFormat.month,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF6D1B3C),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white70),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(color: Colors.white),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Time Slots Grid
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      return TimeSlotCard(
                        timeSlot: timeSlots[index],
                        isSelected: timeSlots[index] == _selectedTimeSlot,
                        onTap: () {
                          setState(() {
                            _selectedTimeSlot = timeSlots[index];
                          });
                        },
                      );
                    },
                  ),
                ),

                // Book Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement booking logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "احجز الآن",
                      style: TextStyle(
                        color: Color(0xFF6D1B3C),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSlot {
  final String id;
  final String startTime;
  final String endTime;

  TimeSlot({required this.id, required this.startTime, required this.endTime});
}

class TimeSlotCard extends StatelessWidget {
  final TimeSlot timeSlot;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotCard({
    super.key,
    required this.timeSlot,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white24 : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeSlot.startTime,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const Text(
              "to",
              style: TextStyle(color: Colors.white70, fontSize: 10),
            ),
            Text(
              timeSlot.endTime,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
