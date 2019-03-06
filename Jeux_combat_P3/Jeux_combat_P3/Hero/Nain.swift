//
//  Nain.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 30/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Dwarf's class from the Hero class
class Nain: Hero {
    init(name: String) {
        super.init(heroType: "Nain", lifePoint: 45, weapons: Axe(), name: name)
    }
}
