import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Movie {
  final String title;
  final String imageUrl; 
  final String description;

  Movie(this.title, this.imageUrl, this.description);
}


final List<Movie> nowPlayingMovies = [
  Movie(
    'Elemental 2', 
    'assets/Elemental2.jpg', 
    'Petualangan baru di Kota Element.'
  ),
  Movie(
    'Frozen 3', 
    'assets/Frozen3.jpg', 
    'Elsa dan Anna kembali dalam petualangan musim dingin.'
  ),
  Movie(
    'Zootopia', 
    'assets/Zootopia.jpg', 
    'Detektif Judy Hopps memecahkan misteri di kota hewan.'
  ),
];


final List<Movie> trendingMovies = [
  Movie(
    'Big Hero 6', 
    'assets/BigHero6.jpg', 
    'Pahlawan super remaja dan robot balon Baymax.'
  ),
  Movie(
    'Boboiboy Movie 2', 
    'assets/BoboiboyMovie2.jpg', 
    'Aksi Boboiboy melawan penjahat alien yang kuat.'
  ),
  Movie(
    'Moana', 
    'assets/Moana.jpg', 
    'Pelayaran heroik seorang putri Polinesia.'
  ),
  Movie(
    'Mune: Guardian of the Moon', 
    'assets/Mune.jpg', 
    'Kisah tentang penjaga bulan dan matahari yang baru.'
  ),
  Movie(
    'Regal Academy', 
    'assets/RegalAcademy.jpg', 
    'Rose Cinderella belajar di sekolah untuk cucu-cucu karakter dongeng.'
  ),
];


final List<Movie> popularMovies = [
  Movie(
    'How to Train Your Dragon', 
    'assets/httyd.jpg', 
    'Persahabatan antara Hiccup dan naganya, Toothless.'
  ),
  Movie(
    'Rio 2', 
    'assets/Rio2.jpg', 
    'Blu, Jewel, dan anak-anak mereka berpetualang di Amazon.'
  ),
  Movie(
    'The Guardians', 
    'assets/TheGuardians.jpg', 
    'Pahlawan legendaris (Santa, Kelinci Paskah, dll) bersatu melawan Pitch.'
  ),
  Movie(
    'Epic', 
    'assets/Epic.jpg', 
    'Seorang gadis remaja menyusut dan menemukan dunia rahasia.'
  ),
  Movie(
    'Ice Age: The Meltdown', 
    'assets/IceAge2.jpg', 
    'Petualangan Sid, Manny, dan Diego saat es mencair.'
  ),
];


final List<Movie> topRatedMovies = [
  Movie(
    'UP', 
    'assets/UP.jpg', 
    'Kakek Carl dan Russell berpetualang ke Paradise Falls.'
  ),
  Movie(
    'Arthur and the Revenge of Maltazard', 
    'assets/Arthur3.jpg', 
    'Film ketiga dari seri Arthur dan Minimoys.'
  ),
  Movie(
    'Dora and the Lost City of Gold', 
    'assets/Dora.jpg', 
    'Dora beranjak remaja dan berpetualang mencari kota emas.'
  ),
  Movie(
    'Winx Club', 
    'assets/Winx.jpg', 
    'Kisah para peri di sekolah Alfea.'
  ),
  Movie(
    'Throne Elves', 
    'assets/ThroneElves.jpg', 
    'Film fantasi yang melibatkan makhluk ajaib.'
  ),
];


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App Layout',
      theme: ThemeData(
        brightness: Brightness.dark, 
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        )
      ),
      home: const MovieHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        padding: const EdgeInsets.only(top: 40), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            _buildSectionHeader('Now Playing'),
            const SizedBox(height: 10),
            _buildNowPlayingCarousel(context, nowPlayingMovies), 
            
            const SizedBox(height: 30),

            
            _buildMovieSection('Trending', trendingMovies), 
            const SizedBox(height: 30),

            
            _buildMovieSection('Popular', popularMovies), 
            const SizedBox(height: 30),

            
            _buildMovieSection('Top Rated', topRatedMovies), 
            const SizedBox(height: 80), 
          ],
        ),
      ),
      
      
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black.withOpacity(0.9),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.search, color: Colors.grey, size: 30),
            Icon(Icons.person, color: Colors.grey, size: 30),
          ],
        ),
      ),
    );
  }
  
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          // Hanya tampilkan "More" jika bukan bagian "Now Playing"
          if (title != 'Now Playing')
            const Text(
              'More',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
        ],
      ),
    );
  }


  

  Widget _buildNowPlayingCarousel(BuildContext context, List<Movie> movies) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 350.0,
        enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 0.8,
      ),
      items: movies.map((movie) { 
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  
                  image: AssetImage(movie.imageUrl), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      movie.description.split('.').first,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  

  Widget _buildMovieSection(String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(title),
        const SizedBox(height: 10),
        SizedBox(
          height: 200, 
          
          child: ListView.builder(
            scrollDirection: Axis.horizontal, 
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            itemCount: movies.length, 
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Container(
                width: 110, 
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    
                    image: AssetImage(movie.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}