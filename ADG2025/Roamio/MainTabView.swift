import SwiftUI

struct MainTabView: View {
    init() {
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Tab bar background white
        appearance.backgroundColor = UIColor.white
        
        // Selected tab color: purple
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.violet)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(Color.violet)
        ]
        
        // Unselected tab color: black
        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
        // Apply appearance
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        ZStack {
            // Global gradient background
            LinearGradient(
                gradient: Gradient(colors: [.deepBlue, .violet]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                WishlistView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Wishlist")
                    }
                
                DealsPage()
                    .tabItem {
                        Image(systemName: "tag.fill")
                        Text("Deals")
                    }
                
                TripsView()
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Trips")
                    }
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Account")
                    }
            }
            .accentColor(.violet) // Selected tab accent color
        }
    }
}

#Preview {
    MainTabView()
}
