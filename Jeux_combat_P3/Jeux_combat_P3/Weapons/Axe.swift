//
//  Axe.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 03/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Weapon to be used by the Axe
class Axe: Weapons {
    init() {
        super.init(weaponsName: "Hache", weaponsDamage: 20, weaponsHeal: 0)
    }
}

// Super weapon to be used by the Axe when the chest appears
class SuperAxe : Weapons {
    init() {
        super.init(weaponsName: "Super Hache Magique", weaponsDamage: 60, weaponsHeal: 0)
    }
}

