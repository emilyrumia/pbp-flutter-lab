# Program Flutter

> by Emily Rumia Naomi - 2106652700

<details>
<summary>Tugas 7</summary>

## Tugas 7: *"counter_7"*  

## 💡 Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless Widget adalah widget statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal. Widget ini tidak dapat diubah dan tidak akan pernah berubah. Contoh stateless widget adalah Icon, IconButton, dan Text.

Stateful Widget adalah  sifatnya adalah dinamis, sehingga widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data. Stateful widget dapat mengubah atau mengupdate tampilan, menambah widget laiinya, mengubah nilai variabel, icon, warna dan masih banyak lagi. Contoh stateful widget adalah Checkbox,  Radio, Form, dan TextField.

## 💡 Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `AppBar`, salah satu bagian yang umumnya digunakan pada sebuah aplikasi sebagai menu petunjuk untuk memudahkan pengguna aplikasi. Menyediakan Properti `title` untuk judul
2. `Center`, memposisikan widget child di tengah
3. `Column`, memposisikan widget chlidren secara vertikal
4. `FloatingActionButton`, seperti button yang ketika di click menjalan suatu fungsi
5. `Text`, menampilkan sebuah string 
6. `Positioned`, mengatur posisi child widget 
7. `Stack`, menampilkan widget child secara bertumpuk 
8. `Visibility`, mengatur visibility widget child
9. `Icon`, graphical icon widget

## 💡 Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() memberitahu flutter framework bahwa ada yang berubah pada State, setelah itu akan melakukan build ulang untuk merubah value pada variabel tersebut. Fungsi ini merencanakan suatu pembaruan ke suatu state objek komponen. Ketika state berubah, komponen merespons dengan me-render ulang. 

Variabel yang terdampak dengan fungsi tersebut dalah variabel yang berubah jika fungsi tersebut dijalankan/dipanggil. Pada tugas ini, variabel _counter yang terdampak yaitu bertambah satu satuan saat fungsi _incrementCounter() dipanggil dan berkurang satu satuan jika _counter lebih dari 0 saat fungsi _decrementCounter() dipanggil.

## 💡 Jelaskan perbedaan antara const dengan final.
Final (variabel yang menggunakan keyword final) diinialisasi pada saat pertama kali digunakan dan hanya disetel sekali. Dengan kata lain nilai final akan diketahui pada saat run-time. final dapat digunakan untuk deklarasi variabel immutable yang `nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan`.

Const dapat digunakan untuk deklarasi variabel immutable yang `nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi (Compile time) berjalan`, artinya adalah nilai dari variabel tersebut harus sudah di berikan value secara langsung.

## 💡 Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- [x] Membuat sebuah program Flutter baru dengan nama counter_7.<br>
-> Generate proyek Flutter dan masuk ke dalam direktori proyek.<br>
   ```shell
   flutter create counter_7
   cd counter_7
   ```
  -> Jalankan proyek melalui Terminal atau Command Prompt.
     ```shell
     flutter run
     ```
- [x] Mengubah tampilan program menjadi seperti berikut.<br>
  -> Buka file lib/main.dart dengan IDE dan menambahkan kode berikut untuk membuat dua button `-` di bottom-left dan `+` di bottom-right:
   ```shell
   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
   floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                tooltip: 'Decrement',
                onPressed: () {},
                child: const Icon(
                  Icons.remove,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                tooltip: 'Increment',
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          ],
        )
   ```
