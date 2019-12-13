//
//  rightAnswerControllerView.swift
//  Trinder
//
//  Created by alexandre rodriguez on 12/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class RightAnswerViewController: UIViewController {
    
    @IBOutlet weak var labelRandom: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.r on fait un rule
    
        let phrase = ["6 briques de lait -> 1 rouleau de papier toilette", "9 bouteilles en plastique transparent -> 1 tee-shirt", "8 boîtes de conserves -> casserole", "250 canettes -> 1 cadre de vélo", "1OOO Kg de verre -> 2 138 bouteilles de 75 cl", "12 bouteilles plastique -> 1 oreiller", "1 boite de céréale -> 1 boite d'oeuf", "1 tonne de plastique recycler -> 800 Kg de pétrole économisé"]
        
        labelRandom.text = phrase[Int.random(in: 0...7)]
    }
}
