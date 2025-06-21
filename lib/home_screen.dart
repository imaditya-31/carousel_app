import 'package:carousel_app/movie_card.dart';
import 'package:carousel_app/shimmer_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Interstellar',
      'image':
          'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
      'link': 'https://www.imdb.com/title/tt0816692/',
    },
    {
      'title': 'Avengers: Endgame',
      'image':
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      'link': 'https://www.imdb.com/title/tt4154796/',
    },
    {
      'title': 'The Dark Knight',
      'image':
          'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      'link': 'https://www.imdb.com/title/tt0468569/',
    },
    {
      'title': 'Joker',
      'image':
          'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      'link': 'https://www.imdb.com/title/tt7286456/',
    },
    {
      'title': 'Avatar',
      'image':
          'https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg',
      'link': 'https://www.imdb.com/title/tt0499549/',
    },
    {
      'title': 'Titanic',
      'image':
          'https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg',
      'link': 'https://www.imdb.com/title/tt0120338/',
    },
    {
      'title': 'Black Panther',
      'image':
          'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      'link': 'https://www.imdb.com/title/tt1825683/',
    },
    {
      'title': 'Doctor Strange in the Multiverse of Madness',
      'image':
          'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      'link': 'https://www.imdb.com/title/tt9419884/',
    },
    {
      'title': 'Spider-Man: No Way Home',
      'image':
          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      'link': 'https://www.imdb.com/title/tt10872600/',
    },
  ];

  int _currentIndex = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Carousel',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Colors.redAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(
                const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
              ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  CarouselSlider.builder(
                    itemCount: movies.length,
                    options: CarouselOptions(
                      height: 400,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      padEnds: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2500),
                      onPageChanged: (index, reason) {
                        setState(() => _currentIndex = index);
                      },
                    ),
                    itemBuilder: (context, index, realIdx) {
                      final movie = movies[index];
                      return _loading
                          ? const ShimmerMovieCard()
                          : MovieCard(
                              title: movie['title']!,
                              imageUrl: movie['image']!,
                              link: movie['link']!,
                            );
                    },
                  ),
                  const SizedBox(height: 20),
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: movies.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.cyan,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Made with ❤️ by Aditya Vishwakarma",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
