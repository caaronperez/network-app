//
//  ViewController.swift
//  HW-DAY8E4
//
//  Created by MCS Devices on 10/15/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

struct segueIdentifiers {
    static let presentPeople = "presentPeople"
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    private var editable = false
    private var people: [People] = []
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? CreatePersonPresenter {
            if let name = source.name, let homeworld = source.homeworld, let height = source.height, let mass = source.mass, let birth = source.birth, let hair = source.hair, let skin = source.skin, let eye = source.eye, let gender = source.gender, let specie = source.specie {
                people.append(People(birth: birth, eyecolor: eye, gender: gender, haircolor: hair, height: height, homeworld: homeworld, mass: mass, name: name, skincolor: skin, specie: specie))
                tableView.reloadData()
            }
        }
    }

    @IBAction func didPressEdit(_ sender: Any) {
        editable = editable ? false : true
        editButton.title = editable ? "Done" : "Edit"
        tableView.setEditing(editable, animated: true)
    }
    
    fileprivate func setTitles() {
        navigationItem.title = "Persons"
        editButton.title = "Edit"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initElements()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController {
    
    fileprivate func initElements() {
        
        let r2d2 = People(birth: 1995, eyecolor: "Brown", gender: "Man", haircolor: "White", height: 1.2, homeworld: "Earth", mass: 22.2, name: "R2D2", skincolor: "White", specie: .Droid)
        people = [r2d2]
        tableView.isEditing = editable
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "TableViewCellController" , bundle: nil), forCellReuseIdentifier: "TableViewCellController")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellController", for: indexPath) as! TableViewCellController
        
        cell.nameLabel.text = "\(people[indexPath.row].name)"
        cell.ageLabel.text = "Birth year: \(people[indexPath.row].birth)"
        cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width/4
        cell.userImage.clipsToBounds = true
     
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.init(red: 0.5, green: 0.8, blue: 0.3, alpha: 0.3) :  UIColor.white
        
        if let uimage = people[indexPath.row].specie {
            cell.userImage.image = UIImage(named: uimage.rawValue)
        } else {
            cell.userImage.image = #imageLiteral(resourceName: "empty")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifiers.presentPeople, sender: nil)
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifiers.presentPeople {
            if let nextViewController = segue.destination as? PersonPresenter, let indexRow = tableView.indexPathForSelectedRow?.row {
                nextViewController.currentModel = people[indexRow]
            }
        }
    }
    
}

