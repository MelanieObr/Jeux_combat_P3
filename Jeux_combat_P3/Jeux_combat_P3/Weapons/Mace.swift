//
//  Mace.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 03/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation

// Weapon to be used by the colossus
class Mace: Weapons {
    init() {
        super.init(weaponsName: "Massue", weaponsDamage: 5, weaponsHeal: 0)
    }
}

// Super weapon to be used by the colossus when the chest appears
class SuperMace : Weapons {
    init() {
        super.init(weaponsName: "Super Massue Magique", weaponsDamage: 15, weaponsHeal: 0)
    }
}

