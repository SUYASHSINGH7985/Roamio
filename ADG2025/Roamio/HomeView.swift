import SwiftUI

// MARK: - Home
struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Global gradient background
                LinearGradient(
                    gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        TopSearchBar()
                            .padding(.horizontal)

                        IconRow()
                            .padding(.horizontal)

                        NearbyGemsSection()
                        
                        WhereToNextView()

                        WelcomeBanner()
                            .padding(.horizontal)

                        RecentlyViewedSection()
                            .padding(.horizontal)
                        
                        Recommendation()
                            .padding(.horizontal)

                        Spacer(minLength: 80)
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Top Search Bar
struct TopSearchBar: View {
    @State private var query: String = "Explore Chennai"
    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.deepBlue)
                TextField("Explore Chennai", text: $query)
                    .foregroundColor(.black)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
            )

            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Icon Row
struct IconRow: View {
    let items: [(String, String)] = [
        ("gearshape.fill", "Things to do"),
        ("tram.fill", "Transport"),
        ("car.fill", "Car rentals"),
        ("building.2.fill", "Hotels"),
        ("simcard", "eSIM"),
        ("square.grid.2x2.fill", "All")
    ]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items, id: \.0) { icon, label in
                        VStack(spacing: 8) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                
                                LinearGradient(
                                    gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .mask(
                                    Image(systemName: icon)
                                        .font(.title2)
                                )
                            }
                            Text(label)
                                .font(.caption)
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                        .frame(width: 80)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Nearby Gems Section
struct NearbyGemsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Nearby gems in Chennai")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    CardView(imageName: "temple1",
                             title: "Chennai Half Day: Private Guided City Tour",
                             badge: "Bestselling Tours",
                             price: "₹3699")
                    CardView(imageName: "temple1",
                             title: "Chennai full day tour",
                             badge: nil,
                             price: "₹2999")
                    CardView(imageName: "temple1",
                             title: "Marina Beach Walking Tour",
                             badge: "Popular",
                             price: "₹999")
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CardView: View {
    var imageName: String
    var title: String
    var badge: String?
    var price: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 120)
                    .clipped()
                    .cornerRadius(12)

                if let badge = badge {
                    Text(badge)
                        .font(.caption2)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(8)
                }
            }

            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            Text(price)
                .font(.subheadline)
                .foregroundColor(.deepBlue)
                .fontWeight(.bold)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
        )
        .frame(width: 200)
    }
}

// MARK: - Banner
struct WelcomeBanner: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "gift.fill")
                    .font(.title3)
                    .padding(10)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("Welcome gift!")
                        .bold()
                        .foregroundColor(.deepBlue)
                    Text("Up to 10% off")
                        .font(.subheadline)
                        .foregroundColor(.deepBlue.opacity(0.8))
                }
                Spacer()
            }
            .padding()

            Button(action: {}) {
                Text("Claim")
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                    )
                    .foregroundColor(.white)
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
}
// MARK: - Recently Viewed
struct RecentlyViewedSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Recently viewed")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                NavigationLink(destination: RecentlyViewedView()) {
                    Text("See more")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    SmallCard(imageName: "park", title: "Genting Skyworlds Theme Park Ticket")
                    SmallCard(imageName: "temple1", title: "Chennai Half Day: Private Guided City Tour")
                    SmallCard(imageName: "beach", title: "Marina Beach Walking Tour")
                }
                .padding(.horizontal)
            }
        }
    }
}

struct SmallCard: View {
    var imageName: String
    var title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 100)
                .clipped()
                .cornerRadius(10)

            Text(title)
                .font(.subheadline)
                .lineLimit(2)
                .foregroundColor(.black)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .frame(width: 180)
    }
}


// MARK: - Recommendation
struct Recommendation: View {
    @State private var selectedTab: String = "Recommended"
    let tabs = ["Recommended", "Nearby"]
    @Namespace private var animation
    
    let recommendedItems: [TourItem] = [
        TourItem(title: "Chennai Half Day Tour", price: "₹7,143", imageName: "temple3"),
        TourItem(title: "Jaipur City Tour", price: "₹2,286", imageName: "jaipur"),
        TourItem(title: "Instagram Tour of Jaipur", price: "₹5,375", imageName: "jaipur2"),
        TourItem(title: "Amritsar Golden Temple Tour", price: "₹1,800", imageName: "amritsar"),
        TourItem(title: "Kerala Backwaters Houseboat", price: "₹9,500", imageName: "kerala"),
        TourItem(title: "Agra Sunrise at the Taj Mahal", price: "₹6,400", imageName: "tajmahal")
    ]
    
    let nearbyItems: [TourItem] = [
        TourItem(title: "Chennai Car Rentals", price: "₹5,952", imageName: "car1"),
        TourItem(title: "Mahabalipuram Day Trip", price: "₹3,500", imageName: "mahabalipuram"),
        TourItem(title: "Marina Beach Walking Tour", price: "₹999", imageName: "beach"),
        TourItem(title: "Old Delhi Heritage Walk", price: "₹2,500", imageName: "olddelhi"),
        TourItem(title: "Mumbai Film City Tour", price: "₹4,250", imageName: "mumbai"),
        TourItem(title: "Goa Beach Hopping", price: "₹3,500", imageName: "goa")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recommendations")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal)
            
            // Tabs
            HStack(spacing: 24) {
                ForEach(tabs, id: \.self) { tab in
                    VStack {
                        if selectedTab == tab {
                            Text(tab)
                                .font(.headline)
                                .foregroundColor(.white)
                        } else {
                            Text(tab)
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.7))
                        }

                        if selectedTab == tab {
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "underline", in: animation)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 3)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedTab = tab
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            // Grid
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(selectedTab == "Recommended" ? recommendedItems : nearbyItems) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 120)
                            .clipped()
                            .cornerRadius(12)
                        
                        Text(item.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        
                        Text("Instant confirmation")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(item.price)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.deepBlue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(width: 170, height: 220)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

struct DestinationChip: View {
    let imageName: String
    let title: String
    let subtitle: String?

    var body: some View {
        HStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                if let subtitle = subtitle {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.deepBlue)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.deepBlue.opacity(0.7))
                } else {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.deepBlue)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        )
    }
}

struct WhereToNextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Where to next?")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    DestinationChip(imageName: "singapore", title: "Keep exploring", subtitle: "Singapore")
                    DestinationChip(imageName: "phuket", title: "Phuket", subtitle: nil)
                    DestinationChip(imageName: "malaysia", title: "Malaysia", subtitle: nil)
                    DestinationChip(imageName: "bali", title: "Bali", subtitle: nil)
                }
                .padding(.horizontal)
            }
        }
    }
}

// ✅ Model
struct TourItem: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let imageName: String
}

#Preview {
    HomeView()
}
