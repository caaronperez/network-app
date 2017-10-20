//
//  Person.swift
//  contact-app
//
//  Created by MCS Devices on 10/17/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class People: NSObject {
    
    var birth: Int, eyecolor: String, gender: String, haircolor: String, height: Float, homeworld: String, mass: Float, name: String, skincolor: String, specie: Specie?;
    
    init(birth: Int, eyecolor: String, gender: String, haircolor: String, height: Float, homeworld: String, mass: Float, name: String, skincolor: String, specie: Specie?){
        self.birth = birth
        self.eyecolor = eyecolor
        self.gender = gender
        self.haircolor = haircolor
        self.height = height
        self.homeworld = homeworld
        self.mass = mass
        self.name = name
        self.skincolor = skincolor
        self.specie = specie
    }
    
}


enum Specie : String {
    case Hutt = "Hutt"
    case Yoda = "Yoda's species"
    case Trandoshan = "Trandoshan"
    case MonCalamari = "Mon Calamari"
    case Ewok = "Ewok"
    case Sullustan = "Sullustan"
    case Neimodian = "Neimodian"
    case Gungan = "Gungan"
    case Toydarian = "Toydarian"
    case Dug = "Dug"
    case Twilek = "Twi\'lek"
    case Aleena = "Aleena"
    case Vulptereen = "Vulptereen"
    case Xexto = "Xexto"
    case Toong = "Toong"
    case Cerean = "Cerean"
    case Nautolan = "Nautolan"
    case Zabrak = "Zabrak"
    case Tholothian = "Tholothian"
    case Iktotchi = "Iktotchi"
    case Quermian = "Quermian"
    case KelDor = "Kel Dor"
    case Chagrian = "Chagrian"
    case Geonosian = "Geonosian"
    case Mirialan = "Mirialan"
    case Clawdite = "Clawdite"
    case Besalisk = "Besalisk"
    case Kaminoan = "Kaminoan"
    case Skakoan = "Skakoan"
    case Muun = "Muun"
    case Togruta = "Togruta"
    case Kaleesh = "Kaleesh"
    case Pauan = "Pau'an"
    case Wookiee = "Wookiee"
    case Droid = "Droid"
    case Human = "Human"
    case Rodian = "Rodian"
    
    static let count: Int = {
        var max: String = ""
        var counter = 0
        while let _ = Specie(rawValue: max) { counter += 1 }
        return counter
    }()
}

