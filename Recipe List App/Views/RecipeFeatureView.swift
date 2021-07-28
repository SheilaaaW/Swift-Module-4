//
//  RecipeFeatureView.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-21.
//

import SwiftUI
import WebKit

struct RecipeFeatureView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0

    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0){
            Text("Featured Recipe")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Chalkboard SE Bold", size: 35))
            
            
            
            GeometryReader { geo in
                
                TabView (selection: $tabSelectionIndex){
                    
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured == true {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing:0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .font(Font.custom("Chalkboard SE Regular", size: 16))
                                    }
                                    
                                }
                                
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing ){
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40 , height: geo.size.height - 125, alignment: .center)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            
                        }
                        
                    }
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Prep Time")
                     .font(Font.custom("Chalkboard SE Regular", size: 20))
                Text(" " + model.recipes[tabSelectionIndex].prepTime)
                  .font(Font.custom("Chalkboard SE Regular", size: 16))
                Text("Highlight")
                    .font(Font.custom("Chalkboard SE Regular", size: 20))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Chalkboard SE Regular", size: 16))
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
        
    }
    
    func setFeaturedIndex() {
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
