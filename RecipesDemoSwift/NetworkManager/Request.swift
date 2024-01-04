//
//  Request.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import Foundation

protocol Request {
    func get<T>(model: T, completion: @escaping(Result<RecipesResponse, Error>) -> ())
}
