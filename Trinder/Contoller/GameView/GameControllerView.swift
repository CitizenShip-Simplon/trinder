//
//  GameControllerView.swift
//  Trinder
//
//  Created by alexandre rodriguez on 13/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class GameControllerView: UIViewController{
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
        let poubelle:Poubelle
        let image:UIImage  // image des déchets
        
        // inialisation
        init(typeDechet:Poubelle, image:UIImage) {
            self.image = image
            self.poubelle = typeDechet
        }
    }
//    enum PoubelleCouleur: String {
//        case
//    }
    
    // création des 4 poubelless et leur images
    
    let poubelleBlanche = Poubelle(image: UIImage(named: "poubelleBlanche")!)
    let poubelleVerte = Poubelle(image: UIImage(named: "poubelleVerte")!)
    let poubelleMarron = Poubelle(image: UIImage(named: "poubelleMarron")!)
    let poubelleJaune = Poubelle(image: UIImage(named: "poubelleJaune")!)
    
    // création de tableau
    var dechets = [Dechet]()
    var poubelleImages = [Poubelle]()

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dechetImageView: UIImageView!
    @IBOutlet weak var leftTrashButton: UIButton!
    @IBOutlet weak var rightTrashButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ajout des images dans le tableau
        initViews()
        generateQuestion()
        scoreLabel.text = "\(score)"
    }
    
    // permet quand on clic sur le boutons de regenerer une question
    @IBAction func onButtonClicked(_ sender: UIButton) {
        generateQuestion()
    }
    
    @IBAction func rightClic(_ sender: Any) {
        score += 1
        scoreLabel.text = "\(score)"
        func shouldPerformSegue(withIdentifier identifier: RightAnswerViewController,
                                sender: UIButton) -> Bool {
            if scoreLabel.text == "10"{
                return true
            } else {
                return false
            }
        }
    }
    
    func generateQuestion() {
        //genere un nombre random = max dechets.count
        let randomNumber = generateRandom(max: dechets.count)
           
           //genere poubelle au hasard et bonne réponse
           dechetImageView.image = dechets[randomNumber].image
           leftTrashButton.imageView?.image = dechets[randomNumber].poubelle.image
        
           //Mauvaise réponse differente de bonne réponse
           rightTrashButton.imageView?.image = generateWrongAnswer(rightAnswer: dechets[randomNumber].poubelle.image).image
    }
    
    // remplir les tableaux (déchets et poubelles)
    func initViews(){
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
    
    // permet de générer la mauvaise poubelle
    func generateWrongAnswer(rightAnswer : UIImage) -> Poubelle{
        
        var wrongAnswer = poubelleImages.randomElement()
        while rightAnswer.isEqual(wrongAnswer?.image){
            wrongAnswer = generateWrongAnswer(rightAnswer: rightAnswer)
        }
        return wrongAnswer!
    }
    
    // genere un n° random entre 0 et dechets.count
    func generateRandom(max: Int) -> Int {
        return Int.random(in: 0..<max)
    }
    // passer sur l'ecran right answer if score = 10
   
    
//    // function qui augmente le score
//    func increaseScore(){
//              var score: Int = 0
//              score += 10
//              scoreLabel.text = String(score)
//          }
    
    
}


//        let random:UIImage = dechetImage.randomElement()!!
//        dechetImageView.image = random
//        leftTrashButton.imageView =


        
//        func random(){
//            let randomImage = dechetImage.randomElement()
//            dechetImageView.image = randomImage!!
//
//            if dechetImageView == UIImage(named: "bouteille") {
//                leftTrashButton.setImage(UIImage(named: "poubelleBlanche"), for: .normal)
//                leftTrashLabel.text = "Blanche"
//            }else if dechetImageView == UIImage(named: "carton") {
//                leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//                leftTrashLabel.text = "Jaune"
//            }else if dechetImageView == UIImage(named: "papier") {
//                leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//                leftTrashLabel.text = "Jaune"
//            }else if dechetImageView == UIImage(named: "tomateVerte") {
//                leftTrashButton.setImage(UIImage(named: "poubelleMarron"), for: .normal)
//                leftTrashLabel.text = "Marron"
//        }
//
//}
//        random()


        
        
//         determine image dechet au hasard
//        let randomImage = dechetImage.randomElement()
//        dechetImageView.image = randomImage!!



        
//        switch dechetImageView {
//        case UIImage(named: "bouteille"):
//            leftTrashButton.setImage(UIImage(named: "poubelleBlanche"), for: .normal)
//            leftTrashLabel.text = "Blanche"
//        case UIImage(named: "carton"):
//            leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//            leftTrashLabel.text = "Jaune"
//        case UIImage(named: "papier"):
//            leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//            leftTrashLabel.text = "Jaune"
//        case UIImage(named: "tomateVerte"):
//            leftTrashButton.setImage(UIImage(named: "poubelleMarron"), for: .normal)
//            leftTrashLabel.text = "Marron"
//        default:
//            dechetImageView.image = randomImage!!
//        }
        

        // determine les image button ("Poubelle") et label en fonction de l'image dechet
//        if dechetImageView == UIImage(named: "bouteille") {
//            leftTrashButton.setImage(UIImage(named: "poubelleBlanche"), for: .normal)
//            leftTrashLabel.text = "Blanche"
//        }else if dechetImageView == UIImage(named: "carton") {
//            leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//            leftTrashLabel.text = "Jaune"
//        }else if dechetImageView == UIImage(named: "papier") {
//            leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//            leftTrashLabel.text = "Jaune"
//        }else if dechetImageView == UIImage(named: "tomateVerte") {
//            leftTrashButton.setImage(UIImage(named: "poubelleMarron"), for: .normal)
//            leftTrashLabel.text = "Marron"
//
//    }
//        func random(){
//            let randomImage = dechetImage.randomElement()
//                dechetImageView.image = randomImage!!
//            if dechetImageView == UIImage(named: "bouteille") {
//                leftTrashButton.setImage(UIImage(named: "poubelleBlanche"), for: .normal)
//                leftTrashLabel.text = "Blanche"
//            }else if dechetImageView == UIImage(named: "carton") {
//                leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//                leftTrashLabel.text = "Jaune"
//            }else if dechetImageView == UIImage(named: "papier") {
//                leftTrashButton.setImage(UIImage(named: "poubelleJaune"), for: .normal)
//                leftTrashLabel.text = "Jaune"
//            }else if dechetImageView == UIImage(named: "tomateVerte") {
//                leftTrashButton.setImage(UIImage(named: "poubelleMarron"), for: .normal)
//                leftTrashLabel.text = "Marron"
//
//        }
//        }
//        random()



