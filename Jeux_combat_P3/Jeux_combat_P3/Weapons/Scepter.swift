//
//  Scepter.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 03/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Weapon to be used by the Magus
class Scepter: Weapons {
    init() {
        super.init(weaponsName: "Sceptre", weaponsDamage: 0, weaponsHeal: 10)
    }
}

// Super weapon to be used by the Magus when the chest appears
class SuperScepter : Weapons {
    init() {
        super.init(weaponsName: "Super Sceptre Magique", weaponsDamage: 0, weaponsHeal: 40)
    }
}
