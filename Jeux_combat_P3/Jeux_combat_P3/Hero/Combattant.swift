//
//  Combattant.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 30/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Fighter's class from the Hero class

class Combattant: Hero {
    init(name: String) {
        super.init(heroType: "Combattant", lifePoint: 100, weapons: Sword(), name: name)
    }
}

