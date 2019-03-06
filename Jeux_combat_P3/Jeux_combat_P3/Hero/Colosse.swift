//
//  Colosse.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 30/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Colossus's class from the Hero class
class Colosse: Hero {
    init(name: String) {
        super.init(heroType: "Colosse", lifePoint: 130, weapons: Mace(), name: name)
   }
}
