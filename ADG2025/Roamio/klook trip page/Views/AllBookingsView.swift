import SwiftUI

// MARK: - All Bookings View
struct AllBookingsView: View {
    // Mock data for the favorite choices (with image names from Assets.xcassets)
    let favoriteChoices: [FavoriteChoice] = [
        .init(title: "Universal Studios Singapore Ticket",
              rating: 4.8,
              reviewCount: "(104,631)",
              imageName: "universall"),   // <- Add this image in Assets.xcassets
        .init(title: "Eiffel Tower Summit Access",
              rating: 4.7,
              reviewCount: "(88,921)",
              imageName: "eiffeltowersummit")       // <- Add this image in Assets.xcassets
    ]
    
    // Gradient background
    private var backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.lightBlue, Color.deepBlue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Navigation bar appearance
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40) {
                    // Header section
                    VStack(spacing: 15) {
                        Image(systemName: "suitcase.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .padding(30)
                            .background(Color.black.opacity(0.1))
                            .clipShape(Circle())
                        
                        Text("Nothing booked yet!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Start planning your next adventure!")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 50)
                    
                    // Action Button
                    NavigationLink(destination: ExploreView()) {
                        Text("Start exploring")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.lightBlue, Color.deepBlue, Color.violet]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    // Travelers' favorite choices section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Travelers' favorite choices")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(favoriteChoices) { choice in
                                    FavoriteChoiceCard(choice: choice)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle("All bookings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Favorite Choice Model
struct FavoriteChoice: Identifiable {
    let id = UUID()
    let title: String
    let rating: Double
    let reviewCount: String
    let imageName: String   // NEW
}

// MARK: - Favorite Choice Card
struct FavoriteChoiceCard: View {
    let choice: FavoriteChoice
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(choice.imageName)   // NEW
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)
            
            Text(choice.title)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .padding(.top, 5)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text(String(format: "%.1f", choice.rating))
                    .foregroundColor(.white)
                Text(choice.reviewCount)
                    .foregroundColor(.white.opacity(0.7))
            }
            .font(.subheadline)
        }
        .frame(width: 200)
    }
}

// MARK: - Preview
struct AllBookingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllBookingsView()
        }
    }
}
