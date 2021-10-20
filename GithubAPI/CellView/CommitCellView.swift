//
//  CommitCellView.swift
//  GithubAPI
//
//  Created by Sonali Runwal on 10/20/21.
//

import UIKit

class CommitCellView: UITableViewCell {

    @IBOutlet weak var labelAuthorName: UILabel!
    
    @IBOutlet weak var labelCommitMessage: UILabel!
    @IBOutlet weak var labelCommitHash: UILabel!
    
    var rootObj: Root! {
        didSet {
            labelAuthorName.text = rootObj.commit.author.name
            labelCommitMessage.text = rootObj.commit.message
            labelCommitHash.text = rootObj.commitHash
        }
    }
}


