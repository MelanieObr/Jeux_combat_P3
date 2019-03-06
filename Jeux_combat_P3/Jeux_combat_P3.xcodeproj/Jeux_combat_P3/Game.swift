//
//  Game.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 02/02/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.

import Foundation

class Game {
    let teamMaker = TeamMaker() // instance of TeamMaker class
    var turnNumber = 0
    
    // Start the Game
    func start() {
        gameIntroduction()
        teamMaker.createTeams()
        resumeTeams()
        battleLoop()
        print("== C'EST LA FIN DU JEU ==")
    }
    
    // Introduction of the game
    func gameIntroduction() {
        print("\n==========  ⚔️   JEU DE COMBAT A MORT   ⚔️   =========="
        + "\n Vous allez constituer 2 équipes de 3 héros qui vont combattre à mort."
        + "\n Un coffre magique apparaîtra dans la partie et permettra à votre héro d'avoir une super arme pour un tour."
        + "\n Que le meilleur gagne !!!!")
    }
    
    // Show Team 1 composition
   func showTeamOne() {
        teamMaker.teamsArray[0].showHeroesInTeam()
    }
    
    // Show Team 2 composition
    func showTeamTwo() {
        teamMaker.teamsArray[1].showHeroesInTeam()
    }
    
    // Resume Heroes in Teams before the battle
    func resumeTeams() {
        print("\n == ⚔️ VOICI LES EQUIPES QUI VONT S'AFFRONTER ⚔️ ==")
        showTeamOne()
        showTeamTwo()
    }
    
    // Change Index 0 and 1 of teamsArray
    func changeTeams() {
        teamMaker.teamsArray.swapAt(0, 1)
    }
    
    // Player chooses a hero for the battle
    func playerSelection() -> Hero {
        var heroToPlay: Hero?
        while heroToPlay == nil {
            if let userChoice = readLine() {
                
                switch userChoice {
                case "1":
                    heroToPlay = teamMaker.teamsArray[0].heroes[0]
                case "2":
                    heroToPlay = teamMaker.teamsArray[0].heroes[1]
                case "3":
                    heroToPlay = teamMaker.teamsArray[0].heroes[2]
                default:
                    break
                }
                if let chosenHero = heroToPlay {
                    if chosenHero.lifePoint <= 0 {
                        print(" ⚠️ Vous ne pouvez pas choisir ce personnage, il est mort ! ⚰️ ")
                        heroToPlay = nil // The player can't select a character without life point
                    }
                }
            }
        }
        return heroToPlay!
    }
    
    // A chest appears, Hero gets a new weapon
    func randomChest(for hero: Hero) {
        let randomChest = Int(arc4random_uniform(6))
        if randomChest == 3 { // The chest appears in the game if number 3 comes out
            print("\n== 🔑 VOICI LE COFFRE MAGIQUE ! 🔑 ==")
            switch hero {
            case is Combattant:
                hero.weapons = SuperSword()
            case is Mage:
                hero.weapons = SuperScepter()
            case is Colosse:
                hero.weapons = SuperMace()
            case is Nain:
                hero.weapons = SuperAxe()
            case is Sorciere:
                hero.weapons = SuperPoison()
           
            default:
                break
            }
            hero.weapons.describeNewWeapon(of: hero)
        }
    }
    
    // Character can't get the special chest weapon two times
    func chestAppearsTwice(to myHero: Hero) -> Bool {
        switch myHero.weapons {
        case is SuperSword, is SuperScepter, is SuperMace, is SuperAxe, is SuperPoison:
            changeWeapon(of: myHero)
            return true
        default:
            return false
        }
    }
    
    // If chest appears a second time for the same character, he recovers his basic weapon
    func changeWeapon(of hero: Hero) {
        print("\n Vous avez déja eu la super arme du coffre magique, vous récupérez votre ancienne arme !")
        switch hero {
        case is Combattant:
            hero.weapons = Sword()
        case is Mage:
            hero.weapons = Scepter()
        case is Colosse:
            hero.weapons = Mace()
        case is Nain:
            hero.weapons = Axe()
        case is Sorciere:
            hero.weapons = Poison()
        
        default:
            break
        }
        hero.weapons.describeNewWeapon(of: hero)
    }
    // Loop for the Battle
    func battleLoop() {
        print("\n== ⚔️ LE COMBAT A MORT COMMENCE !!!! ⚔️ ==")
        repeat {
            showTeamOne()
            print("\n Choisisez un personnage de votre équipe (saisir 1, 2 ou 3) ")
            let myHero = playerSelection() // First team selects hero to play (enter number 1, 2 or 3)
            if chestAppearsTwice(to: myHero) == false {
                randomChest(for: myHero) // If the chest appears when selecting hero, he gets a new weapon
            }
            if let mage = myHero as? Mage { // If the chosen Hero is Magus, he heals someone from his team
                showTeamOne()
                print("\n Choisissez le personnage à soigner dans votre équipe (saisir 1, 2 ou 3) 💊 ")
                let heroToHeal = playerSelection() // Player chooses hero to heal in his team
                mage.heal(heroToHeal: heroToHeal)
                changeTeams()
            } else {  // Else, if the chosen hero is not Magus, attack the enemy
                showTeamTwo()
                print("\n Choisissez votre adversaire (saisir 1, 2 ou 3) ⚔️ ! ")
                changeTeams()
                let heroToAttack = playerSelection() // Player chooses hero for attack on enemy team
                myHero.attack(heroToAttack: heroToAttack)
                turnNumber += 1
                print("nombre de tours : \(turnNumber)")
            }
        } while endOfGame() // repeat while it's still a hero alive on a team
    }
    
    // Check if all heroes on a team are dead
    func endOfGame() -> Bool {
        let teamIsDead = false
        for i in 0..<teamMaker.teamsArray.count {
            let team1 = teamMaker.teamsArray[i]
            let team2 = teamMaker.teamsArray[i+1]
            if team1.isDead() {   // If all heroes on the first team are dead, game ends and team 2 wins
                winnerMessage(teamName: team2.name)
                return teamIsDead == true
            } else if team2.isDead() { // Else if all heroes on the second team are dead, game ends and team 1 wins
                winnerMessage(teamName: team1.name)
                return teamIsDead == true
            } else { // Else game continues
                return teamIsDead == false
            }
        }
        return teamIsDead
    }
    
    // Message for winner's team at the end of the game
    func winnerMessage(teamName: String) {
        print("\n Bravo à l'équipe \(teamName) qui a gagné 🏆")
    }
}
