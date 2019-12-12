//
//  ViewController.swift
//  Alex pickerView
//
//  Created by alexandre rodriguez on 12/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class ChatBotViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let names = ["Choisissez","Alimentaire", "Electromenager","Emballage", "High-tech", "Medical", "Mobilier", "Non triable", "Textile", "Verre"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var namePickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        namePickerView.dataSource = self
        namePickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        let nameToDisplay = names[row]
        return nameToDisplay
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let typeChoice = names[row]
        
        if typeChoice == "Medical" {
            imageView.image = UIImage(named: "logo-pharmacie")
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = "A déposer en pharmacie"
        }else if typeChoice == "Textile"{
            imageView.image = UIImage(named: "images")
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = "A déposer dans un conteneur textile"
        }else if typeChoice == "Mobilier"{
        imageView.image = UIImage(named: "dechetterie")
            firstLabel.text = "Peut-il servir à quelqu'un d'autre"
            secondLabel.text = "Peux tu le réparer?"
            thirdLabel.text = "Sinon la déchetterie"
        }else if typeChoice == "Electromenager"{
            imageView.image = UIImage(named: "reparer")
            firstLabel.text = "Peut-il servir à quelqu'un d'autre"
            secondLabel.text = "Peux tu le réparer?"
            thirdLabel.text = "Sinon la déchetterie"
        }else if typeChoice == "Alimentaire"{
            imageView.image = UIImage(named: "poubelleMarron")
            firstLabel.text = ""
            secondLabel.text = "Attention sans emballage"
            thirdLabel.text = "Poubelle Marron"
        }else if typeChoice == "Emballage"{
            imageView.image = UIImage(named: "poubelleJaune")
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = "Poubelle Jaune"
        }else if typeChoice == "Verre"{
            imageView.image = UIImage(named: "poubelleBlanche")
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = "Poubelle Blanche"
        }else if typeChoice == "Non triable"{
            imageView.image = UIImage(named: "poubelleVerte")
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = "Poubelle verte"
        }else if typeChoice == "High-tech"{
        imageView.image = UIImage(named: "reparer")
            firstLabel.text = "Peut-il servir à quelqu'un d'autre"
            secondLabel.text = "Peut tu le réparer?"
            thirdLabel.text = "Sinon la déchetterie"
        }else{
            imageView.image = nil
            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = ""
        }
    }
}