- [x] Mengimplementasikan logika berikut pada program.
  - [x] Tombol + menambahkan angka sebanyak satu satuan. <br>
  -> Membuat fungsi untuk melakukan logika increment:
    ```shell
    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }
    ```
    -> Menambahkan kode berikut pada button `+` untuk menjalankan fungsi tersebut ketika di pencet:
    ```shell
    onPressed: _incrementCounter,
    ```
  - [x] Tombol - mengurangi angka sebanyak satu satuan. <br>
  -> Membuat fungsi untuk melakukan logika decrement:
    ```shell
    void _decrementCounter() {
      setState(() {
        _counter--;
      });
    }
    ```
    -> Menambahkan kode berikut pada button `-` untuk menjalankan fungsi tersebut ketika di pencet:
    ```shell
    onPressed: _decrementCounter,
    ```
  - [x] Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.<br>
  -> Menambahkan kodisi if pada fungsi logika decrement, sehingga kode menjadi berikut:
    ```shell
    void _decrementCounter() {
      setState(() {
        if (_counter > 0) {
          _counter--;
        }
      });
    }
    ```
  - [x] Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.<br>
  -> Pada class `Widget` tambahkan variabel bool untuk membedakan apakah counter ganjil atau genap
     ```shell
     bool check = _counter % 2 == 0;
     ``` 
    -> Menambahkan kodisi jika check = true, maka counter genap sehingga Text menjadi sebagai berikut:
       ```shell
       check
       ? const Text(
         'GENAP',
          style: TextStyle(color: Colors.red),
       )
      : (kondisi false)
      ```
  - [x] Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.<br>
  -> Lengkapi kode untuk handle kondisi jika check = false, maka counter ganjil sehingga Text menjadi sebagai berikut:
     ```shell
     ... (kondisi true) ...
     : const Text(
      'GANJIL',
       style: TextStyle(color: Colors.blue),
     ),
     ```
  - [x] Angka 0 dianggap sebagai angka genap.<br>
  -> `_counter % 2 == 0` sudah memastikan bahwa 0 dianggap sebagai angka genap

</details>

<details>
<summary>Tugas 8</summary>

## Tugas 8: *" budget tracking app"*  

## 💡 Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
`Navigator.push` adalah metode yang menampilkan halaman baru di atas halaman sebelumnya (ditimpa). Berbeda dengan `Navigator.pushReplacement` yang mengantikan halaman sebelumnya dengan halaman baru. 

## 💡 Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `AppBar`, salah satu bagian yang umumnya digunakan pada sebuah aplikasi sebagai menu petunjuk untuk memudahkan pengguna aplikasi. Menyediakan Properti `title` untuk judul
2. `Center`, memposisikan widget child di tengah
3. `Column`, memposisikan widget chlidren secara vertikal
4. `Drawer`, panel untuk navigasi
5. `Text`, menampilkan sebuah string 
6. `TextFormField`, input form berupa string
7. `Stack`, menampilkan widget child secara bertumpuk 
8. `Form`, membuat form
9. `Icon`, graphical icon widget
10. `IconButton`, membuat button dengan bentuk sebuah icon
11. `DropdownButton`, input dengan pilihan
12. `Expanded`, mengisi widget child di space yang masih kosong
13. `TextButton`, button dengan sebuah tulisan
14. `Card`, membuat layout card

## 💡 Sebutkan jenis-jenis event yang ada pada Flutter
1. onPressed(), execute suatu fungsi ketika mengklik sebuah button
2. onTap(), execute suatu fungsi ketika mengklik sebuah widget satu kali
3. onChanged(), execute suatu fungsi ketika merubah suatu value pada sebuah widget
4. onSaved(), execute suatu fungsi ketika menyimpan sebuah form

## 💡 Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Logic navigasi pada flutter bekerja seperti sebuah stack. Stack tersebut juga menyimpan data, bedanya data yang disimpan berupa halaman. Data pada top of stack adalah halaman yang muncul kepada pengguna. Metode push akan menjalankan logic mengganti halaman dengan menambahkan halaman baru pada top of stack sehingga halaman sebelumnya ditimpa (Navigator.push) atau digantikan (Navigator.pushReplacement) dan halaman baru tersebut yang muncul di layar pengguna. Metode pop kebalikannya akan top of stack dan menampilkan halaman sebelumnya kepada pengguna.

