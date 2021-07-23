//
//  RecipeTapView.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-20.
//

import SwiftUI

struct RecipeTapView: View {
    
    
    var body: some View {
        
        TabView{
            
            RecipeFeatureView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                            .bold()
                    }
                }
            let model = RecipeModel()
            
            RecipePickerView (recipe: model.recipes[0])
                .tabItem {
                    VStack{
                        Image(systemName: "hand.tap.fill")
                        Text("My Pick")
                    }
                }
            
            RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                            .bold()
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTapView()
        
    }
}
