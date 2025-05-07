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
    
    init(id: Int, name: String, description: String, image : String, status: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.status = status
    }
}

struct Challenge {
    var id: Int
    var description: String
}

struct ThemeData {
    var id : Int
    var name : String
    var description : String
    var caution : String
    var xp : Int
    var status : String
    var image : String
    var challenges : [Challenge] = []
    
    init(id: Int, name: String, description: String, caution: String, xp: Int, status: String, image: String) {
        self.id = id
        self.name = name
        self.description = description
        self.caution = caution
        self.xp = xp
        self.status = status
        self.image = image
    }
}

//var data = AchievementData(id: 1, name: "Test", description: "Test")
struct Data{
    var listDataAchievement = [AchievementData]()
    var listDataTheme = [ThemeData]()
    var shuffleCount: Int = 2
    
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
            ThemeData(id: 1, name: "Alat Musik", description: "Theme 1 description", caution: "Caution 1", xp: 100, status: "complete", image: "alatmusik"),
            ThemeData(id: 2, name: "Ayah", description: "Theme 2 description", caution: "Caution 2", xp: 200, status: "complete", image: "ayah"),
            ThemeData(id: 3, name: "Botol Plastik", description: "Theme 3 description", caution: "Caution 3", xp: 300, status: "incomplete", image: "botol"),
            ThemeData(id: 4, name: "Gym", description: "Theme 4 description", caution: "Caution 4", xp: 400, status: "incomplete", image: "gym"),
            ThemeData(id: 5, name: "Ibu", description: "Theme 5 description", caution: "Caution 5", xp: 500, status: "complete", image: "ibu"),
            ThemeData(id: 6, name: "Kendaraan", description: "Theme 6 description", caution: "Caution 6", xp: 600, status: "complete", image: "kendaraan"),
            ThemeData(id: 7, name: "Pasar", description: "Theme 7 description", caution: "Caution 7", xp: 700, status: "commplete", image: "pasar"),
            ThemeData(id: 8, name: "Sampah", description: "Theme 8 description", caution: "Caution 8", xp: 800, status: "incomplete", image: "sampah"),
            ThemeData(id: 9, name: "Warkop", description: "Theme 9 description", caution: "Caution 9", xp: 900, status: "complete", image: "warkop"),
            ThemeData(id: 10, name: "Theme 10", description: "Theme 10 description", caution: "Caution 10", xp: 1000, status: "locked", image: ""),
            ThemeData(id: 11, name: "Theme 11", description: "Theme 11 description", caution: "Caution 11", xp: 1100, status: "locked", image: ""),
            ThemeData(id: 12, name: "Theme 12", description: "Theme 12 description", caution: "Caution 12", xp: 1200, status: "locked", image: ""),
            ThemeData(id: 13, name: "Theme 13", description: "Theme 13 description", caution: "Caution 13", xp: 1300, status: "locked", image: ""),
            ThemeData(id: 14, name: "Theme 14", description: "Theme 14 description", caution: "Caution 14", xp: 1400, status: "locked", image: ""),
            ThemeData(id: 15, name: "Theme 15", description: "Theme 15 description", caution: "Caution 15", xp: 1500, status: "locked", image: ""),
            ThemeData(id: 16, name: "Theme 16", description: "Theme 16 description", caution: "Caution 16", xp: 1600, status: "locked", image: ""),
            ThemeData(id: 17, name: "Theme 17", description: "Theme 17 description", caution: "Caution 17", xp: 1700, status: "locked", image: ""),
            ThemeData(id: 18, name: "Theme 18", description: "Theme 18 description", caution: "Caution 18", xp: 1800, status: "locked", image: ""),
            ThemeData(id: 19, name: "Theme 19", description: "Theme 19 description", caution: "Caution 19", xp: 1900, status: "locked", image: ""),
            ThemeData(id: 20, name: "Theme 20", description: "Theme 20 description", caution: "Caution 20", xp: 2000, status: "locked", image: ""),
            ThemeData(id: 21, name: "Theme 21", description: "Theme 21 description", caution: "Caution 21", xp: 2100, status: "locked", image: ""),
            ThemeData(id: 22, name: "Theme 22", description: "Theme 22 description", caution: "Caution 22", xp: 2200, status: "locked", image: ""),
            ThemeData(id: 23, name: "Theme 23", description: "Theme 23 description", caution: "Caution 23", xp: 2300, status: "locked", image: ""),
            ThemeData(id: 24, name: "Theme 24", description: "Theme 24 description", caution: "Caution 24", xp: 2400, status: "locked", image: ""),
            ThemeData(id: 25, name: "Theme 25", description: "Theme 25 description", caution: "Caution 25", xp: 2500, status: "locked", image: ""),
            ThemeData(id: 26, name: "Theme 26", description: "Theme 26 description", caution: "Caution 26", xp: 2600, status: "locked", image: ""),
            ThemeData(id: 27, name: "Theme 27", description: "Theme 27 description", caution: "Caution 27", xp: 2700, status: "locked", image: ""),
            ThemeData(id: 28, name: "Theme 28", description: "Theme 28 description", caution: "Caution 28", xp: 2800, status: "locked", image: ""),
            ThemeData(id: 29, name: "Theme 29", description: "Theme 29 description", caution: "Caution 29", xp: 2900, status: "locked", image: ""),
            ThemeData(id: 30, name: "Theme 30", description: "Theme 30 description", caution: "Caution 30", xp: 3000, status: "locked", image: "")
        ]


    }
    
    var unlockedCountAchievement: Int {
        return listDataAchievement.filter { $0.status == true }.count
    }
    
    var unlockedCountTheme: Int {
        return listDataTheme.filter { $0.status == "complete" || $0.status == "incomplete"}.count
    }
    
    func generateData() -> ThemeData {
        let generatedData = listDataTheme.randomElement() ?? ThemeData(id: 1, name: "Theme 1", description: "Theme 1 description", caution: "Caution 1", xp: 100, status: "complete", image: "market")
//        print(generatedData)
        return generatedData
    }
    
    mutating func decrementShuffleCount() {
        if shuffleCount > -1 {
            shuffleCount -= 1
        }
    }
    
    
}
