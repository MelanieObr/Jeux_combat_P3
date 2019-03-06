//
//  Teams.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 21/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//



import Foundation

class Team {
    var name: String
    var heroes = [Hero]()
    
    init(name: String) {
        self.name = name
    }
    
    // METHODS
    // Method to show heroes in team with their descriptions
    func showHeroesInTeam() {
        print("\n EQUIPE \(name) :")
        for hero in heroes {
            hero.describeHero()
        }
    }
    
    // If a Character is dead, function returns true
    func isDead() -> Bool {
        var isDead = false
        for hero in heroes {
            if hero.lifePoint == 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    }
}
