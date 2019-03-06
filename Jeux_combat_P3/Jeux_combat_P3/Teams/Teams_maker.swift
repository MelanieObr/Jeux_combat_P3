//
//  CheckName.swift
//  Jeux_combat_P3
//
//  Created by Mélanie Obringer on 29/01/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import Foundation

class TeamMaker {
   
    var teamsArray = [Team]()
    var heroesName = [String]()
    var teamName = ""
    
    // METHODS
    // Create two teams
    func createTeams () {
        for n in 0..<2 {
            print("\n 👉 Joueur \(n + 1)")
            if let team = createTeam() {
                teamsArray.append(team) // Add created team in teamsArray
                team.showHeroesInTeam() // Show descriptions of the 3 heroes of a team
            }
        }
    }
    
    // create a team
    private func createTeam() -> Team? {
        let team = Team(name: uniqueName(isTeamName: true))
        if let heroes = createHeroes() {
            team.heroes = heroes
        }
        return team
    }
    
    // Player enters unique name for his team
    private func createTeamName() {
        teamName = uniqueName(isTeamName: true)
    }
    
    // Add and check unique name for Team or Heroes
    private func uniqueName(isTeamName: Bool) -> String {
        var heroName = ""
        repeat {
            if isTeamName {
                print("👉 Indiquez le nom de votre équipe :")
            } else {
                print("👉 Indiquez le nom de votre personnage :")
            }
            if let data = readLine() {
               heroName = data
                if heroesName.contains(heroName) {
                    print("⛔️ Ce nom est déjà utilisé ! ⛔️")
                    heroName = ""
                } else {
                    heroesName.append(heroName)
                }
            }
        } while heroName == ""
        return heroName
    }
   
    // Menu display
    private func menuListOfHero() {
        print("\n =========================================="
            + "\n Ajoutez 3 personnages à votre équipe :"
            + "\n1. Combattant- Vie: 100   - Force : 10 pts"
            + "\n2. Mage      - Vie:  60   - Soin  : 10 pts"
            + "\n3. Colosse   - Vie: 130   - Force :  5 pts"
            + "\n4. Nain      - Vie:  45   - Force : 20 pts"
            + "\n5. Sorcière  - Vie:  60   - Force : 15 pts"
            + "\n =========================================="
            + "\n Sélectionnez un nombre entre 1 et 5 :")
    }
    
    private func createHero() -> Hero? {
        var userChoice = 0
        menuListOfHero() // Show list to compose a team
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 && userChoice != 5
    let uniqueName = self.uniqueName(isTeamName: false) // Add hero's name and check if it is unique in game
        switch userChoice {
        case 1:
            let combattant = Combattant(name: uniqueName)
            print("✅ Le combattant nommé \(combattant.name) est ajouté !")
            return Combattant(name: uniqueName)
        case 2:
            let mage = Mage(name: uniqueName)
            print("✅ Le mage nommé \(mage.name) est ajouté !")
            return Mage(name: uniqueName)
        case 3:
            let colosse = Colosse(name: uniqueName)
            print("✅ Le colosse nommé \(colosse.name) est ajouté !")
            return Colosse(name: uniqueName)
        case 4:
            let nain = Nain(name: uniqueName)
            print("✅ Le nain nommé \(nain.name) est ajouté !")
            return Nain(name: uniqueName)
        case 5:
            let sorciere = Sorciere(name: uniqueName)
            print("✅ La sorcière nommée \(sorciere.name) est ajoutée !")
            return Sorciere(name: uniqueName)
        default:
            return nil
        }
    }
    
    // Create 3 heroes and add it to the array
    private func createHeroes() -> [Hero]? {
        var heroes = [Hero]()
        for _ in 0..<3 {
            if let hero = createHero() {
                heroes.append(hero)
            }
        }
        return heroes
    }
}
