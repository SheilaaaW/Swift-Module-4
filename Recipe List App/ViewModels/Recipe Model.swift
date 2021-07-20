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
}
