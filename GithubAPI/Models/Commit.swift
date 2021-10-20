//
//  Commit.swift
//  GithubAPI
//
//  Created by Sonali Runwal on 10/20/21.
//

import Foundation

struct Commit: Decodable {
    let author: Author
    let message: String
}
