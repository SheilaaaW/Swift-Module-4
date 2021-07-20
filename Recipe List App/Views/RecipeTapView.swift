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
            
            Text("Featured View")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                            .bold()
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
    }
}

struct RecipeTapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTapView()
    }
}
