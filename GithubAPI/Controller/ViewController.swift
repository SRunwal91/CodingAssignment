//
//  ViewController.swift
//  GithubAPI
//
//  Created by Sonali Runwal on 10/20/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewCommits: UITableView!
    var commits = [Root]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pullCommits()
    }

    private func pullCommits() {
        let apiHandler = APIHandler()
        apiHandler.getGitCommits { (responseCommits) in
            self.commits = responseCommits
            DispatchQueue.main.async {
                self.tableViewCommits.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commitCell", for: indexPath) as! CommitCellView
        
        let commit = commits[indexPath.row]
        cell.rootObj = commit
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

