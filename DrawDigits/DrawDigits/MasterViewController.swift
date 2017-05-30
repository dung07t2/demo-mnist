//
//  MasterViewController.swift
//  DrawDigits
//
//  Created by DzEagle on 5/31/17.
//  Copyright © 2017 dung.le. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "someCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Trained"
        case 1:
            cell.textLabel?.text = "Recognized"
        case 2:
            cell.textLabel?.text = "Draw"
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "one-by-one", sender: self)
        case 1:
            performSegue(withIdentifier: "batch", sender: self)
        case 2:
            performSegue(withIdentifier: "draw", sender: self)
        default:
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}
