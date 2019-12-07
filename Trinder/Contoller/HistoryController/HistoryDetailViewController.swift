//
//  HistoryDetailViewController.swift
//  Trinder
//
//  Created by Caroline Zaini on 07/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    var itemsOfSection: UIImageView!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addShadow()
        style()
    }
    
    private func addShadow() {
        guard let view = backgroundView else { return }
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 10
    }
    
    private func style() {
         guard let productImage = productImageView else { return }
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
    }

       
    }
    

  


