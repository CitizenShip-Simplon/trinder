//
//  alex.swift
//  Trinder
//
//  Created by alexandre rodriguez on 11/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import Foundation

import UIKit

// liste type dechét l'utilsateur doit en choisir un
let typeOfDechet = ["alimentaire", "emballage", "verre", "non triable", "médicaux", "textile", "électronique", "mobilier", "electromenager"]

// choix de l'utilisateur
var userChoice:String = ""

 détermeine l'image lier au choix de l'utilisateur
switch userChoice {
case userChoice == "alimentaire":
    print("afficher sans emballage  = poubelle marron")
case userChoice == "emballage":
    print("afficher poubelle jaune")
case userChoice == "verre":
    print("afficher poubelle blanche")
case userChoice == "non triable":
    print("afficher poubelle verte")
case userChoice == "médicaux":
    print("afficher pharmacie")
case userChoice == "textile":
    print("afficher container textile")
case userChoice == "électronique":
    print(" recyclerie + message MULTIPLE)
case userChoice == "mobiler":
    print(" recyclerie + message MULTIPLE)
case userChoice == "electroménager":
    print(" recyclerie + message MULTIPLE)
default:
    break
}



//switch userChoice {
//case userChoice == "alimentaire":
//    print("afficher sans emballage  = poubelle marron")
//case userChoice == "emballage":
//    print("afficher poubelle jaune")
//case userChoice == "verre":
//    print("afficher poubelle blanche")
//case userChoice == "non triable":
//    print("afficher poubelle verte")
//case userChoice == "médicaux":
//    print("afficher pharmacie")
//case userChoice == "textile":
//    print("afficher container textile")
//case userChoice == "électronique":
//    print(" recyclerie + message MULTIPLE)
//case userChoice == "mobiler":
//    print(" recyclerie + message MULTIPLE)
//case userChoice == "electroménager":
//    print(" recyclerie + message MULTIPLE)
//default:
//    break
//}

//func evaluateChoice( choice: String){
   //ternaire= choice == typeOfDechet.last ?? showImage(choice) : showTripleChoice()
//}

//func showImage(image : String){
    //to do afficher image
//}

//func showTripleChoice(){
    
//}


let whiteTrash = ["verre"]
let greenTrash = ["non triable"]
let brownTrash = ["alimentaire"] // attention sans emballage
let repair = ["électronique", "mobilier", "electomenager"] // si sa fonctionne : let give = ["électronique", "mobilier", "electomenager"]
let pharmacie = ["médicaux"]
let textileContainer = ["textile"]
//let yellowTrash = ["carton", "plastique", "metal", "papier"]


//
//let recyclerie = ["many"]

//let tryToGive = ["High Tech", "electromenager", "textile"]
//let repair = ["électromanger", "meuble"]
//

// idée de phrase pop up instructive

// 6 briques de lait recycler permet de fabiquer 1 rouleau de papier toilette
// 9 bouteilles en plastique transparent recycler permet de fabiquer 1 tee-shirt
// 8 boîtes de conserve recycler permet de fabiquer 1 casserole
// 250 canettes recycler permet de fabiquer 1 cadre de vélo
// 1 tonne de verre recycler permet de fabriquer 2 138 bouteilles de 75 cl
// 100 kG de déchets alimentaires recycler permet de fabiquer 30 kilos de compostet 6,5 litres de biocarburan

// conteneurs textiles: Votre penderie déborde ? Plus de 300 conteneurs textiles sont à votre disposition à Paris. Les textiles, linges et chaussures déposés sont triés pour être réemployés, ou recyclés.

// recycleries et ressourceries: Donner, vendre, réparer, détourner : le réemploi solidaire des objets usagés (jouets, électroménager, matériel informatique...) offre de nombreux avantages ! Avec plus de 10 recycleries ou ressourceries à Paris, il y a forcément une structure près de chez vous pour donner une seconde vie à vos objets.
// produits dangereux : Appeler la circonscription fonctionnelle au 01 43 61 57 36 ou le 39 75*
// espace tri (déchèterie): En plus des déchets accueillis sur les Points tri et Trimobiles, vous pouvez apporter dans ces grandes déchèteries vos gravats, mobiliers et gros électroménagers.

// point tri: Ces petites déchèteries de proximité accueillent les cartons, verre, textiles, petits appareils électroménagers, lampes, radiographies, piles et cartouches d’encre...
// trimobile: Ces déchèteries mobiles, installées temporairement et à fréquence régulière sur l’espace public, collectent au plus près de chez vous les déchets occasionnels tels que : piles, cartouches, petits appareils électroménagers, grands cartons, matériel informatique, peinture, solvants,...


