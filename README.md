# lemari lama
Rahma Dwi Maghfira  
2306245794  
PBP F

**Link to Repository**: https://github.com/rahmafira01/lemarilama-mobile

# Tugas 7: Elemen Dasar Flutter
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekedar mengukuti tutorial).
1. Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
```
flutter create lemari_lama
cd lemari_lama
```
2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:
```
final List<ItemHomepage> items = [
  ItemHomepage("Lihat Daftar Produk", Icons.list),
  ItemHomepage("Tambah Produk", Icons.add),
  ItemHomepage("Logout", Icons.logout),
];
```
3. Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
- Menambahkan parameter di fungsi `ItemHomePage`
```
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Tambahkan parameter warna

  ItemHomepage(this.name, this.icon, this.color); // Modifikasi konstruktor
}
```
- Memperbarui daftar items dengan menambahkan color
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, Color(0xFFE5C5C1)), // Warna Pink
    ItemHomepage("Tambah Produk", Icons.add, Color(0xFFEAD0D1)), // Warna Pink
    ItemHomepage("Logout", Icons.logout, Color(0xFFEDD7D6)), // Warna Pink
];
```
- Mengubah parameter warna dalam fungsi `ItemCard`
```
class ItemCard extends StatelessWidget {
    ...
  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Gunakan warna dari item
      borderRadius: BorderRadius.circular(12),
    ...
    )
  }
}
```
4. Memunculkan Snackbar dengan tulisan:
```
 child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          String message;
          switch (item.name) {
            case "Lihat Daftar Produk":
              message = "Kamu telah menekan tombol Lihat Daftar Produk";
              break;
            case "Tambah Produk":
              message = "Kamu telah menekan tombol Tambah Produk";
              break;
            case "Logout":
              message = "Kamu telah menekan tombol Logout";
              break;
            default:
              message = "Kamu telah menekan tombol ${item.name}";
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
        },
 )
```
## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
**Stateless widget** bersifat statis, tidak memiliki status internal yang berubah-ubah, dan hanya diperbarui oleh perubahan dari widget induknya; umumnya digunakan untuk menampilkan elemen UI yang tidak berubah, seperti teks atau ikon. Sebaliknya, **stateful widget** bersifat dinamis, dapat mengubah tampilannya secara mandiri melalui kelas **State** yang menyimpan data dan logika UI yang berubah-ubah, seperti input pengguna atau animasi. Stateful widget memungkinkan pembaruan tampilan saat terjadi perubahan data, membuatnya cocok untuk elemen interaktif yang memerlukan pembaruan terus-menerus.
## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya
Berikut adalah 5 widget utama yang saya gunakan
1. **MaterialApp**: Widget utama yang menyediakan struktur dasar aplikasi, mengatur tema, judul, dan layar utama aplikasi.
2. **Scaffold**: Struktur dasar halaman yang memberikan kerangka dengan AppBar (bagian atas halaman), body (konten utama), dan floatingActionButton. Scaffold membuat tampilan aplikasi lebih teratur.
3. **AppBar**: Widget bagian atas halaman yang menampilkan judul atau ikon, biasanya digunakan untuk navigasi atau menampilkan nama aplikasi.
4. **GridView**: Layout grid untuk menampilkan widget dalam bentuk grid. Dalam proyek ini, digunakan untuk menyusun ItemCard dalam tampilan 3 kolom.
5. **Card**: Widget kotak yang menampilkan informasi dengan efek bayangan. Digunakan di proyek ini untuk InfoCard, yang menampilkan data seperti NPM, nama, dan kelas.
6. **Column**: Menyusun widget secara vertikal. Digunakan untuk menempatkan widget seperti teks, tombol, atau kartu dalam satu kolom.
7. **Row**: Menyusun widget secara horizontal. Dalam proyek ini, digunakan untuk menampilkan beberapa InfoCard secara berjajar.
8. **Teks**: Menampilkan teks di layar. Teks digunakan untuk menunjukkan informasi statis seperti judul atau deskripsi.
9. **Icon**: Menampilkan ikon grafis. Dalam proyek ini, digunakan di ItemCard untuk menunjukkan ikon pada setiap item menu.
10. **SnackBar**: Widget yang menampilkan pesan sementara di bagian bawah layar. Di proyek ini, digunakan untuk menampilkan pesan saat tombol pada ItemCard ditekan.
## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` adalah metode di Flutter yang digunakan untuk memberi tahu framework bahwa ada perubahan pada state dari widget, yang mengakibatkan widget tersebut direbuild dan menampilkan perubahan di antarmuka pengguna. Variabel yang dapat terdampak oleh `setState()` biasanya mencakup variabel instance, list atau map, boolean flags, count atau indeks, serta data model yang digunakan dalam widget. Dengan memanggil `setState()`, kita dapat memperbarui nilai-nilai tersebut, dan setiap perubahan yang terjadi akan tercermin langsung pada tampilan aplikasi, seperti ketika mengganti nama pengguna atau menambahkan item baru dalam daftar.
## Jelaskan perbedaan antara const dengan final.
Dalam Dart, `const` dan `final` digunakan untuk mendeklarasikan variabel yang tidak dapat diubah setelah inisialisasi, namun keduanya memiliki perbedaan mendasar. Variabel yang dideklarasikan dengan `const` adalah konstan waktu kompilasi, yang berarti nilainya harus ditentukan saat kompilasi dan tidak bisa diubah setelahnya, sehingga sering digunakan untuk objek yang statis. Sebaliknya, variabel yang dideklarasikan dengan `final` hanya dapat diinisialisasi sekali, tetapi nilainya bisa ditentukan pada saat runtime, memungkinkan fleksibilitas saat penentuan nilai. Dengan demikian, `const` lebih ketat karena nilainya tetap sepanjang waktu, sedangkan `final` lebih fleksibel dengan nilai yang ditetapkan hanya satu kali.  


# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
## Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Di Flutter, `const` digunakan untuk mendefinisikan objek atau widget yang bersifat konstan, sehingga tidak perlu diinisialisasi ulang setiap kali build terjadi, yang meningkatkan performa dan efisiensi memori. Dengan `const`, Flutter dapat menghindari rendering ulang untuk elemen-elemen yang tidak berubah, seperti pada contoh `ProductEntryFormPage()`. Sebaiknya gunakan `const` pada widget atau nilai statis yang sudah diketahui dan tidak tergantung pada perubahan state, misalnya teks, warna, atau widget tanpa dependensi dinamis. Namun, hindari `const` pada elemen yang berubah-ubah atau mengambil data dari sumber eksternal, karena ini akan mencegah pembaruan sesuai perubahan data.
## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
- **Column**  
  `Column` digunakan untuk menata elemen-elemen secara vertikal, dari atas ke bawah. Di dalam kode ini, `Column` digunakan di dalam `Scaffold` pada `body` widget untuk menampilkan beberapa elemen pada halaman.  
  Contoh:  
  ```dart
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InfoCard(title: 'NPM', content: npm),
          InfoCard(title: 'Name', content: name),
          InfoCard(title: 'Class', content: className),
        ],
      ),
    ]
    ...
  )
  ```
  Pada contoh ini, `Column` mengatur elemen-elemen secara vertikal di dalamnya, termasuk `Row` yang menampilkan tiga kartu (`InfoCard`).
