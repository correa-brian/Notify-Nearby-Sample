//
//  BCHomeViewController.swift
//  NN-Tableviews
//
//  Created by Brian Correa on 5/1/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCHomeViewController: BCBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    var categoriesTable: UITableView!
    var categories = ["Mens", "Womens", "Children"]
    
    //MARK: Lifecyle Methods
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        
        self.categoriesTable = UITableView(frame: frame, style: .Plain)
        self.categoriesTable.delegate = self
        self.categoriesTable.dataSource = self
        
        view.addSubview(self.categoriesTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Delegate Callback Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            self.configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let category = self.categories[indexPath.row]
        
        let subcategoryVc = BCSubCategoryViewController()
        subcategoryVc.category = category
        self.navigationController?.pushViewController(subcategoryVc, animated: true)
    }
    
    //MARK: Functions
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        let category = self.categories[indexPath.row]
        
        cell.textLabel?.text = category
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
