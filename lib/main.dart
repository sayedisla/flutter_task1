import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ─── State variables (used with setState) ───────────────────────────────────
  bool _isFollowing = false;
  int _followerCount = 1240;

  // ─── Colour palette ─────────────────────────────────────────────────────────
  static const Color _purple = Color(0xFF6C63FF);
  static const Color _purpleLight = Color(0xFFEDECFF);
  static const Color _dark = Color(0xFF1A1A2E);
  static const Color _grey = Color(0xFF6B7280);
  static const Color _bg = Color(0xFFF8F7FF);

  // ─── Follow / Unfollow button → uses setState ────────────────────────────────
  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followerCount += _isFollowing ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,

      // ── AppBar ──────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: _purple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Hero / Header section ──────────────────────────────────────────
            _buildHeroSection(),

            // ── Statistics row ─────────────────────────────────────────────────
            _buildStatsSection(),

            // ── Action buttons ─────────────────────────────────────────────────
            _buildActionButtons(),

            // ── About Me ───────────────────────────────────────────────────────
            _buildAboutSection(),

            // ── Profile details ────────────────────────────────────────────────
            _buildProfileDetails(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ─── Hero Section (Stack + Container + Center) ──────────────────────────────
  Widget _buildHeroSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Purple banner
        Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [_purple, Color(0xFF9C8FFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // White card below banner
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 60, 16, 0),
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: _purple.withOpacity(0.10),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                // Name
                Text(
                  'Sayed islam',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _dark,
                  ),
                ),
                const SizedBox(height: 4),
                // Profession chip
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _purpleLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Flutter Developer · SWE Student',
                    style: TextStyle(
                      color: _purple,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Location row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on, size: 14, color: _grey),
                    SizedBox(width: 4),
                    Text(
                      'Sylhet, Bangladesh',
                      style: TextStyle(color: _grey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Avatar – sits on top of banner & card
        Positioned(
          top: 55,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: _purple.withOpacity(0.25),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: _purpleLight,
                  child: Text(
                    'SR',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: _purple,
                    ),
                  ),
                ),
              ),
              // Online badge
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Statistics (Row + Expanded) ────────────────────────────────────────────
  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _purple.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: _statItem(
                value: '12',
                label: 'Projects',
                icon: Icons.folder_copy_rounded,
              ),
            ),
            _verticalDivider(),
            Expanded(
              child: _statItem(
                // ← shows live follower count (changes with setState)
                value: _followerCount.toString(),
                label: 'Followers',
                icon: Icons.people_alt_rounded,
              ),
            ),
            _verticalDivider(),
            Expanded(
              child: _statItem(
                value: '3 yrs',
                label: 'Experience',
                icon: Icons.workspace_premium_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(
      {required String value,
        required String label,
        required IconData icon}) {
    return Column(
      children: [
        Icon(icon, color: _purple, size: 22),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _dark,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: _grey, fontSize: 12)),
      ],
    );
  }

  Widget _verticalDivider() => Container(
    height: 50,
    width: 1,
    color: const Color(0xFFE5E7EB),
  );

  // ─── Action Buttons (Follow uses setState) ───────────────────────────────────
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          // Follow / Unfollow — setState button
          Expanded(
            child: GestureDetector(
              onTap: _toggleFollow,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: _isFollowing ? Colors.white : _purple,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: _purple, width: 2),
                  boxShadow: _isFollowing
                      ? []
                      : [
                    BoxShadow(
                      color: _purple.withOpacity(0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isFollowing
                          ? Icons.person_remove_rounded
                          : Icons.person_add_rounded,
                      color: _isFollowing ? _purple : Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _isFollowing ? 'Following' : 'Follow',
                      style: TextStyle(
                        color: _isFollowing ? _purple : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Message button
          Expanded(
            child: _outlineButton(
              label: 'Message',
              icon: Icons.chat_bubble_outline_rounded,
              onTap: () {},
            ),
          ),
          const SizedBox(width: 10),
          // Call button
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(14),
              border:
              Border.all(color: const Color(0xFF22C55E).withOpacity(0.4)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call_rounded,
                  color: Color(0xFF16A34A), size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlineButton(
      {required String label,
        required IconData icon,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _purple, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _purple, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: _purple,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── About Me ───────────────────────────────────────────────────────────────
  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _purple.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.info_outline_rounded, color: _purple, size: 18),
                SizedBox(width: 8),
                Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _dark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Passionate SWE student at MU with a deep interest in mobile app '
                  'development and UI/UX design. I love building clean, user-friendly '
                  'Flutter apps and learning new technologies every day. '
                  'Open to collaboration and exciting projects!',
              style: TextStyle(
                color: _grey,
                fontSize: 13.5,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Profile Details (4 info rows) ──────────────────────────────────────────
  Widget _buildProfileDetails() {
    final details = [
      _DetailItem(
          icon: Icons.email_rounded,
          label: 'Email',
          value: 'sayed@student.mu.edu'),
      _DetailItem(
          icon: Icons.badge_rounded,
          label: 'Student ID',
          value: '232-134-008'),
      _DetailItem(
          icon: Icons.school_rounded,
          label: 'Department',
          value: 'Software & Eng.'),
      _DetailItem(
          icon: Icons.calendar_today_rounded, label: 'Batch', value: '2023'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _purple.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: List.generate(details.length, (i) {
            final d = details[i];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _purpleLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(d.icon, color: _purple, size: 18),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              d.label,
                              style: const TextStyle(
                                color: _grey,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              d.value,
                              style: const TextStyle(
                                color: _dark,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: _grey, size: 20),
                    ],
                  ),
                ),
                if (i < details.length - 1)
                  const Divider(height: 1, indent: 18, endIndent: 18),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// ─── Helper data class ────────────────────────────────────────────────────────
class _DetailItem {
  final IconData icon;
  final String label;
  final String value;
  const _DetailItem(
      {required this.icon, required this.label, required this.value});
}