//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import AFNetworking
import UIKit
import MBProgressHUD


// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()

    var repos: [GithubRepo]!

    override func viewDidLoad() {
      
      
      
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 101
      
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self

        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar

        // Perform the first search when the view controller first loads
        doSearch()
    }

    // Perform the search.
    private func doSearch() {

        MBProgressHUD.showHUDAddedTo(self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in

            // Print the returned repositories to the output window
//            for repo in newRepos {
//                print(repo)
//            }
            self.repos = newRepos
            self.tableView.reloadData()
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        }
      )
    }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    if repos == nil{
      return 0
    }else{
      return repos.count
    }
  }
  
  // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
  // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    let repo  = repos[indexPath.row]
    let cell  = tableView.dequeueReusableCellWithIdentifier("repoCell") as! repoCell
    
    cell.labelName.text = repo.name
    cell.labelDescription.text = repo.repoDescription
    cell.labelForks.text = String(repo.forks!)
    cell.labelOwner.text = repo.ownerHandle
    cell.labelStars.text = String(repo.stars!)
    
    let imageUrl = NSURL(string:repo.ownerAvatarURL!)
    
    cell.imageViewPhoto.setImageWithURL(imageUrl!)


    return cell
  }

  
}



// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }

    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }

  @IBAction func settingsPressed(sender: UIBarButtonItem) {
    performSegueWithIdentifier("settingsSegue", sender: self)
  }
}