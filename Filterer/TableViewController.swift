//
//  TableViewController.swift
//  Filterer
//
//  Created by Kenny Speer on 8/20/16.
//  Copyright © 2016 Kenny Speer. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let filters = [
        "Red",
        "Blue",
        "Green",
        "Yellow",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup datasource and delegate to this instance
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(filters[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FilterCell", for: indexPath)
        
        // set the label to match the contents of the filter row
        cell.textLabel?.text = filters[indexPath.row]
        return cell
    }
    
    /*
     * Below is boiler plate from template
     */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
