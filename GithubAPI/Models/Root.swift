//
//  Root.swift
//  GithubAPI
//
//  Created by Sonali Runwal on 10/20/21.
//

import Foundation

struct Root: Decodable {
    private enum CodingKeys: String, CodingKey {
        case commit
        case commitHash = "sha"
    }
    
    let commit: Commit
    let commitHash: String
}
