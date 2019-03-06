//
//  Sword.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 03/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation

// Weapon to be used by the fighter's
class Sword: Weapons {
    init() {
        super.init(weaponsName: "Epée", weaponsDamage: 10, weaponsHeal: 0)
    }
}

// Super weapon to be used by the fighter's when the chest appears
class SuperSword : Weapons {
    init() {
        super.init(weaponsName: "Super Epée Magique", weaponsDamage: 30, weaponsHeal: 0)
  }
}
