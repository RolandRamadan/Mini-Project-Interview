//
//  HomeViewModel.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 08/12/24.
//

import Foundation

class HomeViewModel {
    private(set) var meals: [Meal]?
    private var mealDataSource: MealsRemoteDataSource
    
    var onMealsUpdated: (() -> Void)?
    
    init() {
        self.mealDataSource = MealsRemoteDataSource()
    }
    
    @MainActor
    func updateMealData(for searchParameter: String){
        Task {
            do{
                self.meals = try await mealDataSource.getMeals(for: searchParameter)
                self.onMealsUpdated?()
            } catch ApiFetchError.invalidURL{
                print("invalid URL")
            } catch ApiFetchError.invalidResponse{
                print("invalid response")
            } catch ApiFetchError.invalidData{
                print("invalid data")
            } catch {
                print("unexpected error")
            }
        }
    }
    
}
