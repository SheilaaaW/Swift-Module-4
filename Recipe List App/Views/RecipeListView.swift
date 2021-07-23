//
//  ContentView.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-19.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading){
                Text("Sheila's Recipes")
                    .bold()
                    .padding(.leading)
                    .padding(.top, 40)
                    .font(Font.custom("Chalkboard SE Bold", size: 35))
                
                ScrollView{
                    LazyVStack (alignment:.leading) {
                        ForEach(model.recipes){ r in
                            
                            NavigationLink(
                                destination:(RecipeDetailView(recipe:r)),
                                label:{
                                    
                                    HStack{
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(r.name)
                                               
                                                .foregroundColor(.black)
                                                
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.gray)
                                                .font(Font.custom("Chalkboard SE Regular", size: 16))
                                        }
                                        
                                        
                                    }
                                })
                        }
                        .navigationBarTitle("Sheila's Recipe")
                        .navigationBarHidden(true)
                        
                            .font(Font.custom("Chalkboard SE Regular", size: 20))
                        
                    }
                    .padding()
                }
                
            }
            
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
