# Program Flutter

> by Emily Rumia Naomi - 2106652700

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

  


