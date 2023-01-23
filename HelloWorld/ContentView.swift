//
//  ContentView.swift
//  HelloWorld
//
//  Created by Yogesh Bhawsar on 21/01/23.
//

import SwiftUI


struct ContentView: View {
  
    var body: some View {
        TabView {
        ListView()
            .tabItem {
                    Label("ListView", systemImage: "list.dash")
                }
        Counter()
            .tabItem {
                    Label("Counter", systemImage: "number")
                }
        }  .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
