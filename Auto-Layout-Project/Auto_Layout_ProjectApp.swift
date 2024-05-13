//
//  Auto_Layout_ProjectApp.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 22/04/24.
//

import SwiftUI

@main
struct Auto_Layout_ProjectApp: App {
    // pemanggilan observable object
    @ObservedObject var user = UserObject()
    
    var body: some Scene {
        WindowGroup {
            // LoginView()
            
            TabView {
                NavigationView{
                     ContentView(user: user)
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
                NavigationView{
                     ProductView()
                }
                .tabItem {
                    Label("Product", systemImage: "cart.fill")
                }
                
                NavigationView{
                    ArticleView()
                }
                .tabItem {
                    Label("Article", systemImage: "newspaper.fill")
                }
                
                NavigationView{
                    CounterView()
                }
                .tabItem {
                    Label("Counter", systemImage: "arrow.counterclockwise.square.fill")
                }
                
                ProfileView(user: user)
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
                
            }
            // .tabViewStyle(.page)
            .accentColor(.myPrimary)
        }
    }
}

