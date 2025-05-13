//
//  AchievementData.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import Foundation
import SwiftUI


//var data = AchievementData(id: 1, name: "Test", description: "Test")
class Data : ObservableObject{

//struct Data{

    var listDataAchievement = [AchievementData]()
    @Published var listDataTheme = [ThemeData]()
    
    init() {
        listDataAchievement = [
            AchievementData(id: 1, name: "Perintis", description: "Kamu telah menyelesaikan tantangan pertama! Setiap pohon dimulai dari kecambah!", image: "achiev1", status: false),
            AchievementData(id: 2, name: "Silat Lidah", description: "Kamu memulai 10 obrolan dengan penuh percaya diri. Hening? Gak kenal tuh!", image: "achiev2", status: false),
            AchievementData(id: 3, name: "Petir Kilat", description: "Kamu menyelesaikan 7 tantangan berturut-turut tanpa salah langkah. Keren!", image: "achiev3", status: false),
            AchievementData(id: 4, name: "Seniman", description: "Kamu telah membuat 10 karya unik! Tanganmu bukan cuma ajaib, tapi bisa sulap ide jadi nyata", image: "achiev4", status: false),
            AchievementData(id: 5, name: "Dukun Serba Bisa", description: "kamu menyelesaikan 10 masalah dunia nyata? Semua masalah kamu punya solusinya!", image: "achiev5", status: false),
            AchievementData(id: 6, name: "Bangkit Kembali", description: "Kamu menyelesaikan tantangan setelah gagal, Pantang nyerah, makin dihantam makin jadi! ih takutnyaaat", image: "achiev6", status: false),
            AchievementData(id: 7, name: "Raja Terakhir", description: "Kamu menyelesaikan semua tantangan di semua Tema! Sempurna! tselamat! ", image: "achiev7", status: false),
            AchievementData(id: 8, name: "Petualang", description: "Kamu menyelesaikan 5 tantangan dalam 5 tema! , Kamu adalah si petualang sejati!", image: "achiev8", status: false),
            AchievementData(id: 9, name: "Penguasa Waktu", description: "Kamu menaklukkan 10 tantangan waktu. Waktu? Atur Sesuka mu!", image: "achiev9", status: false)
        ]

        listDataTheme  = [
            ThemeData(
                id: 1,
                name: "Sampah",
                category: .objek,
                description: "Tantangan-tantangan kecil tentang kesadaran lingkungan, aksi bersih, dan kreativitas dengan limbah.",
                xp: 100,
                status: .locked,
                image: "sampah",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Wawancara Sampah",
                        image: "wawancara_sampah",
                        xp: 100,
                        description: "Tanyakan kepada 3 orang bagaimana mereka memilah sampah di rumah dan catat jawabannya.",
                        caution: "Pastikan untuk meminta izin sebelum wawancara dan menghormati privasi mereka.",
                        completed: true
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Pemilah Pintar",
                        image: "pemilah_pintar",
                        xp: 100,
                        description: "Pisahkan 3 jenis sampah dari rumahmu hari ini, meski sebelumnya belum pernah dilakukan.",
                        caution: "Gunakan sarung tangan jika perlu dan cuci tangan setelah memegang sampah."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Aksi Bersih",
                        image: "aksi_bersih",
                        xp: 100,
                        description: "Bawa kantong sampah kecil dan pungut 3 sampah di tempat umum.",
                        caution: "Pastikan keamanan dan kebersihan saat mengambil sampah di area publik."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Sprint Bersih",
                        image: "sprint_bersih",
                        xp: 100,
                        description: "Main game '10 menit bersih-bersih' – harus selesai sebelum alarm bunyi.",
                        caution: "Gunakan timer, jangan terburu-buru sampai menimbulkan kecelakaan rumah tangga."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Komik Plastik",
                        image: "komik_plastik",
                        xp: 100,
                        description: "Buat komik strip 3 panel tentang petualangan sampah plastik.",
                        caution: "Gunakan alat gambar dengan aman dan simpan hasil karya dengan rapi."
                    )
                ],
                stories: StoryData(
                    imagePath: "foto_sampah_bersih",
                    storyText: "Hari ini aku dan teman-teman membersihkan taman di dekat rumah. Kami menemukan banyak plastik dan bungkus makanan. Setelah 1 jam, taman jadi jauh lebih bersih dan rapi. Rasanya puas banget!",
                    createdAt: Date()
                )
            ),
            ThemeData(
                id: 2,
                name: "Alat Musik",
                category: .objek,
                description: "Eksplorasi musik dari benda sehari-hari, aksi dadakan, dan kreativitas tanpa batas.",
                xp: 100,
                status: .locked,
                image: "alatmusik",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Tebak Nada",
                        image: "tebak_nada",
                        xp: 100,
                        description: "Kirim voice note ke teman, tiru suara alat musik pakai mulut dan suruh mereka tebak.",
                        caution: "Pastikan temanmu nyaman dengan tantangan ini dan tidak merasa terganggu."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Orkestra Dapur",
                        image: "orkestra_dapur",
                        xp: 100,
                        description: "Cari 3 benda di sekitarmu yang bisa dipukul dan bunyinya enak (versi orkes dapur!).",
                        caution: "Gunakan benda yang tidak mudah pecah atau rusak, dan jangan membahayakan diri sendiri."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Konser Dadakan",
                        image: "konser_dadakan",
                        xp: 100,
                        description: "Mainin lagu favoritmu (asal-asalan juga boleh) sambil bergaya kayak konser besar.",
                        caution: "Pastikan ruang gerak aman agar tidak cedera saat bergaya heboh."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Alarm Goyang",
                        image: "alarm_goyang",
                        xp: 100,
                        description: "Set alarm pakai ringtone musik instrumen, dan langsung goyang 1 menit waktu bangun.",
                        caution: "Perhatikan ruang sekitarmu agar tidak menabrak benda saat goyang pagi."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Lagu Sendok",
                        image: "lagu_sendok",
                        xp: 100,
                        description: "Buat lagu 10 detik tentang... sendok. Atau desain alat musik fiksi (misal: 'pianobrak' – piano yang bisa nyeduh kopi).",
                        caution: "Tidak ada risiko khusus, tapi pastikan alat gambar atau perekam digunakan dengan aman."
                    )
                ]
            ),
            ThemeData(
                id: 3,
                name: "Kamera",
                category: .objek,
                description: "Tantangan seputar kreativitas visual, ekspresi diri, dan cara melihat dunia dari lensa berbeda.",
                xp: 100,
                status: .locked,
                image: "kamera",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Teka-Teki Visual",
                        image: "teka_teki_visual",
                        xp: 100,
                        description: "Kirim satu foto 'aneh' ke 3 teman dan suruh mereka tebak ceritanya.",
                        caution: "Pastikan fotonya tidak menyinggung atau membingungkan secara negatif.",
                        completed: true
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Sulap Jepretan",
                        image: "sulap_jepretan",
                        xp: 100,
                        description: "Ambil foto objek random yang keliatannya jelek dan buat jadi 'aesthetic' lewat editan.",
                        caution: "Jangan ambil foto orang tanpa izin, terutama jika ingin mengedit atau membagikannya.",
                        completed: true
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Model Dadakan",
                        image: "model_dadakan",
                        xp: 100,
                        description: "Pose ala model iklan sabun di depan kaca dan fotoin.",
                        caution: "Pastikan ruangan aman dan pencahayaan cukup agar tidak membahayakan saat pose.",
                        completed: true
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Jepretan Kilat",
                        image: "jepretan_kilat",
                        xp: 100,
                        description: "Ambil 3 foto bagus dalam waktu 3 menit di satu ruangan, atau 5 foto dalam 5 menit dengan tema warna dominan hari ini.",
                        caution: "Perhatikan batas waktu dan jangan terlalu perfeksionis — fokus pada spontanitas."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Poster Misteri",
                        image: "poster_misteri",
                        xp: 100,
                        description: "Edit satu foto jadi seperti poster film misteri. Atau buat 'cerita 3 foto' — ambil 3 foto acak dan bikin narasi absurd.",
                        caution: "Gunakan aplikasi edit dengan bijak dan hindari konten yang bisa disalahartikan."
                    )
                ]
            ),
            ThemeData(
                id: 4,
                name: "Warung Makan",
                category: .tempat,
                description: "Nikmati suasana warung makan sambil menyelami berbagai tantangan sosial, hemat, dan kreatif yang menyenangkan.",
                xp: 100,
                status: .locked,
                image: "warkop",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Pelayan Dadakan",
                        image: "pelayan_dadakan",
                        xp: 100,
                        description: "Minta izin ke pemilik warung makan untuk menjadi pelayan dadakan dan mengantar makanan ke orang lain.",
                        caution: "Pastikan kamu sudah meminta izin ke warung dan mengantar makanan dengan hati-hati."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Budget Warung",
                        image: "budget_warung",
                        xp: 100,
                        description: "Temukan cara paling murah menikmati warung makan favoritmu dengan uang pas Rp7.000.",
                        caution: "Pastikan uang yang kamu bawa cukup, dan jangan merasa tertekan untuk membeli lebih dari yang direncanakan."

                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Koki Tamu Spesial",
                        image: "koki_tamu_spesial",
                        xp: 100,
                        description: "Menjadi koki tamu dan buat satu hidangan dari menu yang ada langsung di sebuah warung makan.",
                        caution: "Pastikan kamu sudah izin ke pemilik warung dan sudah disetujui."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Warung Ekspres",
                        image: "warung_ekspres",
                        xp: 100,
                        description: "Tantang diri untuk ngobrol, pesan, makan, dan keluar warung makan dalam 25 menit.",
                        caution: "Pastikan kamu tidak terburu-buru sehingga mengganggu kenyamanan pelanggan lain atau pelayanan."

                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Emoji Pengujung",
                        image: "emoji_pengunjung",
                        xp: 100,
                        description: "Gambar ekspresi pengunjung di warung dalam bentuk emoji di tisu.",
                        caution: "Pastikan kamu tidak mengganggu orang lain saat menggambar, dan jaga privasi orang yang digambar."
                    )
                ]
            ),
            ThemeData(
                id: 5,
                name: "Handphone",
                category: .objek,
                description: "Gunakan HP-mu bukan hanya untuk scroll, tapi sebagai alat eksplorasi komunikasi, kreativitas, dan kontrol diri.",
                xp: 100,
                status: .locked,
                image: "hp",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Soundtrack Memory",
                        image: "soundtrack_memory",
                        xp: 100,
                        description: "Kirim pesan suara ke 2 teman dekat dan 1 teman yang jarang kamu hubungi, sambil menyanyikan penggalan lagu yang paling menggambarkan hubungan kalian!",
                        caution: "Pastikan lagunya tidak menyinggung atau membuat canggung, dan kirim hanya ke orang yang kamu kenal baik."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Remote Universal",
                        image: "remote_universal",
                        xp: 100,
                        description: "Temukan dan gunakan aplikasi yang mengubah HP-mu menjadi remote TV, lalu kontrol minimal 3 saluran tanpa menyentuh remote asli!",
                        caution: "Pastikan kamu memiliki izin untuk menggunakan perangkat TV dan tidak mengganggu orang lain di rumah."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Tech Influencer",
                        image: "tech_influencer",
                        xp: 100,
                        description: "Rekam dirimu melakukan review singkat tentang fitur tersembunyi HP-mu yang jarang diketahui orang, dengan gaya presenter teknologi profesional!",
                        caution: "Pastikan informasi yang kamu sampaikan benar dan tidak membocorkan data pribadi."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Detoks Aplikasi",
                        image: "detoks_aplikasi",
                        xp: 100,
                        description: "Lacak 5 aplikasi yang paling sering kamu gunakan, pilih yang paling menghabiskan waktu, dan kurangi penggunaannya 50% hari ini sambil mencatat perubahan produktivitasmu!",
                        caution: "Gunakan fitur screen time atau digital wellbeing untuk bantu pantau tanpa stres berlebihan."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Seni Digital",
                        image: "seni_digital",
                        xp: 100,
                        description: "Edit satu foto di HP-mu dengan tema 'teknologi bertemu alam' menggunakan hanya aplikasi yang ada di HP itu sendiri!",
                        caution: "Gunakan foto pribadi atau bebas hak cipta, dan hindari overediting yang membuat HP lemot."
                    )
                ]
            ),
            ThemeData(
                id: 6,
                name: "Kamera",
                category: .objek,
                description: "Tantangan seputar kreativitas visual, ekspresi diri, dan cara melihat dunia dari lensa berbeda.",
                xp: 100,
                status: .locked,
                image: "kamera",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Teka-Teki Visual",
                        image: "teka_teki_visual",
                        xp: 100,
                        description: "Kirim satu foto 'aneh' ke 3 teman dan suruh mereka tebak ceritanya.",
                        caution: "Pastikan fotonya tidak menyinggung atau membingungkan secara negatif.",
                        completed: true
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Sulap Jepretan",
                        image: "sulap_jepretan",
                        xp: 100,
                        description: "Ambil foto objek random yang keliatannya jelek dan buat jadi 'aesthetic' lewat editan.",
                        caution: "Jangan ambil foto orang tanpa izin, terutama jika ingin mengedit atau membagikannya.",
                        completed: true
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Model Dadakan",
                        image: "model_dadakan",
                        xp: 100,
                        description: "Pose ala model iklan sabun di depan kaca dan fotoin.",
                        caution: "Pastikan ruangan aman dan pencahayaan cukup agar tidak membahayakan saat pose.",
                        completed: true
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Jepretan Kilat",
                        image: "jepretan_kilat",
                        xp: 100,
                        description: "Ambil 3 foto bagus dalam waktu 3 menit di satu ruangan, atau 5 foto dalam 5 menit dengan tema warna dominan hari ini.",
                        caution: "Perhatikan batas waktu dan jangan terlalu perfeksionis — fokus pada spontanitas."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Poster Misteri",
                        image: "poster_misteri",
                        xp: 100,
                        description: "Edit satu foto jadi seperti poster film misteri. Atau buat 'cerita 3 foto' — ambil 3 foto acak dan bikin narasi absurd.",
                        caution: "Gunakan aplikasi edit dengan bijak dan hindari konten yang bisa disalahartikan."
                    )
                ]
            ),
            ThemeData(
                id: 7,
                name: "Coffee Shop",
                category: .tempat,
                description: "Nikmati atmosfer coffee shop sambil menghadapi tantangan sosial, kreatif, dan menghibur.",
                xp: 100,
                status: .locked,
                image: "coffeshop",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Nama Samaran",
                        image: "nama_samaran",
                        xp: 100,
                        description: "Ganti nama kamu saat pesen kopi (contoh: 'Thanos'), lihat reaksi barista.",
                        caution: "Pastikan tidak mengganggu barista dengan permintaan yang terlalu aneh atau membingungkan."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Spot Nyaman",
                        image: "spot_nyaman",
                        xp: 100,
                        description: "Cari tempat duduk yang paling cozy di coffee shop dalam 3 menit.",
                        caution: "Jangan terlalu lama memilih tempat agar tidak mengganggu pelanggan lain."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Logat Unik",
                        image: "logat_unik",
                        xp: 100,
                        description: "Pesan menu pakai gaya logat yang berbeda (Sunda, Melayu, anime—bebas!).",
                        caution: "Gunakan logat dengan percaya diri, tetapi hindari logat yang bisa membuat orang merasa tidak nyaman."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Inspirasi Kilat",
                        image: "inspirasi_kilat",
                        xp: 100,
                        description: "Cuma boleh nongkrong 30 menit, tapi harus dapat 3 hal: ide, foto, dan inspirasi.",
                        caution: "Pastikan kamu tetap bisa menikmati waktu di coffee shop meski dengan batasan waktu."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Karakter Kopi",
                        image: "karakter_kopi",
                        xp: 100,
                        description: "Ciptakan karakter fiksi yang kerja di coffee shop, beri nama dan kebiasaannya.",
                        caution: "Pastikan karakter yang kamu ciptakan tetap menyenangkan dan kreatif."
                    )
                ]
            ),
            ThemeData(
                id: 8,
                name: "Mall",
                category: .tempat,
                description: "Jelajahi mall dengan berbagai tantangan yang menguji komunikasi, kreativitas, dan keterampilan manajemen waktu.",
                xp: 100,
                status: .locked,
                image: "mall",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Sapa Sopan",
                        image: "sapa_sopan",
                        xp: 100,
                        description: "Ajak ngobrol orang asing secara sopan di mall (misal: tanya arah toko).",
                        caution: "Pastikan percakapan tetap santun dan nyaman bagi kedua belah pihak."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Rute Jitu",
                        image: "rute_jitu",
                        xp: 100,
                        description: "Temukan rute tercepat dari satu titik ke titik lain di mall tanpa bertanya (atau gambarkan).",
                        caution: "Jangan terburu-buru, tetap hati-hati dan waspada saat bergerak di dalam mall."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Gaya Santai",
                        image: "gaya_santai",
                        xp: 100,
                        description: "Pergi ke mall hanya dengan menggunakan sandal jepit favorit kamu!",
                        caution: "Pastikan kamu merasa nyaman dan percaya diri meski dengan penampilan santai."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Belanja Kilat",
                        image: "belanja_kilat",
                        xp: 100,
                        description: "Tantang dirimu hanya 10 menit di satu toko stationary seperti (Oh Some! atau Gramedia) dan harus keluar tanpa beli apapun.",
                        caution: "Jaga fokus agar bisa selesai tepat waktu tanpa tergoda membeli barang yang tidak perlu."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Imajinasi Barang",
                        image: "imajinasi_barang",
                        xp: 100,
                        description: "Lakukan window-shopping di salah satu toko, pilih 3 barang dan tuliskan jika kamu membeli barang itu apa yang akan terjadi!",
                        caution: "Pastikan imajinasimu tetap menyenangkan dan sesuai dengan tema kreativitas."
                    )
                ]
            ),
            ThemeData(
                id: 9,
                name: "Dapur",
                category: .tempat,
                description: "Eksplorasi dunia kuliner di dapur dengan tantangan yang mengasah keterampilan komunikasi, kreativitas, dan manajemen waktu.",
                xp: 100,
                status: .locked,
                image: "dapur",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Cerita Masakan",
                        image: "cerita_masakan",
                        xp: 100,
                        description: "Tanyakan kepada orang rumah apa masakan favorit mereka dan kapan mereka memasak menu itu pertama kali!",
                        caution: "Pastikan percakapan berjalan santai dan mendalam agar bisa mendapatkan cerita yang menarik."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Chef Sisa",
                        image: "chef_sisa",
                        xp: 100,
                        description: "Buat makanan dari sisa-sisa bahan yang ada di dapur dan kulkas!",
                        caution: "Cek kesegaran bahan sebelum digunakan dan pastikan makanan yang dihasilkan aman untuk dikonsumsi."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Plating Konvensional",
                        image: "plating_konvensional",
                        xp: 100,
                        description: "Buat menu sederhana seperti telur atau indomie tapi plating seakan-akan kamu koki terkenal!",
                        caution: "Jangan ragu untuk mencoba plating yang kreatif meski bahan yang digunakan sederhana."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "MasterChef Rumahan",
                        image: "masterchef_rumahan",
                        xp: 100,
                        description: "Bayangkan kamu ada di Master Chef, kamu hanya punya waktu 30 menit, buat masakan apapun dengan waktu maksimal tersebut!",
                        caution: "Pastikan untuk merencanakan langkah-langkah secara efisien untuk memaksimalkan waktu yang terbatas."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Menu Unik",
                        image: "menu_unik",
                        xp: 100,
                        description: "Ciptakan nama menu baru dari 3 bahan yang kamu temukan di dapur.",
                        caution: "Gunakan kreativitasmu untuk menghasilkan nama yang unik dan menggugah selera."
                    )
                ]
            ),
            ThemeData(
                id: 10,
                name: "Minimarket",
                category: .tempat,
                description: "Temukan petualangan belanja unik di minimarket, dari mengasah komunikasi hingga kreativitas dalam kombinasi produk.",
                xp: 100,
                status: .locked,
                image: "minimarket",
                challenges: [
                    Challenge(
                        id: 1,
                        category: "Communication",
                        name: "Semangat Kasir",
                        image: "semangat_kasir",
                        xp: 100,
                        description: "Tanyakan lokasi produk tertentu, lalu berikan kalimat penyemangat yang personal dan spesifik (bukan sekadar 'semangat ya') kepada kasir yang melayanimu!",
                        caution: "Pastikan kalimat penyemangat yang kamu berikan terasa tulus dan sesuai dengan situasi."
                    ),
                    Challenge(
                        id: 2,
                        category: "Problem Solving",
                        name: "Nutrisi Perjalanan",
                        image: "nutrisi_perjalanan",
                        xp: 100,
                        description: "Temukan kombinasi makanan sehat di minimarket yang bisa bertahan 24 jam, memenuhi nutrisi lengkap, dan bisa dimakan dalam kendaraan tanpa berantakan!",
                        caution: "Pilih makanan yang mudah dimakan di perjalanan dan mempertimbangkan daya tahan serta keseimbangan nutrisinya."
                    ),
                    Challenge(
                        id: 3,
                        category: "Confidence",
                        name: "Promo Hunter",
                        image: "promo_hunter",
                        xp: 100,
                        description: "Dengan suara lantang dan percaya diri, tanyakan pada minimal 2 pegawai berbeda tentang promo tersembunyi yang tidak dipajang di depan!",
                        caution: "Gunakan bahasa yang percaya diri, tetapi tetap sopan dan tidak memaksa saat bertanya."
                    ),
                    Challenge(
                        id: 4,
                        category: "Time Management",
                        name: "Belanja Ala Ninja",
                        image: "belanja_ala_ninja",
                        xp: 100,
                        description: "Buat daftar 3 barang penting dengan lokasi spesifik di minimarket, lalu coba selesaikan belanja dalam 3 menit dengan langkah efisien (tanpa berlari)!",
                        caution: "Perhatikan efisiensi, tetapi pastikan kamu tetap tenang dan tidak terburu-buru."
                    ),
                    Challenge(
                        id: 5,
                        category: "Creativity",
                        name: "Snack Gabungan",
                        image: "snack_gabungan",
                        xp: 100,
                        description: "Buat kombinasi hidangan unik dengan menggabungkan 5 bahan berbeda dari minimarket yang sekilas tidak cocok, namun bisa menghasilkan rasa menarik!",
                        caution: "Eksperimenlah dengan rasa, tetapi pastikan kombinasi bahan yang dipilih masih aman dan enak."
                    )
                ]
            )
            
        ]
        
    }
    
    var unlockedCountAchievement: Int {
        return listDataAchievement.filter { $0.status == true }.count
    }
    
    var unlockedCountTheme: Int {
        listDataTheme.filter { $0.status != .locked }.count
    }
    
    func generateData() -> ThemeData {
        let generatedData = listDataTheme.filter { $0.status == .incomplete || $0.status == .locked}.randomElement() ?? ThemeData(id: 0, name: "Unable to load", category: .tempat, description: "Failed to generate data on DataDummy", xp: 0, status: .complete, image: "", challenges: [])
        return generatedData
    }
    
     func completeTheme(_ pickedTheme: Int) {
        listDataTheme[pickedTheme].status = .complete
    }
    
     func completeChallenge(_ pickedTheme: Int) {
        self.listDataAchievement[pickedTheme].status = true
    }
}
