//
//  TableViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var maxTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        self.navigationController?.setToolbarHidden(self.hidesBottomBarWhenPushed, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.setToolbarHidden(true, animated: false)
        super.viewWillDisappear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

}
