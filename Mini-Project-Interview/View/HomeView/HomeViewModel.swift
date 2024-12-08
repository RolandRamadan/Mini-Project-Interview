//
//  HomeViewModel.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 08/12/24.
//

import Foundation

class HomeViewModel {
    private(set) var meals: [Meal]?
    var selectedFilter: [String]?
    var filteredMeals: [Meal]?
    private var mealDataSource: MealsRemoteDataSource
    var filterTagData: [String] = ["Seafood", "Side", "Vegetarian", "Beef", "Pork", "Pasta", "Dessert", "Miscellaneous", "Lamb", "Chicken"]
    
    var onMealsUpdated: (() -> Void)?
    
    init() {
        self.mealDataSource = MealsRemoteDataSource()
    }
    
    func filterItem(for searchResult: String){
        filteredMeals = []
        for meal in meals ?? [] {
            var flag = false
            for category in selectedFilter ?? [] {
                if meal.strCategory == category{
                    flag = true
                    break
                }
            }
            if flag == false {
                continue
            }
            if meal.strMeal.contains(searchResult){
                filteredMeals?.append(meal)
            }
        }
    }
    
    func getAllCategory(){
        var set = Set<String>()
        for meal in meals ?? []{
            set.insert(meal.strCategory)
        }
        
        filterTagData = set.map({$0})
    }
    
    @MainActor
    func updateMealData(for searchParameter: String){
        Task {
            do{
                self.meals = try await mealDataSource.getMeals(for: searchParameter)
                getAllCategory()
                filterItem(for: "")
                self.onMealsUpdated?()
            } catch ApiFetchError.invalidURL{
                print("invalid URL")
            } catch ApiFetchError.invalidResponse{
                print("invalid response")
            } catch ApiFetchError.invalidData{
                self.meals = []
                self.onMealsUpdated?()
            } catch {
                print("unexpected error")
            }
        }
    }
    
}
