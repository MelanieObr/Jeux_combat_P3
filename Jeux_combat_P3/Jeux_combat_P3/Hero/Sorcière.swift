//
//  Sorcière.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 07/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Witch's class from the Hero class (BONUS)
class Sorciere: Hero {
    init(name: String) {
        super.init(heroType: "Sorcière", lifePoint: 60, weapons: Poison(), name: name)
    }
}