## 💡 Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Membuka folder aplikasi flutter `counter_7` pada tugas 7
- Membuat file `drawer.dart` untuk membuat widget drawer sebagai navigasi antar halaman program counter, tambah budget, dan data budget.
- Membuat file `budget.dart` untuk membuat class `Budget` yang akan menyimpan attribut-attribut dari object `Budget` dan menyimpan semua object `Budget` pada list static `listBudget`.
- Membuat file`form.dart` untuk membuat form yang menerima input `_judul` berupa string dengan widget TextFormField, input `_nominal` berupa integer dengan widget TextFormField yang nantinya dari string akan di parse menjadi int, dan input `_tipe` berupa stirng dengan widget DropdownButton sehingga terdapat pilihan dari list string yang berisi Pemasukan dan Pengeluaran. Setelah itu, terdapat tombol dengan event `onPressed()` untuk menyimpan form dan membuat object `Budget` serta menambahkan object pada `listBudget` dengan widget TextButton.
- Membuat file `data.dart` untuk menampilkan semua object yang ada di `listBudget`. Jika tidak ada object maka akan menampilkan tulisan "Tidak ada budget!". Jika ada, maka object akan ditampilkan dengan layout card menggunakan widget card.
</details>

<details>
<summary>Tugas 9</summary>

## Tugas 9: *"mywatchlist"*

## 💡 Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya, Kita tetap bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Sehingga, data tersebut akan di simpan pada suatu variable tanpa dikonversi menjadi data dalam sebuah model. Namun, sebaiknya model dibuat terlebih dahulu agar menyimpan data lebih terstruktur pada List yang bertipe class model tersebut.

## 💡 Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `AppBar`, salah satu bagian yang umumnya digunakan pada sebuah aplikasi sebagai menu petunjuk untuk memudahkan pengguna aplikasi. Menyediakan Properti `title` untuk judul
2. `Center`, memposisikan widget child di tengah
3. `Column`, memposisikan widget chlidren secara vertikal
4. `Drawer`, panel untuk navigasi
5. `Text`, menampilkan sebuah string 
6. `TextFormField`, input form berupa string
7. `Stack`, menampilkan widget child secara bertumpuk 
8. `Form`, membuat form
9. `Icon`, graphical icon widget
10. `IconButton`, membuat button dengan bentuk sebuah icon
11. `DropdownButton`, input dengan pilihan
12. `Expanded`, mengisi widget child di space yang masih kosong
13. `TextButton`, button dengan sebuah tulisan
14. `Card`, membuat layout card

## 💡 Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Dengan package http HTTP request dapat dijalankan dan dengan perlu ditambahkan kode untuk mengatur dependensi HTTP. Data akan di fetch dengan API endpoint yang nantinya di-decode menjadi data berbentuk JSON. Setelah proses http tersebut selesai, data yang sudah berbentuk JSON tersebut akan dikonversi menjadi data dalam bentuk sebuah model dan dimasukan ke dalam list yang bertipe class model tersebut agar nantinya dapat ditampilkan pada aplikasi Flutter dengan  listview.builder untuk merender setiap widget.
 
## 💡 Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Membuka folder aplikasi flutter `counter_7` pada tugas 7
- Membuka file `drawer.dart` untuk menambahkan pada widget drawer navigasi ke halaman `My Watch List`
- Membuat file `movie.dart` untuk membuat class `Movie` yang akan menyimpan attribut-attribut dari object `Movie` berdasarkan json heroku pada tugas 3 
- Menambahkan Dependensi HTTP
  - Menjalankan `flutter pub add http`
  - Menambahkan kode berikut pada file `android/app/src/main/AndroidManifest.xml`
    ```shell
    ...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
    ...
    ```
- Membuat file `fetch_mywatchlist.dart` untuk mengambil dan mengolah data dari Web Service, yaitu dari URL https://appkatalog.herokuapp.com/mywatchlist/json/
- Membuat file`mywatchlist.dart` untuk halaman menampilkan judul-judul dari semua object `Movie` yang di dapat dari file `fetch_mywatchlist.dart` dan menambahkan button untuk melihat detail setiap film. Jika tidak ada object maka akan menampilkan tulisan "Kamu tidak punya watchlist :(". Jika ada, maka object akan ditampilkan dengan layout card menggunakan widget card.
- Membuat file `detail.dart` untuk menampilkan detail setiap filmnya yang diklik dengan button. 
</details>
