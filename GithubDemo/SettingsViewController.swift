//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Fer on 2/12/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    if section == 0{
      return 1
    }else{
      return 7
    }
  }
  
  // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
  // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    let cell = tableView.dequeueReusableCellWithIdentifier("settingsCell", forIndexPath: indexPath)
    if indexPath.row == 0 && indexPath.section == 0{
      cell.textLabel?.text = "Minimum Stars"
    }else if indexPath.row == 0 && indexPath.section == 1{
      cell.textLabel?.text = "Filter by Language"
    }else if indexPath.row == 1 && indexPath.section == 1{
      cell.textLabel?.text = "Java"
    }else if indexPath.row == 2 && indexPath.section == 1{
      cell.textLabel?.text = "Javascript"
    }else if indexPath.row == 3 && indexPath.section == 1{
      cell.textLabel?.text = "Objective-C"
    }else if indexPath.row == 4 && indexPath.section == 1{
      cell.textLabel?.text = "Python"
    }else if indexPath.row == 5 && indexPath.section == 1{
      cell.textLabel?.text = "Ruby"
    }else if indexPath.row == 6 && indexPath.section == 1{
      cell.textLabel?.text = "Swift"
    }
    return cell
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
    return " "
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
