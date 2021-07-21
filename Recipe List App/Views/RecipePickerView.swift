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
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            Text("My Pick")
                .bold()
                .font(.largeTitle)
            
            Text("Delivery/Pick up")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Picker ("Tap Me", selection: $selectedMethod){
                Text("Delivery").tag(0)
                Text("Pick up").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Divider()
            
            Text("Offerings")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Picker ("Tap Me", selection: $selectedIndex) {
                            ForEach (0..<model.recipes.count){ index in
                                
                                Text("\(model.recipes[index].name)").tag(index)
                            }
                        }
            
            Text("My Pick = \(model.recipes[selectedIndex].name)")
                
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .bold()
            
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
        RecipePickerView()
            .environmentObject(RecipeModel())
    }
}
