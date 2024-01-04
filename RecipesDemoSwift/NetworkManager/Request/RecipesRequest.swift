//
//  RecipesRequest.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import Foundation

final class RecipesRequest: Request {
    func get<T>(model: T, completion: @escaping (Result<RecipesResponse, Error>) -> ()) {
        let session = URLSession.shared
        let urlString = Constants.API.api + "recipes"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = NSMutableURLRequest(url: url)
        var request = urlRequest as URLRequest
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) { (data, response, error) -> Void in
            guard let data else { return }
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if statusCode == 200 {
                do {
                    let recipes = try JSONDecoder().decode(RecipesResponse.self, from: data)
                    completion(.success(recipes))
                } catch {
                    completion(.failure(error))
                }
            }
            completion(((.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error - Status Code: \(statusCode)"])))))
        }
        task.resume()
    }

}
