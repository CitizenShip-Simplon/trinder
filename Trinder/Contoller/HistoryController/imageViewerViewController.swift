//
//  imageViewerViewController.swift
//  Trinder
//
//  Created by Caroline Zaini on 04/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class imageViewerViewController: UIViewController {
    
    @IBOutlet weak var imageSelectedImageView: UIImageView!
    var imageName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private func setupImageView() {
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name) {
            imageSelectedImageView.image = image
        }
    }


}
