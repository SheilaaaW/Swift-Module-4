//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = " "
    
    init(highlights:[String]) {
        
        for index in 0..<highlights.count {
            
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index]+", "
            }
            
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2"])
    }
}
