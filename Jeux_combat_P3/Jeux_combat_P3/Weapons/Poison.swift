//
//  Poison.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 07/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation

// Weapon to be used by the witch (BONUS)
class Poison: Weapons {
    init() {
        super.init(weaponsName: "Poison", weaponsDamage: 15, weaponsHeal: 0)
    }
}

// Super weapon to be used by the witch when the chest appears
class SuperPoison : Weapons {
    init() {
        super.init(weaponsName: "Super Poison Magique", weaponsDamage: 45, weaponsHeal: 0)
    }
}

