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
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: -10.0, trailing: -100.0))
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                
        Divider()
                
        VStack(alignment:.leading){
        Text("Ingredients")
            .font(.headline)
            .padding(.bottom, 5)
        ForEach (recipe.ingredients,id: \.self){ item in
            Text(" • " + item)
                .padding(.bottom, 1.5)
        }
            
        Divider()
            
        Text ("Directions")
            .font(.headline)
            .padding(.bottom,5)
            ForEach (0...recipe.directions.count-1, id:\.self){ index in
            
                Text( String( index + 1) + ". " + recipe.directions[index])
                .padding(.bottom, 1.5)
        }
        }
        .padding([.leading, .trailing], 10)
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
