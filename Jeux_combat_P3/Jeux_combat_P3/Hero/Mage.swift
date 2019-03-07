//
//  Mage.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 30/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// Magus's class from the Hero class
class Mage: Hero {
    init(name: String) {
        super.init(heroType: "Mage", lifePoint: 60, weapons: Scepter(), name: name)
    }
    
    // METHODS
    // Method for Magus when he heals someone from his team. Hero's life points can't be more than his max life points
    func heal(heroToHeal: Hero) {
        heroToHeal.lifePoint += weapons.weaponsHeal
        if heroToHeal.lifePoint >= heroToHeal.maxLifePoint {
            heroToHeal.lifePoint = heroToHeal.maxLifePoint
        }
        print("\(heroToHeal.heroType) \(heroToHeal.name) est soigné et a maintenant \(heroToHeal.lifePoint) points de vie")
        
    }
    
    // Describe Magus Hero
    override func describeHero() {
        print(" " + heroType + " " + name + " : Vie : \(lifePoint) - " + weapons.weaponsName + " (Soin : \(weapons.weaponsHeal) pts)")
    }
    
}
