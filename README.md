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



