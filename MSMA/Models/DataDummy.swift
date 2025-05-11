//
//  AchievementData.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var path = NavigationPath()
    @Published var currentRoute: Route = .main
    @Published var currentTab: Tab = .home
}

// Tab routing
enum Tab {
    case home, profile
}

enum Route {
    case home
    case main
    case profile
}

struct AchievementData {
    var id : Int
    var name : String
    var description : String
    var image : String
    var status : Bool
}

struct Challenge {
    var category: String
    var name: String
    var image: String
    var xp: Int
    var description: String
    var caution: String
}

struct StoryData {
    var id: UUID = UUID()
    var imagePath: String
    var storyText: String
    var createdAt: Date = Date()
}

struct ThemeData {
    enum categories : String {
        case objek
        case tempat
        case orang
    }
    enum themeStatus: String {
        case complete
        case incomplete
        case locked
    }
    var id : Int
    var name : String
    var category: categories
    var description: String
    var xp: Int
    var status: themeStatus
    var image : String
    var challenges : [Challenge]
    var stories : StoryData?
}

//var data = AchievementData(id: 1, name: "Test", description: "Test")
class Data : ObservableObject{
    var listDataAchievement = [AchievementData]()
    @Published var listDataTheme = [ThemeData]()
    
    init() {
        listDataAchievement = [
            AchievementData(id: 1, name: "Perintis", description: "Kamu telah menyelesaikan tantangan pertama! Setiap pohon dimulai dari kecambah!", image: "achiev1", status: true),
            AchievementData(id: 2, name: "Silat Lidah", description: "Kamu memulai 10 obrolan dengan penuh percaya diri. Hening? Gak kenal tuh!", image: "achiev2", status: true),
            AchievementData(id: 3, name: "Petir Kilat", description: "Kamu menyelesaikan 7 tantangan berturut-turut tanpa salah langkah. Keren!", image: "achiev3", status: false),
            AchievementData(id: 4, name: "Seniman", description: "Kamu telah membuat 10 karya unik! Tanganmu bukan cuma ajaib, tapi bisa sulap ide jadi nyata", image: "achiev4", status: true),
            AchievementData(id: 5, name: "Dukun Serba Bisa", description: "kamu menyelesaikan 10 masalah dunia nyata? Semua masalah kamu punya solusinya!", image: "achiev5", status: true),
            AchievementData(id: 6, name: "Bangkit Kembali", description: "Kamu menyelesaikan tantangan setelah gagal, Pantang nyerah, makin dihantam makin jadi! ih takutnyaaat", image: "achiev6", status: true),
            AchievementData(id: 7, name: "Raja Terakhir", description: "Kamu menyelesaikan semua tantangan di semua Tema! Sempurna! tselamat! ", image: "achiev7", status: false),
            AchievementData(id: 8, name: "Petualang", description: "Kamu menyelesaikan 5 tantangan dalam 5 tema! , Kamu adalah si petualang sejati!", image: "achiev8", status: true),
            AchievementData(id: 9, name: "Penguasa Waktu", description: "Kamu menaklukkan 10 tantangan waktu. Waktu? Atur Sesuka mu!", image: "achiev9", status: false)
        ]

        listDataTheme  = [
            ThemeData(
                id: 1,
                name: "Sampah",
                category: .objek,
                description: "Tantangan-tantangan kecil tentang kesadaran lingkungan, aksi bersih, dan kreativitas dengan limbah.",
                xp: 100,
                status: .complete,
                image: "sampah",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Wawancara Sampah",
                        image: "wawancara_sampah",
                        xp: 20,
                        description: "Tanyakan kepada 3 orang bagaimana mereka memilah sampah di rumah dan catat jawabannya.",
                        caution: "Pastikan untuk meminta izin sebelum wawancara dan menghormati privasi mereka."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Pemilah Pintar",
                        image: "pemilah_pintar",
                        xp: 20,
                        description: "Pisahkan 3 jenis sampah dari rumahmu hari ini, meski sebelumnya belum pernah dilakukan.",
                        caution: "Gunakan sarung tangan jika perlu dan cuci tangan setelah memegang sampah."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Aksi Bersih",
                        image: "aksi_bersih",
                        xp: 20,
                        description: "Bawa kantong sampah kecil dan pungut 3 sampah di tempat umum.",
                        caution: "Pastikan keamanan dan kebersihan saat mengambil sampah di area publik."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Sprint Bersih",
                        image: "sprint_bersih",
                        xp: 20,
                        description: "Main game '10 menit bersih-bersih' – harus selesai sebelum alarm bunyi.",
                        caution: "Gunakan timer, jangan terburu-buru sampai menimbulkan kecelakaan rumah tangga."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Komik Plastik",
                        image: "komik_plastik",
                        xp: 20,
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
                status: .complete,
                image: "alatmusik",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Tebak Nada",
                        image: "tebak_nada",
                        xp: 20,
                        description: "Kirim voice note ke teman, tiru suara alat musik pakai mulut dan suruh mereka tebak.",
                        caution: "Pastikan temanmu nyaman dengan tantangan ini dan tidak merasa terganggu."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Orkestra Dapur",
                        image: "orkestra_dapur",
                        xp: 20,
                        description: "Cari 3 benda di sekitarmu yang bisa dipukul dan bunyinya enak (versi orkes dapur!).",
                        caution: "Gunakan benda yang tidak mudah pecah atau rusak, dan jangan membahayakan diri sendiri."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Konser Dadakan",
                        image: "konser_dadakan",
                        xp: 20,
                        description: "Mainin lagu favoritmu (asal-asalan juga boleh) sambil bergaya kayak konser besar.",
                        caution: "Pastikan ruang gerak aman agar tidak cedera saat bergaya heboh."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Alarm Goyang",
                        image: "alarm_goyang",
                        xp: 20,
                        description: "Set alarm pakai ringtone musik instrumen, dan langsung goyang 1 menit waktu bangun.",
                        caution: "Perhatikan ruang sekitarmu agar tidak menabrak benda saat goyang pagi."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Lagu Sendok",
                        image: "lagu_sendok",
                        xp: 20,
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
                status: .incomplete,
                image: "kamera",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Teka-Teki Visual",
                        image: "teka_teki_visual",
                        xp: 20,
                        description: "Kirim satu foto 'aneh' ke 3 teman dan suruh mereka tebak ceritanya.",
                        caution: "Pastikan fotonya tidak menyinggung atau membingungkan secara negatif."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Sulap Jepretan",
                        image: "sulap_jepretan",
                        xp: 20,
                        description: "Ambil foto objek random yang keliatannya jelek dan buat jadi 'aesthetic' lewat editan.",
                        caution: "Jangan ambil foto orang tanpa izin, terutama jika ingin mengedit atau membagikannya."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Model Dadakan",
                        image: "model_dadakan",
                        xp: 20,
                        description: "Pose ala model iklan sabun di depan kaca dan fotoin.",
                        caution: "Pastikan ruangan aman dan pencahayaan cukup agar tidak membahayakan saat pose."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Jepretan Kilat",
                        image: "jepretan_kilat",
                        xp: 20,
                        description: "Ambil 3 foto bagus dalam waktu 3 menit di satu ruangan, atau 5 foto dalam 5 menit dengan tema warna dominan hari ini.",
                        caution: "Perhatikan batas waktu dan jangan terlalu perfeksionis — fokus pada spontanitas."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Poster Misteri",
                        image: "poster_misteri",
                        xp: 20,
                        description: "Edit satu foto jadi seperti poster film misteri. Atau buat 'cerita 3 foto' — ambil 3 foto acak dan bikin narasi absurd.",
                        caution: "Gunakan aplikasi edit dengan bijak dan hindari konten yang bisa disalahartikan."
                    )
                ]
            ),
            ThemeData(
                id: 4,
                name: "Foto",
                category: .objek,
                description: "Eksplorasi cerita dan kreativitas melalui foto-foto lama dan baru yang ada di perangkatmu.",
                xp: 100,
                status: .locked,
                image: "foto",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Caption Seru",
                        image: "caption_seru",
                        xp: 20,
                        description: "Kirim 1 foto lama ke grup keluarga dan minta semua kasih caption lucu. Atau tunjukkan foto lawas ke teman dan minta mereka tulis caption fiksi tentang momen itu.",
                        caution: "Pastikan foto yang dibagikan tidak sensitif atau membuat tidak nyaman orang lain."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Tebak Potongan",
                        image: "tebak_potongan",
                        xp: 20,
                        description: "Crop bagian aneh dari satu foto dan tantang teman untuk menebak itu apa.",
                        caution: "Gunakan foto pribadi atau bebas hak cipta agar tidak melanggar privasi."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Wallpaper Berani",
                        image: "wallpaper_berani",
                        xp: 20,
                        description: "Jadikan foto awkward kamu sebagai wallpaper HP untuk sehari. Atau post foto random di IG Story.",
                        caution: "Pastikan nyaman secara pribadi, dan hindari mem-posting foto yang bisa disalahartikan."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Bersih Galeri",
                        image: "bersih_galeri",
                        xp: 20,
                        description: "Bersih-bersih galeri HP selama 7 menit dan buang foto blur atau duplikat.",
                        caution: "Pastikan kamu tidak menghapus foto penting tanpa backup terlebih dahulu."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Cover Majalah",
                        image: "cover_majalah",
                        xp: 20,
                        description: "Edit satu foto jadi cover majalah palsu (contoh: People’s Blurry Photo of the Year), atau buat iklan palsu dari 3 foto acak (misal: 'Minuman rahasia pelupa masa lalu!').",
                        caution: "Gunakan kreativitasmu tanpa menyertakan wajah orang lain tanpa izin."
                    )
                ]
            ),
            ThemeData(
                id: 5,
                name: "Handphone",
                category: .objek,
                description: "Gunakan HP-mu bukan hanya untuk scroll, tapi sebagai alat eksplorasi komunikasi, kreativitas, dan kontrol diri.",
                xp: 100,
                status: .complete,
                image: "hp",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Soundtrack Memory",
                        image: "soundtrack_memory",
                        xp: 20,
                        description: "Kirim pesan suara ke 2 teman dekat dan 1 teman yang jarang kamu hubungi, sambil menyanyikan penggalan lagu yang paling menggambarkan hubungan kalian!",
                        caution: "Pastikan lagunya tidak menyinggung atau membuat canggung, dan kirim hanya ke orang yang kamu kenal baik."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Remote Universal",
                        image: "remote_universal",
                        xp: 20,
                        description: "Temukan dan gunakan aplikasi yang mengubah HP-mu menjadi remote TV, lalu kontrol minimal 3 saluran tanpa menyentuh remote asli!",
                        caution: "Pastikan kamu memiliki izin untuk menggunakan perangkat TV dan tidak mengganggu orang lain di rumah."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Tech Influencer",
                        image: "tech_influencer",
                        xp: 20,
                        description: "Rekam dirimu melakukan review singkat tentang fitur tersembunyi HP-mu yang jarang diketahui orang, dengan gaya presenter teknologi profesional!",
                        caution: "Pastikan informasi yang kamu sampaikan benar dan tidak membocorkan data pribadi."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Detoks Aplikasi",
                        image: "detoks_aplikasi",
                        xp: 20,
                        description: "Lacak 5 aplikasi yang paling sering kamu gunakan, pilih yang paling menghabiskan waktu, dan kurangi penggunaannya 50% hari ini sambil mencatat perubahan produktivitasmu!",
                        caution: "Gunakan fitur screen time atau digital wellbeing untuk bantu pantau tanpa stres berlebihan."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Seni Digital",
                        image: "seni_digital",
                        xp: 20,
                        description: "Edit satu foto di HP-mu dengan tema 'teknologi bertemu alam' menggunakan hanya aplikasi yang ada di HP itu sendiri!",
                        caution: "Gunakan foto pribadi atau bebas hak cipta, dan hindari overediting yang membuat HP lemot."
                    )
                ]
            ),
            ThemeData(
                id: 6,
                name: "Warkop",
                category: .tempat,
                description: "Nikmati suasana warkop sambil menyelami berbagai tantangan sosial, hemat, dan kreatif yang menyenangkan.",
                xp: 100,
                status: .complete,
                image: "warkop",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Saran Random",
                        image: "saran_random",
                        xp: 20,
                        description: "Minta rekomendasi menu dari pengunjung random.",
                        caution: "Hati-hati dengan orang yang terlalu sibuk atau tidak nyaman dengan percakapan tak terduga."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Budget Warkop",
                        image: "budget_warkop",
                        xp: 20,
                        description: "Temukan cara paling murah menikmati warkop favoritmu dengan uang pas Rp7.000.",
                        caution: "Pastikan uang yang kamu bawa cukup, dan jangan merasa tertekan untuk membeli lebih dari yang direncanakan."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Barista Dadakan",
                        image: "barista_dadakan",
                        xp: 20,
                        description: "Minta ijin menyeduh kopi sendiri di balik meja warkop.",
                        caution: "Jaga sopan santun saat meminta izin, dan pastikan tidak mengganggu proses kerja barista yang ada."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Warkop Ekspres",
                        image: "warkop_ekspres",
                        xp: 20,
                        description: "Tantang diri untuk ngobrol, pesan, makan, dan keluar warkop dalam 25 menit.",
                        caution: "Pastikan kamu tidak terburu-buru sehingga mengganggu kenyamanan pelanggan lain atau pelayanan."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Emoji Pengujung",
                        image: "emoji_pengunjung",
                        xp: 20,
                        description: "Gambar ekspresi pengunjung di warkop dalam bentuk emoji di tisu.",
                        caution: "Pastikan kamu tidak mengganggu orang lain saat menggambar, dan jaga privasi orang yang digambar."
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
                        category: "Communication",
                        name: "Nama Samaran",
                        image: "nama_samaran",
                        xp: 20,
                        description: "Ganti nama kamu saat pesen kopi (contoh: 'Thanos'), lihat reaksi barista.",
                        caution: "Pastikan tidak mengganggu barista dengan permintaan yang terlalu aneh atau membingungkan."
                    ),
                    Challenge(
                        category: "Communication",
                        name: "Ngobrol dengan 3 Kata Ajaib",
                        image: "ngobrol_3_kata_ajaib",
                        xp: 20,
                        description: "Bikin tantangan: ngobrol sama barista pakai 3 kata ajaib yang kamu pilih sendiri.",
                        caution: "Hati-hati agar percakapan tetap menyenangkan dan tidak mengganggu alur kerja barista."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Spot Nyaman",
                        image: "spot_nyaman",
                        xp: 20,
                        description: "Cari tempat duduk yang paling cozy di coffee shop dalam 3 menit.",
                        caution: "Jangan terlalu lama memilih tempat agar tidak mengganggu pelanggan lain."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Logat Unik",
                        image: "logat_unik",
                        xp: 20,
                        description: "Pesan menu pakai gaya logat yang berbeda (Sunda, Melayu, anime—bebas!).",
                        caution: "Gunakan logat dengan percaya diri, tetapi hindari logat yang bisa membuat orang merasa tidak nyaman."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Inspirasi Kilat",
                        image: "inspirasi_kilat",
                        xp: 20,
                        description: "Cuma boleh nongkrong 30 menit, tapi harus dapat 3 hal: ide, foto, dan inspirasi.",
                        caution: "Pastikan kamu tetap bisa menikmati waktu di coffee shop meski dengan batasan waktu."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Karakter Kopi",
                        image: "karakter_kopi",
                        xp: 20,
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
                status: .complete,
                image: "mall",
                challenges: [
                    Challenge(
                        category: "Communication",
                        name: "Sapa Sopan",
                        image: "sapa_sopan",
                        xp: 20,
                        description: "Ajak ngobrol orang asing secara sopan di mall (misal: tanya arah toko).",
                        caution: "Pastikan percakapan tetap santun dan nyaman bagi kedua belah pihak."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Rute Jitu",
                        image: "rute_jitu",
                        xp: 20,
                        description: "Temukan rute tercepat dari satu titik ke titik lain di mall tanpa bertanya (atau gambarkan).",
                        caution: "Jangan terburu-buru, tetap hati-hati dan waspada saat bergerak di dalam mall."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Gaya Santai",
                        image: "gaya_santai",
                        xp: 20,
                        description: "Pergi ke mall hanya dengan menggunakan sandal jepit favorit kamu!",
                        caution: "Pastikan kamu merasa nyaman dan percaya diri meski dengan penampilan santai."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Belanja Kilat",
                        image: "belanja_kilat",
                        xp: 20,
                        description: "Tantang dirimu hanya 10 menit di satu toko stationary seperti (Oh Some! atau Gramedia) dan harus keluar tanpa beli apapun.",
                        caution: "Jaga fokus agar bisa selesai tepat waktu tanpa tergoda membeli barang yang tidak perlu."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Imajinasi Barang",
                        image: "imajinasi_barang",
                        xp: 20,
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
                        category: "Communication",
                        name: "Cerita Masakan",
                        image: "cerita_masakan",
                        xp: 20,
                        description: "Tanyakan kepada orang rumah apa masakan favorit mereka dan kapan mereka memasak menu itu pertama kali!",
                        caution: "Pastikan percakapan berjalan santai dan mendalam agar bisa mendapatkan cerita yang menarik."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Chef Sisa",
                        image: "chef_sisa",
                        xp: 20,
                        description: "Buat makanan dari sisa-sisa bahan yang ada di dapur dan kulkas!",
                        caution: "Cek kesegaran bahan sebelum digunakan dan pastikan makanan yang dihasilkan aman untuk dikonsumsi."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Plating Konvensional",
                        image: "plating_konvensional",
                        xp: 20,
                        description: "Buat menu sederhana seperti telur atau indomie tapi plating seakan-akan kamu koki terkenal!",
                        caution: "Jangan ragu untuk mencoba plating yang kreatif meski bahan yang digunakan sederhana."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "MasterChef Rumahan",
                        image: "masterchef_rumahan",
                        xp: 20,
                        description: "Bayangkan kamu ada di Master Chef, kamu hanya punya waktu 30 menit, buat masakan apapun dengan waktu maksimal tersebut!",
                        caution: "Pastikan untuk merencanakan langkah-langkah secara efisien untuk memaksimalkan waktu yang terbatas."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Menu Unik",
                        image: "menu_unik",
                        xp: 20,
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
                        category: "Communication",
                        name: "Semangat Kasir",
                        image: "semangat_kasir",
                        xp: 20,
                        description: "Tanyakan lokasi produk tertentu, lalu berikan kalimat penyemangat yang personal dan spesifik (bukan sekadar 'semangat ya') kepada kasir yang melayanimu!",
                        caution: "Pastikan kalimat penyemangat yang kamu berikan terasa tulus dan sesuai dengan situasi."
                    ),
                    Challenge(
                        category: "Problem Solving",
                        name: "Nutrisi Perjalanan",
                        image: "nutrisi_perjalanan",
                        xp: 20,
                        description: "Temukan kombinasi makanan sehat di minimarket yang bisa bertahan 24 jam, memenuhi nutrisi lengkap, dan bisa dimakan dalam kendaraan tanpa berantakan!",
                        caution: "Pilih makanan yang mudah dimakan di perjalanan dan mempertimbangkan daya tahan serta keseimbangan nutrisinya."
                    ),
                    Challenge(
                        category: "Confidence",
                        name: "Promo Hunter",
                        image: "promo_hunter",
                        xp: 20,
                        description: "Dengan suara lantang dan percaya diri, tanyakan pada minimal 2 pegawai berbeda tentang promo tersembunyi yang tidak dipajang di depan!",
                        caution: "Gunakan bahasa yang percaya diri, tetapi tetap sopan dan tidak memaksa saat bertanya."
                    ),
                    Challenge(
                        category: "Time Management",
                        name: "Belanja Ala Ninja",
                        image: "belanja_ala_ninja",
                        xp: 20,
                        description: "Buat daftar 3 barang penting dengan lokasi spesifik di minimarket, lalu coba selesaikan belanja dalam 3 menit dengan langkah efisien (tanpa berlari)!",
                        caution: "Perhatikan efisiensi, tetapi pastikan kamu tetap tenang dan tidak terburu-buru."
                    ),
                    Challenge(
                        category: "Creativity",
                        name: "Snack Gabungan",
                        image: "snack_gabungan",
                        xp: 20,
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
    
//    var unlockedCountTheme: Int {
//        return listDataTheme.filter { $0.status == .complete || $0.status == .complete}.count
//    }
    var unlockedCountTheme: Int {
        listDataTheme.filter { $0.status != .locked }.count
    }
    
    func generateData() -> ThemeData {
        let generatedData = listDataTheme.filter { $0.status == .incomplete || $0.status == .locked}.randomElement() ?? ThemeData(id: 0, name: "Unable to load", category: .tempat, description: "Failed to generate data on DataDummy", xp: 0, status: .complete, image: "", challenges: [])
        return generatedData
    }
    
    func completeTheme(_ pickedTheme: Int) {
        self.listDataTheme[pickedTheme].status = .complete
    }
    
    func completeChallenge(_ pickedTheme: Int) {
        self.listDataAchievement[pickedTheme].status = true
    }
    
    
    
}



//        listDataTheme  = [
//            ThemeData(id: 1, name: "Alat Musik", description: "Theme 1 description", caution: "Caution 1", xp: 100, status: .complete, image: "alatmusik"),
//            ThemeData(id: 2, name: "Ayah", description: "Theme 2 description", caution: "Caution 2", xp: 200, status: .complete, image: "ayah"),
//            ThemeData(id: 3, name: "Botol Plastik", description: "Theme 3 description", caution: "Caution 3", xp: 300, status: .complete, image: "botol"),
//            ThemeData(id: 4, name: "Gym", description: "Theme 4 description", caution: "Caution 4", xp: 400, status: .complete, image: "gym"),
//            ThemeData(id: 5, name: "Ibu", description: "Theme 5 description", caution: "Caution 5", xp: 500, status: .complete, image: "ibu"),
//            ThemeData(id: 6, name: "Kendaraan", description: "Theme 6 description", caution: "Caution 6", xp: 600, status: .complete, image: "kendaraan"),
//            ThemeData(id: 7, name: "Pasar", description: "Theme 7 description", caution: "Caution 7", xp: 700, status: .complete, image: "pasar"),
//            ThemeData(id: 8, name: "Sampah", description: "Theme 8 description", caution: "Caution 8", xp: 800, status: .complete, image: "sampah"),
//            ThemeData(id: 9, name: "Warkop", description: "Theme 9 description", caution: "Caution 9", xp: 900, status: .complete, image: "warkop"),
//            ThemeData(id: 10, name: "Theme 10", description: "Theme 10 description", caution: "Caution 10", xp: 1000, status: .locked, image: "locked"),
//            ThemeData(id: 11, name: "Theme 11", description: "Theme 11 description", caution: "Caution 11", xp: 1100, status: .locked, image: "locked"),
//            ThemeData(id: 12, name: "Theme 12", description: "Theme 12 description", caution: "Caution 12", xp: 1200, status: .locked, image: "locked"),
//            ThemeData(id: 13, name: "Theme 13", description: "Theme 13 description", caution: "Caution 13", xp: 1300, status: .locked, image: "locked"),
//            ThemeData(id: 14, name: "Theme 14", description: "Theme 14 description", caution: "Caution 14", xp: 1400, status: .locked, image: "locked"),
//            ThemeData(id: 15, name: "Theme 15", description: "Theme 15 description", caution: "Caution 15", xp: 1500, status: .locked, image: "locked"),
//            ThemeData(id: 16, name: "Theme 16", description: "Theme 16 description", caution: "Caution 16", xp: 1600, status: .locked, image: "locked"),
//            ThemeData(id: 17, name: "Theme 17", description: "Theme 17 description", caution: "Caution 17", xp: 1700, status: .locked, image: "locked"),
//            ThemeData(id: 18, name: "Theme 18", description: "Theme 18 description", caution: "Caution 18", xp: 1800, status: .locked, image: "locked"),
//            ThemeData(id: 19, name: "Theme 19", description: "Theme 19 description", caution: "Caution 19", xp: 1900, status: .locked, image: "locked"),
//            ThemeData(id: 20, name: "Theme 20", description: "Theme 20 description", caution: "Caution 20", xp: 2000, status: .locked, image: "locked"),
//            ThemeData(id: 21, name: "Theme 21", description: "Theme 21 description", caution: "Caution 21", xp: 2100, status: .locked, image: "locked"),
//            ThemeData(id: 22, name: "Theme 22", description: "Theme 22 description", caution: "Caution 22", xp: 2200, status: .locked, image: "locked"),
//            ThemeData(id: 23, name: "Theme 23", description: "Theme 23 description", caution: "Caution 23", xp: 2300, status: .locked, image: "locked"),
//            ThemeData(id: 24, name: "Theme 24", description: "Theme 24 description", caution: "Caution 24", xp: 2400, status: .locked, image: "locked"),
//            ThemeData(id: 25, name: "Theme 25", description: "Theme 25 description", caution: "Caution 25", xp: 2500, status: .locked, image: "locked"),
//            ThemeData(id: 26, name: "Theme 26", description: "Theme 26 description", caution: "Caution 26", xp: 2600, status: .locked, image: "locked"),
//            ThemeData(id: 27, name: "Theme 27", description: "Theme 27 description", caution: "Caution 27", xp: 2700, status: .locked, image: "locked"),
//            ThemeData(id: 28, name: "Theme 28", description: "Theme 28 description", caution: "Caution 28", xp: 2800, status: .locked, image: "locked"),
//            ThemeData(id: 29, name: "Theme 29", description: "Theme 29 description", caution: "Caution 29", xp: 2900, status: .locked, image: "locked"),
//            ThemeData(id: 30, name: "Theme 30", description: "Theme 30 description", caution: "Caution 30", xp: 3000, status: .locked, image: "locked")
//        ]
