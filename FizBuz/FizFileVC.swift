//
//  FizFileVC.swift
//  FizBuz
//
//  Created by Bharath on 23/04/19.
//  Copyright © 2019 TestCompany. All rights reserved.
//

import Foundation

import UIKit

class FizFileVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Variable to store output string
        var output = ""
        // Condition to check the number divisible by 3
        if (indexPath.row % 3 == 0) {output += "Fizz"}
        // Condition to check the number divisible by 5
        if (indexPath.row % 5 == 0) {output += "Buzz"}
        // Condition to format teh final output string
        if (output == "") {output = String(indexPath.row)}
        
        cell.textLabel?.text = output
        return cell
        
    }
    
}
