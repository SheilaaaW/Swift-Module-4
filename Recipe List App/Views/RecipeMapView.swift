//
//  RecipeMapView.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-28.
//

import SwiftUI
import MapKit


struct RecipeMapView: UIViewRepresentable {
    @EnvironmentObject var model: RecipeModel
    
    func makeUIView(context: Self.Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.showsScale = true
        
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Self.Context) {
        // Update element if needed
    }
}

struct RecipeMapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMapView()
    }
}
