//
//  BCSubCategoryViewController.swift
//  NN-Tableviews
//
//  Created by Brian Correa on 5/1/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCSubCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    var category: String!
    
    var subcategoryTable: UITableView!
    var subcategories = [
        "Mens":["Belts", "Hats", "Shirts", "Shoes"],
        "Womens":["Dresses", "Shoes", "Skirts"],
        "Children":["Accessories", "Pants", "Shirts", "Sneakers"],
    ]
    
    var subcategory: Array<String>!
    
    //MARK: Lifecycle Methods
    
    override func loadView() {
        self.subcategory = self.subcategories[self.category]
        
        self.edgesForExtendedLayout = .None
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        
        self.subcategoryTable = UITableView(frame: frame, style: .Plain)
        self.subcategoryTable.delegate = self
        self.subcategoryTable.dataSource = self
        view.addSubview(self.subcategoryTable)
        
        self.title = self.category
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Delegate Callback Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subcategory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            self.configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    //MARK: Functions
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let category = self.subcategory[indexPath.row]
        
        cell.textLabel?.text = category
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
