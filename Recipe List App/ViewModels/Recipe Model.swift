//
//  Recipe Model.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-19.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        // Create an instance of data service and get data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient: Ingredients, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        // if numerator is nil, assign 1 to it
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            
            // get single serving size by* denom by recipe serving
            // *= is the same as multiply denom by recipeservings and reassign it to denominator
            denominator *= recipeServings
            
            // get target portion * numerator by target servings
            numerator *= targetServings
            
            // reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get the whole portion
            if numerator >= denominator {
                wholePortions = numerator / denominator
                
                // Calculate remainder
                numerator = numerator % denominator
                
                // Assign to portion String -- append
                portion += String(wholePortions)
            }
            if numerator > 0 {
                
                // if wholePortion is greater than 0 ( there is a whole portion) , add space, if not, no space
                portion +=  wholePortions > 0 ? " & " :  ""
                portion += "\(numerator)/\(denominator) "
            }
        }
            if var unit = ingredient.unit{
                
                if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    
                    unit += "es"
                    
                    }
                else if unit.suffix (1) == "f"{
                    unit = String (unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
                }
                
                portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
                
                return portion + unit
            

        }
        return portion
    }
}
