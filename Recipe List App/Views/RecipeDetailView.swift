//
//  Recipe Detail View.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-19.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        
ScrollView{
    
    VStack(alignment:.leading){
        
        
        Image (recipe.image)
            .resizable()
            .frame(width: 420, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        
        
                
        VStack(alignment:.leading){
        Text("Ingredients")
            .font(.headline)
            .padding(.bottom, 5)
            .padding(.top, 10)
        ForEach (recipe.ingredients){ item in
            Text(" • " + item.name)
                .padding(.bottom, 1.5)
        }
        .padding(.horizontal)
            
        Divider()
        
            
        Text ("Directions")
            .font(.headline)
            .padding(.bottom,5)
            ForEach (0...recipe.directions.count-1, id:\.self){ index in
            
                Text( String( index + 1) + ". " + recipe.directions[index])
                    .padding(.bottom, 1.5)
            }
            
        }
        .padding(.horizontal)
        }
    }
    .navigationBarTitle(recipe.name)
    }
}


struct Recipe_Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass in the detail view to see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
