//
//  RecipeWebsiteView.swift
//  Recipe List App
//
//  Created by Sheila Wang on 2021-07-28.
//

import SwiftUI
import WebKit

struct RecipeWebsiteView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        return
    }
}
