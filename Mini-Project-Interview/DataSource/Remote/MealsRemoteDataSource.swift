//
//  MealsRemoteDataSource.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 08/12/24.
//

import Foundation
import UIKit

class MealsRemoteDataSource{
    func getMeals(for searchParameter: String) async throws -> [Meal] {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchParameter)"
        guard let url = URL(string: endpoint) else {
            throw ApiFetchError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiFetchError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(MealsResponse.self, from: data).meals
        } catch {
            throw ApiFetchError.invalidData
        }
    }
}

