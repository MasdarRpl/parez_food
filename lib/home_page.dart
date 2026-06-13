import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const HomeContent(),
    const TokoPage(),
    const CariPage(),
    const PesananPage(),
    const AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Toko'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

// ==================== HALAMAN BERANDA ====================
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildAddress(context),
            const SizedBox(height: 24),
            _buildPesanLagi(context),
            const SizedBox(height: 24),
            _buildPromoBanner(context),
            const SizedBox(height: 24),
            _buildRestoranTerdekat(context),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Halo, Parez!', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('Alamat Pengiriman', style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500])),
                  const Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              final homePageState = context.findAncestorStateOfType<_HomePageState>();
              homePageState?.setState(() {
                homePageState._currentIndex = 4;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.person_outline, color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddress(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.orange, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jl. Kemang Raya No. 10', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                Text('Jakarta Selatan, DKI Jakarta', style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.edit, color: Colors.grey[400], size: 20),
        ],
      ),
    );
  }

  Widget _buildPesanLagi(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Pesan Lagi', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildMenuCard(context, 'Sate Padang + Es Teh', '4.8', 'Top 50000'),
              const SizedBox(width: 12),
              _buildMenuCard(context, 'Pizza Place', '4.7', 'Top 50000'),
              const SizedBox(width: 12),
              _buildMenuCard(context, 'Sate Padang Sajo', '4.9', 'Top 50000'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, String rating, String label) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buka $title'))),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 80,
                color: Colors.orange[100],
                child: Center(child: Icon(Icons.restaurant, size: 40, color: Colors.orange[300])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.star, size: 12, color: Colors.amber), const SizedBox(width: 4), Text(rating, style: GoogleFonts.poppins(fontSize: 10))]),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(4)),
                    child: Text(label, style: GoogleFonts.poppins(fontSize: 8, color: Colors.green[700], fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Mengambil promo GOCENG...'))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrange], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hemat 50%', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text('Makan Enak Tetap Hemat', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 12),
            Text('Gunakan promo GOCENG sekarang!', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Promo GOCENG berhasil diambil!'))),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text('Ambil Promo'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestoranTerdekat(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Restoran Terdekat', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lihat semua restoran'))),
                child: Text('Lihat Semua', style: GoogleFonts.poppins(fontSize: 12, color: Colors.orange)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                indicatorColor: Colors.orange,
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey,
                tabs: [Tab(text: 'Untuk Kamu'), Tab(text: 'Terdekat')],
              ),
              SizedBox(
                height: 350,
                child: TabBarView(
                  children: [
                    ListView(children: [
                      _buildRestaurantCard(context, 'Sate Padang + Es Teh', 'Padang', '4.8', 1.2, 'Top 50000'),
                      _buildRestaurantCard(context, 'Pizza Place', 'Italian', '4.7', 1.5, 'Top 50000'),
                      _buildRestaurantCard(context, 'Hakata Iki', 'Japanese', '4.9', 2.0, 'Top 50000'),
                    ]),
                    ListView(children: [
                      _buildRestaurantCard(context, 'Warung Padang', 'Padang', '4.6', 0.8, 'Top 50000'),
                      _buildRestaurantCard(context, 'Bakmi GM', 'Chinese', '4.7', 1.0, 'Top 50000'),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantCard(BuildContext context, String name, String category, String rating, double distance, String label) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buka $name'))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.restaurant, size: 30, color: Colors.orange),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
                        child: Text(category, style: GoogleFonts.poppins(fontSize: 10)),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.star, size: 12, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(rating, style: GoogleFonts.poppins(fontSize: 11)),
                      const SizedBox(width: 8),
                      const Icon(Icons.location_on, size: 12, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text('$distance km', style: GoogleFonts.poppins(fontSize: 11)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(4)),
                    child: Text(label, style: GoogleFonts.poppins(fontSize: 9, color: Colors.green[700], fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.red[200]!)),
                  child: Text('Diskon Rp 15rb', style: GoogleFonts.poppins(fontSize: 10, color: Colors.red, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.orange[50], borderRadius: BorderRadius.circular(8)),
                  child: const Text('Pro', style: TextStyle(fontSize: 10, color: Colors.orange, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== HALAMAN TOKO ====================
class TokoPage extends StatelessWidget {
  const TokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tokoList = [
      {'name': 'Warung Makan Sederhana', 'rating': '4.5', 'distance': '0.5 km'},
      {'name': 'Kedai Kopi Kuy', 'rating': '4.8', 'distance': '0.8 km'},
      {'name': 'Bakso Cak Man', 'rating': '4.6', 'distance': '1.2 km'},
      {'name': 'Ayam Geprek Bang Iwan', 'rating': '4.7', 'distance': '1.5 km'},
      {'name': 'Sate Taichan Favorit', 'rating': '4.9', 'distance': '2.0 km'},
      {'name': 'Mie Ayam Jamur', 'rating': '4.4', 'distance': '0.9 km'},
      {'name': 'Es Teh Segar', 'rating': '4.3', 'distance': '1.1 km'},
      {'name': 'Nasi Goreng Kampung', 'rating': '4.7', 'distance': '1.8 km'},
      {'name': 'Pempek Palembang', 'rating': '4.6', 'distance': '2.2 km'},
      {'name': 'Rujak Buah Manis', 'rating': '4.5', 'distance': '1.4 km'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Toko', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tokoList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.store, size: 30, color: Colors.orange[300]),
              ),
              title: Text(tokoList[index]['name']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              subtitle: Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(tokoList[index]['rating']!),
                  const SizedBox(width: 8),
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(tokoList[index]['distance']!),
                ],
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.orange),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Buka ${tokoList[index]['name']}'))),
            ),
          );
        },
      ),
    );
  }
}

// ==================== HALAMAN CARI ====================
class CariPage extends StatefulWidget {
  const CariPage({super.key});

  @override
  State<CariPage> createState() => _CariPageState();
}

class _CariPageState extends State<CariPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  
  final List<Map<String, String>> _allItems = [
    {'name': 'Sate Padang', 'category': 'Makanan', 'price': 'Rp 25.000'},
    {'name': 'Pizza', 'category': 'Makanan', 'price': 'Rp 50.000'},
    {'name': 'Ramen', 'category': 'Makanan', 'price': 'Rp 35.000'},
    {'name': 'Es Teh', 'category': 'Minuman', 'price': 'Rp 5.000'},
    {'name': 'Kopi', 'category': 'Minuman', 'price': 'Rp 10.000'},
    {'name': 'Bakso', 'category': 'Makanan', 'price': 'Rp 15.000'},
    {'name': 'Mie Ayam', 'category': 'Makanan', 'price': 'Rp 12.000'},
    {'name': 'Nasi Goreng', 'category': 'Makanan', 'price': 'Rp 18.000'},
  ];

  List<Map<String, String>> get _filteredItems {
    if (_searchQuery.isEmpty) return _allItems;
    return _allItems.where((item) => item['name']!.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Makanan', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Cari makanan atau restoran...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.orange)),
              ),
            ),
          ),
        ),
      ),
      body: _filteredItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text('Tidak ada hasil ditemukan', style: GoogleFonts.poppins(color: Colors.grey[600])),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(10)),
                      child: Icon(item['category'] == 'Makanan' ? Icons.restaurant : Icons.local_cafe, size: 30, color: Colors.orange[300]),
                    ),
                    title: Text(item['name']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    subtitle: Text('${item['category']} • ${item['price']}', style: GoogleFonts.poppins(fontSize: 12)),
                    trailing: const Icon(Icons.add_shopping_cart, color: Colors.orange),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Menambahkan ${item['name']} ke keranjang'))),
                  ),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// ==================== HALAMAN PESANAN ====================
class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan Saya', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              tabs: [Tab(text: 'Aktif'), Tab(text: 'Selesai'), Tab(text: 'Dibatalkan')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrderList(context, 'aktif'),
                  _buildOrderList(context, 'selesai'),
                  _buildOrderList(context, 'dibatalkan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, String status) {
    List<Map<String, String>> orders;
    
    if (status == 'aktif') {
      orders = [
        {'restaurant': 'Sate Padang Sajo', 'items': '2 item', 'total': 'Rp 65.000', 'time': '25 menit lagi'},
        {'restaurant': 'Pizza Place', 'items': '1 item', 'total': 'Rp 50.000', 'time': '40 menit lagi'},
      ];
    } else if (status == 'selesai') {
      orders = [
        {'restaurant': 'Hakata Iki', 'items': '3 item', 'total': 'Rp 120.000', 'time': 'Kemarin'},
        {'restaurant': 'Warung Padang', 'items': '2 item', 'total': 'Rp 35.000', 'time': '2 hari lalu'},
        {'restaurant': 'Bakmi GM', 'items': '1 item', 'total': 'Rp 45.000', 'time': '3 hari lalu'},
      ];
    } else {
      orders = [
        {'restaurant': 'Sate Khas Senayan', 'items': '2 item', 'total': 'Rp 70.000', 'time': 'Dibatalkan'},
      ];
    }

    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text('Tidak ada pesanan ${status == 'aktif' ? 'aktif' : status == 'selesai' ? 'selesai' : 'dibatalkan'}', style: GoogleFonts.poppins(color: Colors.grey[600])),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.restaurant, color: Colors.orange[300]),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order['restaurant']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                          Text('${order['items']} • ${order['total']}', style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: status == 'aktif' ? Colors.green[50] : status == 'selesai' ? Colors.blue[50] : Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        order['time']!,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: status == 'aktif' ? Colors.green[700] : status == 'selesai' ? Colors.blue[700] : Colors.red[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                if (status == 'aktif')
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hubungi penjual'))),
                            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.orange), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            child: const Text('Hubungi', style: TextStyle(color: Colors.orange)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lacak pesanan'))),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                            child: const Text('Lacak'),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (status == 'selesai')
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pesan lagi'))),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), minimumSize: const Size(double.infinity, 40)),
                      child: const Text('Pesan Lagi'),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ==================== HALAMAN AKUN ====================
class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Keluar'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Anda telah keluar')));
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap, bool isLogout = false}) {
    return ListTile(
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: isLogout ? Colors.red[50] : Colors.orange[50], borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: isLogout ? Colors.red : Colors.orange, size: 24),
      ),
      title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: isLogout ? Colors.red : Colors.black87)),
      subtitle: Text(subtitle, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
      trailing: Icon(Icons.chevron_right, color: isLogout ? Colors.red : Colors.grey[400]),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Saya', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 2))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(35)),
                    child: Icon(Icons.person, size: 40, color: Colors.orange[400]),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Parez Fodd', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('parez@email.com', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
                        const SizedBox(height: 4),
                        Text('+62 812 3456 7890', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit profil'))),
                    icon: Icon(Icons.edit, color: Colors.orange),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context,
              icon: Icons.history,
              title: 'Riwayat Pesanan',
              subtitle: 'Lihat pesanan Anda sebelumnya',
              onTap: () {
                final homePageState = context.findAncestorStateOfType<_HomePageState>();
                homePageState?.setState(() => homePageState._currentIndex = 3);
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.favorite_border,
              title: 'Restoran Favorit',
              subtitle: 'Restoran yang sering Anda pesan',
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lihat restoran favorit'))),
            ),
            _buildMenuItem(
              context,
              icon: Icons.local_offer_outlined,
              title: 'Voucher Saya',
              subtitle: 'Voucher dan promo yang tersedia',
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lihat voucher'))),
            ),
            _buildMenuItem(
              context,
              icon: Icons.location_on_outlined,
              title: 'Alamat Saya',
              subtitle: 'Kelola alamat pengiriman',
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kelola alamat'))),
            ),
            _buildMenuItem(
              context,
              icon: Icons.payment,
              title: 'Metode Pembayaran',
              subtitle: 'Tambah atau ubah metode pembayaran',
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Metode pembayaran'))),
            ),
            _buildMenuItem(
              context,
              icon: Icons.help_outline,
              title: 'Bantuan',
              subtitle: 'Pusat bantuan & FAQ',
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bantuan'))),
            ),
            const Divider(height: 32, indent: 20, endIndent: 20),
            _buildMenuItem(
              context,
              icon: Icons.logout,
              title: 'Keluar',
              subtitle: 'Keluar dari akun',
              isLogout: true,
              onTap: () => _showLogoutDialog(context),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}