//
//  CharacterDetail.swift
//  CompleteTableViewExample
//
//  Created by Trainer on 10/17/17.
//  Copyright © 2017 Trainer. All rights reserved.
//

import UIKit
import Foundation

class PersonPresenter: UIViewController {
    
    
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var skincolorLabel: UILabel!
    @IBOutlet weak var haircolorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var eyecolorLabel: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    var currentModel: People?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = currentModel?.name{
            navigationItem.title = "\(name)"
        } else {
            navigationItem.title = "Details"
        }
        
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.clipsToBounds = true
        
        if let imageUser = currentModel?.specie {
            userImage.image = UIImage(named: imageUser.rawValue)
        } else {
            userImage.image = #imageLiteral(resourceName: "empty")
        }
        
        if let birth = currentModel?.birth, let eyecolor = currentModel?.eyecolor, let gender = currentModel?.gender, let haircolor = currentModel?.haircolor, let height = currentModel?.height, let homeworld = currentModel?.homeworld, let mass = currentModel?.mass, let skincolor = currentModel?.skincolor, let specie = currentModel?.specie{
            
            birthLabel.text = "\(birth)"
            skincolorLabel.text = "\(skincolor)"
            haircolorLabel.text = "\(haircolor)"
            genderLabel.text = "\(gender)"
            specieLabel.text = "\(specie.rawValue)"
            homeworldLabel.text = "\(homeworld)"
            massLabel.text = "\(mass) kg."
            eyecolorLabel.text = "\(eyecolor)"
            self.height.text = "\(height)mts."
        }
        
    }
}


