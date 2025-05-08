//
//  AchievementData.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import Foundation

struct AchievementData {
    var id : Int
    var name : String
    var description : String
    var image : String
    var status : Bool
}

struct Challenge {
    var id: Int
    var description: String
    var caution : String
    var xp : Int
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
    var status: themeStatus
    var image : String
    var challenges : [Challenge] = []
    
    var themeDescription: String {
        switch category {
        case .objek:
            return "Cari atau gunakan\nlalu temukan fitur rahasia yang orang lain gak tau"
        case .tempat:
            return "Kunjungi dan jelajahi\nlalu temukan misi tersembunyinya"
        case .orang:
            return "Jalin ikatan dengan Ksatria lainnya\n"
        }
    }
}

//var data = AchievementData(id: 1, name: "Test", description: "Test")
struct Data{
    var listDataAchievement = [AchievementData]()
    var listDataTheme = [ThemeData]()
    var shuffleCount: Int = 3
    
    init() {
         listDataAchievement = [
            AchievementData(id: 1, name: "Achiev 1", description: "You Have successfully get achiement 1", image: "achiev1", status: true),
            AchievementData(id: 2, name: "Achiev 2", description: "You Have successfully get achiement 2", image: "achiev2", status: true),
            AchievementData(id: 3, name: "Achiev 3", description: "You Have successfully get achiement 3", image: "achiev3", status: true),
            AchievementData(id: 4, name: "Achiev 4", description: "You Have successfully get achiement 4", image: "achiev4", status: true),
            AchievementData(id: 5, name: "Achiev 5", description: "You Have successfully get achiement 5", image: "achiev1", status: true),
            AchievementData(id: 6, name: "Achiev 6", description: "You Have successfully get achiement 6", image: "", status: false),
            AchievementData(id: 7, name: "Achiev 7", description: "You Have successfully get achiement 7", image: "", status: false),
            AchievementData(id: 8, name: "Achiev 8", description: "You Have successfully get achiement 8", image: "", status: false),
            AchievementData(id: 9, name: "Achiev 9", description: "You Have successfully get achiement 9", image: "", status: false)
        ]


        listDataTheme  = [
            ThemeData(id: 1, name: "Cermin", category: .objek, status: .complete, image: "alatmusik"),
            ThemeData(id: 1, name: "Alat Musik", category: .objek, status: .complete, image: "alatmusik"),
            ThemeData(id: 2, name: "Ayah", category: .orang, status: .complete, image: "ayah"),
            ThemeData(id: 3, name: "Botol Plastik", category: .objek, status: .complete, image: "botol"),
            ThemeData(id: 4, name: "Gym", category: .tempat, status: .incomplete, image: "gym"),
            ThemeData(id: 5, name: "Ibu", category: .orang, status: .incomplete, image: "ibu"),
            ThemeData(id: 6, name: "Kendaraan", category: .objek, status: .incomplete, image: "kendaraan"),
            ThemeData(id: 7, name: "Pasar", category: .tempat, status: .incomplete, image: "pasar"),
            ThemeData(id: 8, name: "Sampah", category: .objek, status: .incomplete, image: "sampah"),
            ThemeData(id: 9, name: "Warkop", category: .tempat, status: .complete, image: "warkop"),
            ThemeData(id: 10, name: "Theme 10",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 11, name: "Theme 11",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 12, name: "Theme 12",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 13, name: "Theme 13",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 14, name: "Theme 14",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 15, name: "Theme 15",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 16, name: "Theme 16",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 17, name: "Theme 17",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 18, name: "Theme 18",category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 19, name: "Theme 19", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 20, name: "Theme 20", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 21, name: "Theme 21", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 22, name: "Theme 22", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 23, name: "Theme 23", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 24, name: "Theme 24", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 25, name: "Theme 25", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 26, name: "Theme 26", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 27, name: "Theme 27", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 28, name: "Theme 28", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 29, name: "Theme 29", category: .objek, status: .locked, image: "locked"),
            ThemeData(id: 30, name: "Theme 30", category: .objek, status: .locked, image: "locked")
        ]
    }
    
    var unlockedCountAchievement: Int {
        return listDataAchievement.filter { $0.status == true }.count
    }
    
    var unlockedCountTheme: Int {
        return listDataTheme.filter { $0.status == .complete || $0.status == .incomplete}.count
    }
    
    func generateData() -> ThemeData {
        let generatedData = listDataTheme.randomElement() ?? ThemeData(id: 1, name: "market", category: .tempat, status: .complete, image: "market")
        return generatedData
    }
    
    mutating func decrementShuffleCount() {
        if shuffleCount > -1 {
            shuffleCount -= 1
        }
    }
}
