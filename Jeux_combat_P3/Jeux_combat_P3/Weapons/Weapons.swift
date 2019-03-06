//
//  Weapons.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 21/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// PARAMETERS WEAPONS

class Weapons {
    let weaponsName: String
    let weaponsDamage: Int
    let weaponsHeal: Int
    
    
    init(weaponsName: String, weaponsDamage: Int, weaponsHeal: Int) {
        self.weaponsName = weaponsName
        self.weaponsDamage = weaponsDamage
        self.weaponsHeal = weaponsHeal
        
    }
// METHOD
// Method to describe new weapon when the chest appears
func describeNewWeapon(of hero: Hero) {
    switch hero {
    case is Mage:
        print("vous avez une nouvelle arme : " + weaponsName + " (Soin : \(weaponsHeal) pts)")
    case is Colosse, is Combattant, is Nain, is Sorciere :
        print("vous avez une nouvelle arme : " + weaponsName + " (Force : \(weaponsDamage) pts)")
    default:
        break
    }
}
} 
