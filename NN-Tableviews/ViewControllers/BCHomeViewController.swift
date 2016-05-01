//
//  BCHomeViewController.swift
//  NN-Tableviews
//
//  Created by Brian Correa on 5/1/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit

class BCHomeViewController: BCBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categoriesTable: UITableView!
    var categories = ["Mens", "Womens", "Children"]
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.blueColor()
        
        self.categoriesTable = UITableView(frame: frame, style: .Plain)
        self.categoriesTable.delegate = self
        self.categoriesTable.dataSource = self
        
        view.addSubview(self.categoriesTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let category = self.categories[indexPath.row]
        
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = category
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = category
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let category = self.categories[indexPath.row]
        
        let subcategoryVc = BCSubCategoryViewController()
        subcategoryVc.category = category
        self.navigationController?.pushViewController(subcategoryVc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
