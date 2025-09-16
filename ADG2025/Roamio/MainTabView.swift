import SwiftUI

struct MainTabView: View {
    init() {
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Set tab bar background to white for contrast with purple icons
        appearance.backgroundColor = UIColor.white
        
        // Set both selected and unselected items to your violet color
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.violet)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(Color.violet)
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.violet)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(Color.violet)
        ]
        
        // Apply the appearance
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
            .accentColor(.violet)
        }
    }
}

#Preview {
    MainTabView()
}
