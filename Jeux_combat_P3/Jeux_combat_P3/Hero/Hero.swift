//
//  Hero.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 21/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation
// PARAMETERS HERO

class Hero {
    let heroType: String // Fighter, Magus, Colossus ...
    let name: String
    var lifePoint: Int
    let maxLifePoint: Int
    var weapons: Weapons
    
    init(heroType: String, lifePoint: Int, weapons: Weapons, name: String) {
        self.heroType = heroType
        self.lifePoint = lifePoint
        self.weapons = weapons
        self.name = name
        self.maxLifePoint = lifePoint
    }
    
    // METHODS
    // Describe Hero
    func describeHero() {
        print(" " + heroType + " " + name + " : Vie : \(lifePoint) - " + weapons.weaponsName + " (Force : \(weapons.weaponsDamage) pts)")
    }
    
    // Attack the enemy
    func attack(heroToAttack: Hero) {
        heroToAttack.lifePoint -= weapons.weaponsDamage
        heroToAttack.checkLifeHero()
    }
    
    // Control life points of hero, if it's under 0 so set it to 0
    func checkLifeHero() {
        if self.lifePoint <= 0 {
            self.lifePoint = 0
            print("\(heroType) \(self.name) est mort")
        } else {
            print("\(name) a maintenant \(lifePoint) points de vie")
        }
    }
}
