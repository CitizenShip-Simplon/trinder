//
//  WillViewController.swift
//  Trinder
//
//  Created by William Souef on 12/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class WillViewController: UIViewController {

    
    
    
    // var image passed = "" for image passed"1" in masque de Plongée print =
//    aider pour le premier écran 
    
    struct Déchets {
           
           var phraseDeréponse :String
           
           var iconTrash :String
           
           var descriptionTrash :String
        
           }
    
    var verre = Déchets(phraseDeréponse: "Non c'est presque ça" , iconTrash: "firstdechet", descriptionTrash:"Fini de faire les pyramide avec les copains , alors retrouve la décheterie idéale pour nos amis de soirée")
    
           
    var alarmeclock = Déchets(phraseDeréponse: <#T##String#>, iconTrash: <#T##String#>, descriptionTrash:"Marre de se réveiller le matin, alors nous allons voir comment résoudre ton probléme"  )
    var electro = Déchets(phraseDeréponse: <#T##String#>, iconTrash: <#T##String#>, descriptionTrash: "Envie de nouveauté I-tech , alors pense a recycler ton cher ami dans notre local décheterie")
    var entretien = Déchets(phraseDeréponse: <#T##String#>, iconTrash: <#T##String#>, descriptionTrash: "Maintenant que notre ami nous a servi a rendre propre notre maison , il est temps de lui rendre hommage comme il se doit")
    var  masqueplongée = Déchets(phraseDeréponse: <#T##String#>, iconTrash: <#T##String#>, descriptionTrash: "Comment recycler notre ami qui nous connecte avec les poissons ? pas dans l'eau en tout cas ,retrouve la décheterie qui correspond ici prés de chez toi")
    var meuble = Déchets(phraseDeréponse: <#T##String#>, iconTrash: <#T##String#>, descriptionTrash: " Cette outil est né dans la foret, et a permis de stocker vos affaires alors respectons le ! retrouve ici comment il pourra etre transformer" )
    
    
    
    
    
    
        
        
        
  
    
    
    @IBOutlet weak var MauvaiseReponse: UILabel!
    
    @IBOutlet weak var imageTrash: UIImageView!
    
    @IBOutlet weak var imageDechet: UIImageView!
    
    @IBOutlet weak var nameDechet: UILabel!
    
    @IBOutlet weak var descriptionDechet: UILabel!
    
    @IBOutlet weak var ajouterHistorique: UIButton!
  
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
