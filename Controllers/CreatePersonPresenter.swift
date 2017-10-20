//
//  CreateController.swift
//  CompleteTableViewExample
//
//  Created by Trainer on 10/17/17.
//  Copyright © 2017 Trainer. All rights reserved.
//

import UIKit

class CreatePersonPresenter: UIViewController {
    
    
    var specie: Specie?
    var name: String?, homeworld: String?, height: Float?, mass: Float?, birth: Int?, hair: String?, skin: String?, eye: String?, gender: String?
    
    @IBOutlet weak var educationDegreeInput: UIPickerView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var homeworldLabel: UITextField!
    @IBOutlet weak var heightLabel: UITextField!
    @IBOutlet weak var massLabel: UITextField!
    @IBOutlet weak var birthLabel: UITextField!
    @IBOutlet weak var hairLabel: UITextField!
    @IBOutlet weak var skinLabel: UITextField!
    @IBOutlet weak var eyeLabel: UITextField!
    @IBOutlet weak var genderLabel: UITextField!
    
    
    var species: [Specie] = [.Aleena, .Besalisk, .Cerean, .Chagrian, .Clawdite, .Droid, .Dug, .Ewok, .Geonosian, .Gungan, .Human, .Hutt, .Iktotchi, .Kaleesh, .Kaminoan, .Kaminoan, .KelDor, .Mirialan, .MonCalamari, .Muun, .Nautolan, .Neimodian, .Pauan, .Quermian, .Rodian, .Skakoan, .Sullustan, .Tholothian, .Togruta, .Toong, .Toydarian, .Trandoshan, .Twilek, .Vulptereen, .Wookiee, .Xexto, .Yoda, .Zabrak]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        educationDegreeInput.delegate = self
        educationDegreeInput.dataSource = self
        navigationItem.title = "Create new people"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let name = nameLabel.text, let homeworld = homeworldLabel.text, let height = heightLabel.text, let mass = massLabel.text, let birth = birthLabel.text, let hair = hairLabel.text, let skin = skinLabel.text, let eye = eyeLabel.text, let gender = genderLabel.text {
            self.name = name
            self.homeworld = homeworld
            self.height = (height as NSString).floatValue
            self.mass = (mass as NSString).floatValue
            self.birth = (birth as NSString).integerValue
            self.hair = hair
            self.skin = skin
            self.eye = eye
            self.gender = gender
        }
    }
}

extension CreatePersonPresenter: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return species[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return species.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        specie = species[row]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
}


