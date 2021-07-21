//
//  Services.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-19.
// Contains all code that fetches data

import Foundation

class DataService {
    // static = type method
   static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to teh json
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // check if pathString is not nil, othervise
        guard pathString != nil else {
            return [Recipe]()
        }
        // Create a data object
        // since we checked nil already, we can unwrap this
        let url = URL (fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)

        
        // Decode data with json Decoder
            let decoder = JSONDecoder()
            
            do {
            let recipeData  = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            catch {
                print (error)
            }
        // Add unique id
        }
        catch {
            // error gettiing data
            print (error)
        }
        
        // Return the recipes
        
        return [Recipe]()
    }
    
}
