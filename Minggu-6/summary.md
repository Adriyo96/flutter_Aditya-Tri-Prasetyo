Minggu - 6 Assets, Dialog Bottomsheet, & Flutter Navigation

1. Assets

Image Asset: adalah gambar yang diletakkan pada folder "assets" di dalam proyek Flutter. Untuk menampilkan gambar asset pada aplikasi, digunakan widget Image.asset(). Syarat untuk menggunakan gambar asset adalah file gambar harus diletakkan pada folder "assets" dan sudah didefinisikan di file pubspec.yaml.

Image Network: adalah gambar yang diambil dari internet dengan menggunakan URL. Widget yang digunakan untuk menampilkan gambar dari jaringan atau internet adalah Image.network(). Syarat untuk menggunakan gambar dari jaringan adalah URL gambar harus valid dan dapat diakses.

Image File: adalah gambar yang diambil dari sistem file. Widget yang digunakan untuk menampilkan gambar dari sistem file adalah Image.file(). Syarat untuk menggunakan gambar dari sistem file adalah path atau alamat file harus valid dan dapat diakses.

Google Font Lokal: adalah font yang dapat diunduh dan digunakan secara lokal di dalam aplikasi Flutter. Untuk menggunakan Google Font Lokal, kita perlu mendownload font dari Google Fonts dan meletakkannya pada folder "fonts" di dalam proyek. Syarat untuk menggunakan Google Font Lokal adalah font sudah diletakkan pada folder "fonts" dan sudah didefinisikan di file pubspec.yaml.

Google Fonts dari Dependency: adalah font yang disediakan oleh package dependency. Package dependency adalah kumpulan file yang disediakan oleh pihak ketiga dan dapat diunduh dan digunakan dalam pembuatan aplikasi Flutter. Untuk menggunakan Google Fonts dari Dependency, kita perlu menambahkan package dependency pada file pubspec.yaml dan memanggil font pada kode. Syarat untuk menggunakan Google Fonts dari Dependency adalah package sudah didefinisikan di file pubspec.yaml dan font sudah dipanggil pada kode.

2. Dialog Bottomsheet

Dialog dan BottomSheet adalah dua widget yang digunakan dalam Flutter untuk menampilkan konten yang tumpang tindih dengan konten utama.

Dialog adalah sebuah widget yang menampilkan konten pada jendela pop-up yang muncul di atas konten utama. Dialog biasanya digunakan untuk menampilkan pesan, konfirmasi atau input dari pengguna. Flutter menyediakan beberapa jenis dialog, seperti AlertDialog, SimpleDialog, dan CupertinoAlertDialog. Setiap jenis dialog memiliki tampilan dan perilaku yang berbeda-beda, sehingga Anda dapat memilih yang sesuai dengan kebutuhan aplikasi Anda.

BottomSheet adalah sebuah widget yang menampilkan konten di bagian bawah layar dan menutupi sebagian dari konten utama. BottomSheet biasanya digunakan untuk menampilkan menu, filter, atau opsi tambahan. Flutter menyediakan beberapa jenis BottomSheet, seperti PersistentBottomSheet dan ModalBottomSheet. PersistentBottomSheet adalah BottomSheet yang tetap terbuka bahkan ketika pengguna berinteraksi dengan konten utama, sedangkan ModalBottomSheet menutup saat pengguna berinteraksi dengan konten utama.

Kedua widget ini dapat disesuaikan dengan gaya dan perilaku aplikasi Anda menggunakan properti dan metode yang disediakan oleh Flutter. Anda dapat menyesuaikan ukuran, warna, font, dan animasi widget sesuai dengan kebutuhan desain aplikasi Anda.

3. Flutter Navigation

Navigation pada Flutter mengacu pada kemampuan aplikasi untuk berpindah dari satu halaman ke halaman lainnya. Ada beberapa cara untuk melakukan navigasi di Flutter, yaitu:

Navigation dengan menggunakan widget Navigator: widget ini memungkinkan pengguna untuk berpindah ke halaman lain dengan menekan tombol atau widget tertentu. Navigator menyediakan metode untuk menambahkan, menghapus atau menavigasi antar halaman.

Navigation dengan menggunakan widget TabBar: widget ini memungkinkan pengguna untuk menavigasi antar halaman dengan menekan tab. TabBar dapat digunakan untuk mengatur dan menampilkan konten pada halaman yang berbeda.

Navigation dengan menggunakan widget Drawer: widget ini memungkinkan pengguna untuk menavigasi antar halaman dengan membuka menu geser pada bagian kiri atau kanan layar. Drawer sering digunakan untuk menampilkan menu navigasi aplikasi.

Navigation dengan menggunakan widget BottomNavigationBar: widget ini memungkinkan pengguna untuk menavigasi antar halaman dengan menekan tombol navigasi pada bagian bawah layar. BottomNavigationBar sering digunakan untuk menampilkan navigasi utama aplikasi.
