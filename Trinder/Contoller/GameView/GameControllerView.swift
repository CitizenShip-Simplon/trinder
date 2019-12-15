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
    @IBAction func rightClick(_ sender: UIButton) {
        // augmente le score à chaque clic
        score += 1
        scoreLabel.text = "\(score)"
        if score % 5 == 0{
            performSegue(withIdentifier: "RightAnswer", sender: sender) // charge l'ecran Right Answer quand score/5 = 0
        }
    }
    func generateQuestion() {
        //genere un nombre random = max dechets.randomElement()
        let dechet = dechets.randomElement()
        dechetImageView.image = dechet?.image
        //genere l'image du bouton gauche en normal (afficher)
        leftTrashButton.setImage(dechet?.poubelle.image, for: .normal)
        //genere l'image du dechet
        dechetImageView.image = dechet?.image
        // permet d'eviter le chanegemnt de couleur de la poubelle quand elle est cliqué
        leftTrashButton.setImage(dechet?.poubelle.image, for: .highlighted)
        //genere l'image du bouton gauche en normal (afficher)
        rightTrashButton.setImage(generateWrongAnswer(rightAnswer: (dechet?.poubelle.image)!).image, for: .normal)
        // permet d'eviter le chanegemnt de couleur de la poubelle quand elle est cliqué
        rightTrashButton.setImage(generateWrongAnswer(rightAnswer: (dechet?.poubelle.image)!).image, for: .highlighted)
        
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
    
}
