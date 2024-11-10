import 'package:flutter/material.dart';

void main() {
  runApp(const SolarSystemApp());
}

class SolarSystemApp extends StatelessWidget {
  const SolarSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'النظام الشمسي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// Page d'accueil
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'مرحبًا بكم في تطبيق النظام الشمسي! استكشف الكواكب وتعرف على المزيد عنها.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.public, color: Colors.blueAccent),
                  title: Text(
                    'الكواكب',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  tileColor: Colors.blueGrey.shade900,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlanetsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.quiz, color: Colors.blueAccent),
                  title: Text(
                    'اختبار حول النظام الشمسي',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  tileColor: Colors.blueGrey.shade900,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Page des planètes
class PlanetsPage extends StatelessWidget {
  const PlanetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الكواكب'), backgroundColor: Colors.blueAccent),
      body: ListView(
        children: [
          PlanetTile(name: 'عطارد', size: '4,879 كم', distance: '57.9 مليون كم', image: 'assets/Mercury.png'),
          PlanetTile(name: 'الزهرة', size: '12,104 كم', distance: '108.2 مليون كم', image: 'assets/Venus.png'),
          PlanetTile(name: 'الأرض', size: '12,742 كم', distance: '149.6 مليون كم', image: 'assets/Earth.png'),
          PlanetTile(name: 'المريخ', size: '6,779 كم', distance: '227.9 مليون كم', image: 'assets/Mars.png'),
          // Ajouter plus de planètes ici...
        ],
      ),
    );
  }
}

class PlanetTile extends StatelessWidget {
  final String name;
  final String size;
  final String distance;
  final String image;

  const PlanetTile({
    required this.name,
    required this.size,
    required this.distance,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade800,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          'الحجم: $size\nالمسافة من الشمس: $distance',
          style: const TextStyle(color: Colors.white70),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlanetDetailPage(name: name, image: image)),
          );
        },
      ),
    );
  }
}

// Page des détails de la planète
class PlanetDetailPage extends StatelessWidget {
  final String name;
  final String image;

  const PlanetDetailPage({required this.name, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(image, width: 200, height: 200),
            const SizedBox(height: 16),
            Text(
              'معلومات حول $name',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'هنا يمكنك إضافة معلومات تفصيلية حول الكوكب مثل الغلاف الجوي، الأقمار، والمزيد.',
              style: TextStyle(fontSize: 16, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Page de quiz
class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختبار حول النظام الشمسي'), backgroundColor: Colors.blueAccent),
      body: Center(
        child: const Text(
          'هذه صفحة الاختبار! يمكنك إضافة أسئلة حول النظام الشمسي هنا.',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
