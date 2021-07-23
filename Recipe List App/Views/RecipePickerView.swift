//
//  RecipePickerView.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-21.
//

import SwiftUI

struct RecipePickerView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var selectedIndex = 1
    @State var selectedMethod = 1
    @State var recipe: Recipe
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            Text("My Pick")
                .bold()
                .font(Font.custom("Chalkboard SE Bold", size: 35))
            
            Text("Delivery/Pick up")
                .font(Font.custom("Chalkboard SE Regular", size: 24))
            
            Picker ("Tap Me", selection: $selectedMethod){
                Text("Delivery").tag(0)
                Text("Pick up").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .font(Font.custom("Chalkboard SE Regular", size: 18))
            
            Divider()
            
            
            HStack {
                Text("Offerings")
                    .font(Font.custom("Chalkboard SE Regular", size: 24))
                
                Spacer()
                
                Image(systemName: "hand.tap.fill")
                    .padding(.top)
                
                Button("Pick for Me"){
                              selectedIndex = .random(in: 1..<model.recipes.count)
                       }
                .foregroundColor(.gray)
                .font(Font.custom("Chalkboard SE Regular", size: 20))
                .padding(.top)
                }
        
            
            Picker ("Tap Me", selection: $selectedIndex) {
                            ForEach (0..<model.recipes.count){ index in
                                
                                Text("\(model.recipes[index].name)").tag(index)
                                    .font(Font.custom("Chalkboard SE Regular", size: 18))
                            }
                        }
            
            Text("My Pick = \(model.recipes[selectedIndex].name)")
                
                .font(Font.custom("Chalkboard SE Regular", size: 24))
            
                TabView {
                            Image(model.recipes[selectedIndex].image)
                                .resizable()
                                .clipped()
                                .aspectRatio(contentMode: .fill)
                                .padding(.bottom, 10)
                    .frame(alignment: .bottomLeading)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
                    }
        .padding(.horizontal)
        
    }
}



struct RecipePickerView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipePickerView(recipe: model.recipes[0])
            .environmentObject(RecipeModel())
    }
}
