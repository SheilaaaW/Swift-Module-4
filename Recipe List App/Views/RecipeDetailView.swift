//
//  Recipe Detail View.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-19.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
ScrollView{
    
    VStack(alignment:.leading){
        
        ZStack{
                
            Image (recipe.image)
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom)
            
        }
        .frame(width: 420, height: 400, alignment: .leading)
            
        Spacer()
        
        Text(recipe.name)
            .bold()
            .padding(.leading)
            .padding(.bottom)
            .font(Font.custom("Chalkboard SE Bold", size: 35))
        
        VStack(alignment:.leading){
            Text("Select your serving size: ")
                .font(Font.custom("Chalkboard SE Regular", size: 20))
            
            Picker("", selection: $selectedServingSize){
                Text("2").tag(2)
                Text("4").tag(4)
                Text("6").tag(6)
                Text("8").tag(8)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width:230)
            .font(Font.custom("Chalkboard SE Regular", size: 16))
        }
        .padding(.horizontal)
        
        
        VStack(alignment:.leading){
        Text("Ingredients")
            .font(Font.custom("Chalkboard SE Regular", size: 20))
            .padding(.bottom, 5)
            
        ForEach (recipe.ingredients){ item in
            Text(" • " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                .padding(.bottom, 1.5)
                .font(Font.custom("Chalkboard SE Regular", size: 16))
            
        }
        .padding(.horizontal)
        
            
        Divider()
        
            
        Text ("Directions")
            .font(Font.custom("Chalkboard SE Regular", size: 20))
            .padding(.bottom,5)
            ForEach (0...recipe.directions.count-1, id:\.self){ index in
            
                Text( String( index + 1) + ". " + recipe.directions[index])
                    .padding(.bottom, 1.5)
                    .font(Font.custom("Chalkboard SE Regular", size: 16))
            }
            
        }
        .padding(.horizontal)
        .padding(.top)
    }
    .padding()
    }
    }
}


struct Recipe_Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass in the detail view to see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
