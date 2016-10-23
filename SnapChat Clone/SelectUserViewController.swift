//
//  SelectUserViewController.swift
//  SnapChat Clone
//
//  Created by ROHIT GUPTA on 10/22/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit
import Firebase

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
            let user = User()
            
            // http://stackoverflow.com/questions/39480150/type-any-has-no-subscript-members-after-updating-to-swift-3
            
            let snapshotValue = snapshot.value as? NSDictionary
            user.email = (snapshotValue?["email"] as? String)!
            
            user.uid = snapshot.key
            
            self.users.append(user)
            
            self.tableView.reloadData()
            
        })
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }

}