- **Row**  
  `Row` digunakan untuk menata elemen secara horizontal, dari kiri ke kanan. Di kode ini, `Row` terdapat dalam `Column` utama dan berfungsi untuk menampilkan kartu informasi (`InfoCard`) dalam satu baris.  
  Contoh:
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InfoCard(title: 'NPM', content: npm),
      InfoCard(title: 'Name', content: name),
      InfoCard(title: 'Class', content: className),
    ],
  )
  ```
  Di sini, `Row` mengatur tiga widget `InfoCard` dalam satu baris. Properti `mainAxisAlignment.spaceEvenly` memastikan ada jarak yang sama di antara kartu-kartu tersebut.
- **Perbedaan Column dan Row**  
  - **Orientasi**: `Column` menata widget secara vertikal (atas ke bawah), sementara `Row` menata widget secara horizontal (kiri ke kanan).
  - **Sumbu Utama**: Pada `Column`, sumbu utama adalah vertikal, sehingga `mainAxisAlignment` mengatur posisi secara vertikal, sedangkan pada `Row`, sumbu utama adalah horizontal, sehingga `mainAxisAlignment` mengatur posisi secara horizontal.
  - **Penggunaan dalam Tata Letak**: `Column` digunakan ketika elemen-elemen perlu ditumpuk vertikal (seperti daftar), sementara `Row` berguna untuk elemen-elemen yang harus sejajar dalam satu baris (misalnya, ikon atau informasi pada `InfoCard`).

## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada tugas kali ini, elemen input yang saya gunakan pada halaman form adalah:
1. **TextFormField** untuk input teks, yaitu:
   - **Nama Produk** dengan tipe input teks.
   - **Jumlah Produk** dengan tipe input angka (menggunakan `keyboardType: TextInputType.number`).
   - **Deskripsi Produk** dengan tipe input teks.
2. **ElevatedButton** untuk mengirim data (submit) yang telah diisi pada form. Tombol ini juga berfungsi untuk menampilkan pesan konfirmasi bahwa data produk berhasil disimpan ketika validasi form berhasil dilakukan.

Dalam tugas ini, terdapat beberapa elemen input lain yang disediakan Flutter namun tidak saya gunakan, seperti:
- **DropdownButton**: Digunakan untuk memilih dari beberapa pilihan.
- **RadioButton**: Cocok untuk memilih salah satu opsi dari beberapa pilihan.
- **Switch**: Biasanya digunakan untuk mengaktifkan atau menonaktifkan fitur tertentu.
- **Checkbox**: Berguna untuk memilih beberapa opsi yang bisa lebih dari satu.
- **Slider**: Biasanya digunakan untuk input nilai dalam rentang tertentu.

Elemen-elemen ini tidak digunakan karena input yang diperlukan hanya teks sederhana, angka, dan teks deskripsi, sehingga elemen yang telah dipilih cukup untuk kebutuhan form ini.

## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi Flutter, kita dapat menetapkan primary color dan secondary color pada file main.dart. Saya telah menerapkan theme pada aplikai saya, yaitu sebagai berikut:
```dart
import 'package:flutter/material.dart';
import 'package:lemari_lama/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lemari Lama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF7F6269),
          primary: Color(0xFF7F6269),
          secondary: Color(0xFF7F6269),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menavigasi sebuah halaman baru, saya mengakses Navigator melalui BuildContext dan memanggil fungsi yang ada, seperti misalnya push(), pop(), serta pushReplacement().
```dart
// Navigate ke route yang sesuai (tergantung jenis tombol)
if (item.name == "Tambah Product") {
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => const ProductEntryFormPage(),
    )
);
}
```
```dart
  onPressed: () {
      Navigator.pop(context);
  },
```
```dart
  onTap: () {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(),
      ));
  },
```

# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter
##  Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan/pengiriman data JSON penting untuk validasi, standarisasi struktur data, mencegah error logika, meningkatkan keamanan, dan mempermudah maintenance. Tanpa model, error tidak selalu terjadi, tetapi risiko inkonsistensi dan bug meningkat jika data JSON tidak sesuai format yang diharapkan. Model memastikan aplikasi lebih stabil dan terkelola dengan baik.  
## Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server Django. Fungsi utamanya adalah untuk mengirim request HTTP (GET, POST, dll.) ke server, menerima response dari server (biasanya dalam format JSON), dan memparsing response tersebut agar dapat digunakan di aplikasi. Dalam tugas ini, library http digunakan untuk mengambil data item, mengirim data login/registrasi, dan mengelola request lainnya.  
## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.  
Fungsi Utama dari CookieRequest memungkinkan aplikasi untuk menyimpan, mengambil, dan mengelola cookie, yang penting untuk otentikasi, pengaturan sesi, dan menyimpan preferensi pengguna.
1. Pembagian Instance ke Semua Komponen
  - Keamanan = Memastikan bahwa cookie yang digunakan konsisten di seluruh aplikasi.
2. Pemeliharaan Sesi
  - Membantu dalam pemeliharaan sesi pengguna saat berpindah antar komponen atau halaman.
3. Kemudahan Penggunaan
  - Mengurangi redundansi kode dan mempermudah pengelolaan cookie secara terpusat.
## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. Input Data: Pengguna memasukkan data melalui form di aplikasi Flutter.
2. Mengirim Data ke Server: Aplikasi menggunakan request HTTP (POST) untuk mengirim data tersebut ke server Django.
3. Pemrosesan di Server: Django menerima data, memprosesnya (misalnya, menyimpan ke database), dan mengirimkan response (biasanya dalam format JSON).
4. Menerima Response: Flutter menerima response dari server.
5. Memparsing Data: Data JSON diparsing menjadi objek model.
6. Menampilkan Data: Data yang diparsing digunakan untuk memperbarui tampilan UI aplikasi Flutter.
## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi ini melibatkan langkah-langkah berikut:
1. Login:
  - Pengguna memasukkan kredensial (username dan password) pada antarmuka pengguna Flutter.
  - Aplikasi Flutter mengirim permintaan HTTP POST ke endpoint login yang disediakan oleh backend (misalnya Django).
  - Backend menerima permintaan, memvalidasi kredensial, dan menghasilkan token atau sesi untuk pengguna yang berhasil.
  - Token atau sesi dikirim kembali ke aplikasi Flutter sebagai respons.
  - Aplikasi Flutter menyimpan token atau sesi untuk digunakan dalam permintaan selanjutnya.
2. Register:
  - Pengguna mengisi formulir dengan informasi yang diperlukan (misalnya nama, email, password) pada antarmuka pengguna Flutter.
  - Aplikasi Flutter mengirim permintaan HTTP POST ke endpoint register di backend.
  - Backend menerima permintaan, memvalidasi dan menyimpan informasi pengguna baru ke dalam basis data.
  - Aplikasi Flutter menerima respons dari backend, biasanya berupa konfirmasi bahwa registrasi berhasil.
3. Logout:
  - Pengguna mengklik tombol logout pada antarmuka pengguna Flutter.
  - Aplikasi Flutter mengirim permintaan HTTP ke endpoint logout di backend (opsional tergantung pada implementasi).
  - Backend menghapus token atau sesi dari penyimpanan sesi aktif.
  - Aplikasi Flutter menghapus token atau sesi lokalnya, mengakhiri akses pengguna ke area terbatas atau fungsi autentikasi.
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.  
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lemari_lama/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Cek kredensial
                      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                      // Untuk menyambungkan Android emulator dengan Django pada localhost,
                      // gunakan URL http://10.0.2.2/
                      final response = await request.postJson(
                          "http://127.0.0.1:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
2. Membuat halaman login pada proyek tugas Flutter.
```dart
import 'package:lemari_lama/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
// TODO: Import halaman RegisterPage jika sudah dibuat
import 'package:lemari_lama/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF7F6269),
            primary: Color(0xFF7F6269), secondary: Color(0xFF7F6269),
          )
        ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // Cek kredensial
                      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                      // Untuk menyambungkan Android emulator dengan Django pada localhost,
                      // gunakan URL http://10.0.2.2/
                      final response = await request
                          .login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Selamat datang, $uname.")),
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Gagal'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Register',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
3. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
```dart
from django.shortcuts import render

# Create your views here.
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from django.contrib.auth import logout as auth_logout

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)

import json
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)


@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```
4. Membuat model kustom sesuai dengan proyek aplikasi Django
```dart
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    String pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int price;
    String description;
    int user;

    Fields({
        required this.name,
        required this.price,
        required this.description,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "user": user,
    };
}
```
5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lemari_lama/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
	String _description = "";
	int _price = 0;

  @override
  Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      // TODO: Tambahkan drawer yang sudah dibuat di sini
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Product Name tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
  
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        final response = await request.postJson(
                            "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode(<String, String>{
                                'name': _name,
                                'price': _price.toString(),
                                'description': _description,
                            // TODO: Sesuaikan field data sesuai dengan aplikasimu
                            }),
                        );
                        if (context.mounted) {
                            if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                content: Text("Produk baru berhasil disimpan!"),
                                ));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                );
                            } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    content:
                                        Text("Terdapat kesalahan, silakan coba lagi."),
                                ));
                            }
                        }
                    }
                },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
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
```