//
//  GameControllerView.swift
//  Trinder
//
//  Created by alexandre rodriguez on 13/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class GameControllerView: UIViewController{
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dechetImageView: UIImageView!
    @IBOutlet weak var leftTrashButton: UIButton!
    @IBOutlet weak var rightTrashButton: UIButton!
    
    var score = 0
    //structure poubelle: image couleur poubelle
    struct Poubelle {
        let image:UIImage
        
        init(image:UIImage) {
            self.image = image
        }
    }
    // structuree dechet -> image des poubelle good answer
    struct Dechet{
        let poubelle:Poubelle// poubelle.image - image de bonne poubelle
        let image:UIImage  // image des déchets
        
        // inialisation
        init(typeDechet:Poubelle, image:UIImage) {
            self.image = image
            self.poubelle = typeDechet
        }
    }
    
    // création de tableau
    var dechets = [Dechet]()
    var poubelleImages = [Poubelle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ajout des images dans le tableau
        getData()// création des 4 poubelless et leur images et la liste des déchets avec leur image et leurs bonne réponses
        generateQuestion()
        scoreLabel.text = "\(score)"
    }
    
    func generateQuestion() {
        // reset les actions sur le boutons
        leftTrashButton.removeTarget(nil, action: nil, for: .allEvents)
        rightTrashButton.removeTarget(nil, action: nil, for: .allEvents)
        let number = Int.random(in: 0...1)
        if number == 1 { //  1 = bonne réponse à gauche
            showAnswer(rightAnswerButton: leftTrashButton, wrongAnswerButton: rightTrashButton)
        } else { // 0 = bonne réponse à droite
            showAnswer(rightAnswerButton: rightTrashButton, wrongAnswerButton: leftTrashButton)
        }
    }
    
    func showAnswer(rightAnswerButton: UIButton, wrongAnswerButton: UIButton){
           //genere un nombre random = max dechets.randomElement()
           let dechet = dechets.randomElement()
           dechetImageView.image = dechet?.image
           //genere l'image du dechet
           dechetImageView.image = dechet?.image
           //genere l'image du bouton gauche en normal (afficher)
           rightAnswerButton.setImage(dechet?.poubelle.image, for: .normal)
           // permet d'eviter le chanegemnt de couleur de la poubelle quand elle est cliqué
           rightAnswerButton.setImage(dechet?.poubelle.image, for: .highlighted)
           //genere l'image du bouton gauche en normal (afficher)
           wrongAnswerButton.setImage(generateWrongAnswer(rightAnswer: (dechet?.poubelle.image)!).image, for: .normal)
           // permet d'eviter le chanegemnt de couleur de la poubelle quand elle est cliqué
           wrongAnswerButton.setImage(generateWrongAnswer(rightAnswer: (dechet?.poubelle.image)!).image, for: .highlighted)
           // addTarget = donne une action au bouton = la fonction rightAnswerClicked est lancé = boutton presser
           rightAnswerButton.addTarget(self, action: #selector (rightAnswerClicked), for: .touchUpInside)
           wrongAnswerButton.addTarget(self, action: #selector (wrongAnswerClicked), for: .touchUpInside)
       }
    
    // permet de générer la mauvaise poubelle -> function récursive elle s'appelle elle meme
    func generateWrongAnswer(rightAnswer : UIImage) -> Poubelle{
        var wrongAnswer = poubelleImages.randomElement()// donne moi une poubelle au hasard
        while rightAnswer.isEqual(wrongAnswer?.image){ // tant que les poubelle sont d
            wrongAnswer = generateWrongAnswer(rightAnswer: rightAnswer)
        }
        return wrongAnswer!
    }
       
       @objc func rightAnswerClicked(){
           score += 1
           scoreLabel.text = "\(score)"
           if score % 5 == 0{
               performSegue(withIdentifier: "RightAnswer", sender: UIButton.self) // penser a nommer le segue
           }
           generateQuestion()
       }
       
       @objc func wrongAnswerClicked() {
           performSegue(withIdentifier: "WrongAnswer", sender: UIButton.self)
           generateQuestion()
       }
    
    // remplir les tableaux (déchets et poubelles)
    func getData(){
        let poubelleBlanche = Poubelle(image: UIImage(named: "poubelleBlanche")!)
        let poubelleVerte = Poubelle(image: UIImage(named: "poubelleVerte")!)
        let poubelleMarron = Poubelle(image: UIImage(named: "poubelleMarron")!)
        let poubelleJaune = Poubelle(image: UIImage(named: "poubelleJaune")!)
        poubelleImages.append(poubelleJaune)
        poubelleImages.append(poubelleVerte)
        poubelleImages.append(poubelleJaune)
        poubelleImages.append(poubelleMarron)
        dechets.append(Dechet(typeDechet: poubelleJaune, image: UIImage(named: "papier")!))
        dechets.append(Dechet(typeDechet: poubelleJaune, image: UIImage(named: "carton")!))
        dechets.append(Dechet(typeDechet: poubelleBlanche, image: UIImage(named: "bouteille")!))
        dechets.append(Dechet(typeDechet: poubelleMarron, image: UIImage(named: "tomateVerte")!))
        dechets.append(Dechet(typeDechet: poubelleBlanche, image: UIImage(named: "verreCasse")!))
        dechets.append(Dechet(typeDechet: poubelleJaune, image: UIImage(named: "dechetjaune")!))
        dechets.append(Dechet(typeDechet: poubelleMarron, image: UIImage(named: "dechetAlimentaire")!))
        dechets.append(Dechet(typeDechet: poubelleVerte, image: UIImage(named: "sacPoubelle")!))
        dechets.append(Dechet(typeDechet: poubelleVerte, image: UIImage(named: "dechetVert")!))
    }
}

