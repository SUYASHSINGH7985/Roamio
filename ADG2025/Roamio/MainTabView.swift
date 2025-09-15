//
//  MainTabView.swift
//  Roamio
//
//  Created by yash chandat  on 13/09/25.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            WishlistView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Wishlist")
                }
            
            Text("Deals")
                .tabItem {
                    Image(systemName: "tag")
                    Text("Deals")
                }
            
            TripsView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Trips")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Account")
                }
        }
        .tint(Color(hex: "84CEF4"))
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    MainTabView()
}

