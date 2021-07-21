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
        
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                
            Image (recipe.image)
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom)
            
        }
        .frame(width: 420, height: 400, alignment: .leading)
            
        Spacer()
        
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
        .padding(.top)
    }
    .padding()
    }
    .navigationBarTitle(recipe.name)
    .padding(10)
    }
}


struct Recipe_Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass in the detail view to see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
