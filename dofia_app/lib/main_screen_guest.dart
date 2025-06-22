import 'package:dofia_the_book/screens/home_screen_guest.dart';
import 'package:dofia_the_book/widgets/custom_app_bar.dart';
import 'package:dofia_the_book/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'screens/Guest_Pages_fav_cart.dart';
import 'widgets/welcome_message.dart';
import 'widgets/book_carousel.dart';
import 'widgets/search_bar.dart';
import 'screens/auth/login_screen.dart';

class MainScreenGuest extends StatefulWidget {
  const MainScreenGuest({super.key});

  @override
  State<MainScreenGuest> createState() => _MainScreenGuestState();
}

class _MainScreenGuestState extends State<MainScreenGuest>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0; // Default selected index
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;
  late AnimationController _controller;
  late Animation<Offset> _drawerOffset;

  List<Widget> get _pages => [
        HomeScreenGuest(
          onGoToCart: _onGotoCart,
          onGoToFavorite: _onGotoFavorite,
        ),
        const GuestPagesFavCart(
          guest_title_page: 'My Favorite',
          key_word_page: 'Favorite',
        ),
        const GuestPagesFavCart(
            guest_title_page: 'My Cart', key_word_page: 'Cart'),
      ];

  void _onGotoCart() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  void _onGotoFavorite() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  Widget _drawerTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: () {
        // Add appropriate navigation or function here
      },
    );
  }

  void _onItemTapped(int index) {
    // Navigator.pop(context);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _drawerOffset = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  Future<bool> _handleWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = _selectedIndex == 0
        ? SingleChildScrollView(
            child: Column(
              children: [
                const WelcomeMessage(),
                const SearchBar(),
                const BookCarousel(),
                _pages[0], // HomeScreenGuest with callbacks
                const SizedBox(height: 115),
              ],
            ),
          )
        : _pages[_selectedIndex]; // Directly render selected page

    Widget menuDrawer = SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        elevation: 16,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              // Profile Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.account_circle, size: 48, color: Colors.black),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guest User',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Not available',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Section 1
              _drawerTile(icon: Icons.person, title: 'My Profile'),
              _drawerTile(icon: Icons.menu_book, title: 'All Books & Genres'),
              _drawerTile(icon: Icons.receipt_long, title: 'My Order Status'),

              const Divider(thickness: 1),

              // Section 2
              _drawerTile(icon: Icons.feedback_outlined, title: 'Feedback'),
              _drawerTile(icon: Icons.history, title: 'History'),
              _drawerTile(icon: Icons.language, title: 'Language'),
              _drawerTile(icon: Icons.settings, title: 'Settings'),
              _drawerTile(icon: Icons.help_outline, title: 'Help & Support'),
              _drawerTile(icon: Icons.info_outline, title: 'About'),

              const Spacer(),

              // Log in Button
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      onPressed: () {
                        // Close the drawer first
                        Navigator.pop(context);

                        // Then navigate to the login screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text("Log in",
                          style: TextStyle(color: Colors.white)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

    return WillPopScope(
        onWillPop: _handleWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            title: 'DofiaTheBook',
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          drawer: menuDrawer,
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: const Color(0xFFE0F7FF),
                  child: bodyContent,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomBottomNavBar(
                    selectedIndex: _selectedIndex,
                    onItemTapped: _onItemTapped,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void onGoToCart() {
    setState(() => _selectedIndex = 2);
  }
}
