//
//  ViewController.swift
//  GameCollector
//
//  Created by Mohammed Al-Khonaizi on 2/24/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var games : [Game] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            
            games = try context.fetch(Game.fetchRequest())
            
            print(games)
            
        } catch {
            
        }
        
        
    }
    
    
}

