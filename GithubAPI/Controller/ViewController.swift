//
//  ViewController.swift
//  GithubAPI
//
//  Created by Sonali Runwal on 10/20/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pullCommits()
    }

    private func pullCommits() {
        let apiHandler = APIHandler()
        apiHandler.getGitCommits { (response) in
            print("Response received : ", response)
        }
    }


}

