# lemari lama

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