//
//  APIHandler.swift
//  GithubAPI
//
//  Created by Sonali Runwal on 10/20/21.
//

import Foundation
import UIKit

class APIHandler {
  
    func getGitCommits(completionHandler: @escaping ([Root]) -> ()) {
        let repoDetails = RepositoryDetails()
        let urlString = repoDetails.baseUrl + repoDetails.userName + repoDetails.repoName + "/commits"
        var urlComp = URLComponents(string: urlString)!

        urlComp.queryItems = [
            URLQueryItem(name: "per_page", value: "\(repoDetails.maxResponses)")
        ]
        
        let url = URLRequest(url: urlComp.url!)

        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode([Root].self, from: data)
                print("Response : ", result)

                result.forEach({ (commit) in
                    completionHandler(result)
                })
            } catch let decodeError {
                print("Failed to decode json:", decodeError)
            }
        }
        dataTask.resume()
    }
}
