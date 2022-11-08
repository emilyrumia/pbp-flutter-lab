# Program Flutter

> by Emily Rumia Naomi - 2106652700

## Tugas 7: *"counter_7"*  

## 💡 Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
## 💡 Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
## 💡 Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
## 💡 Jelaskan perbedaan antara const dengan final.
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

  


