//
//  ContentView.swift
//  klookhomepage2
//
//  Created by yash chandat  on 13/09/25.
//

import SwiftUI

// MARK: - Home
struct HomeView: View {
    var body: some View {
        NavigationView {
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
                    .foregroundColor(.gray)
                TextField("Explore Chennai", text: $query)
                    .foregroundColor(.primary)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color(hex: "84CEF4"), lineWidth: 2)
            )

            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title2)
                }
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title2)
                }
            }
            .foregroundColor(.black)
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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 22) {
                ForEach(items, id: \.0) { icon, label in
                    VStack(spacing: 8) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemGray6))
                                .frame(width: 56, height: 56)
                            Image(systemName: icon)
                                .font(.title2)
                                .foregroundColor(Color(hex: "84CEF4").opacity(1))
                        }
                        Text(label)
                            .font(.footnote)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.vertical, 6)
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
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.black)
                 
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    CardView(imageName: "temple1", title: TruncatedText(text: "Chennai Half Day: Private Guided City To...", characterLimit: 12, lineLimit: 2), badge: "Bestselling Tours", price: "₹3699")
                    CardView(imageName: "temple1", title: TruncatedText(text: "Chennai full day tour", characterLimit: 12, lineLimit: 2), badge: nil, price: "₹ 2999")
                }
            }
        }
        .padding(.horizontal)
    }
}

struct CardView<Title: View>: View {
    var imageName: String
    var title: Title
    var badge: String?
    var price: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)

            title
                .font(.subheadline)

            if let badge = badge {
                Text(badge)
                    .font(.caption2)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(8)
            }

            Text(price)
                .font(.subheadline)
                .foregroundColor(.primary)
                .fontWeight(.bold)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 4)
        )
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
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "84CEF4").opacity(0.3)))
                VStack(alignment: .leading) {
                    Text("Welcome gift!")
                        .bold()
                    Text("Up to 10% off")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()

            Button(action: {}) {
                Text("Claim")
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .background(RoundedRectangle(cornerRadius: 18).fill(Color(hex: "84CEF4")))
                    .foregroundColor(.white)
            }
            .padding()
        }
        .background(RoundedRectangle(cornerRadius: 14).fill(Color(.systemGray6)))
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
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.black)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    SmallCard(imageName: "park", title: "Genting Skyworlds Theme Park Ticke...")
                        .frame(width: 200)
                    SmallCard(imageName: "temple1", title: "Chennai Half Day: Private Guided Cit...")
                        .frame(width: 200)
                }
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
                .frame(height: 100)
                .clipped()
                .cornerRadius(10)

            Text(title)
                .font(.subheadline)
                .lineLimit(2)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
        .shadow(color: Color.black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

import SwiftUI

struct Recommendation: View {
    @State private var selectedTab: String = "Recommended"
    let tabs = ["Recommended", "Nearby"]
    @Namespace private var animation
    
    // ✅ Sample data
    let recommendedItems: [TourItem] = [
        TourItem(title: "Chennai Half Day Tour", price: "₹7,143", imageName: "temple1"),
        TourItem(title: "Jaipur City Tour", price: "₹2,286", imageName: "jaipur"),
        TourItem(title: "Instagram Tour of Jaipur", price: "₹5,375", imageName: "jaipur2"),
        TourItem(title: "Amritsar Golden Temple Tour", price: "₹1,800", imageName: "amritsar"),
        TourItem(title: "Kerala Backwaters Houseboat", price: "₹9,500", imageName: "kerala"),
        TourItem(title: "Agra Sunrise at the Taj Mahal", price: "₹6,400", imageName: "tajmahal"),
        TourItem(title: "Hampi Temple and Ruins", price: "₹4,800", imageName: "hampi"),
        TourItem(title: "Rishikesh Adventure and Yoga", price: "₹5,100", imageName: "rishikesh")

    ]
    
    let nearbyItems: [TourItem] = [
        TourItem(title: "Chennai Car Rentals", price: "₹5,952", imageName: "car"),
        TourItem(title: "Mahabalipuram Day Trip", price: "₹3,500", imageName: "mahabalipuram"),
        TourItem(title: "Marina Beach Walking Tour", price: "₹999", imageName: "beach"),
        TourItem(title: "Old Delhi Heritage Walk", price: "₹2,500", imageName: "olddelhi"),
        TourItem(title: "Mumbai Film City Tour", price: "₹4,250", imageName: "mumbai"),
        TourItem(title: "Goa Beach Hopping", price: "₹3,500", imageName: "goa"),
        TourItem(title: "Varanasi Ganges River Ceremony", price: "₹2,000", imageName: "varanasi"),
        TourItem(title: "Udaipur Lakes and Palaces", price: "₹3,900", imageName: "udaipur")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Tabs
                HStack(spacing: 24) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Text(tab)
                                .font(.headline)
                                .foregroundColor(selectedTab == tab ? Color(hex: "84CEF4") : .black)
                            if selectedTab == tab {
                                Capsule()
                                    .fill(Color(hex: "84CEF4"))
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
                            // ✅ Fixed image size
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 120)
                                .overlay(
                                    Text(item.imageName) // Replace with Image(item.imageName)
                                        .foregroundColor(.white)
                                )
                                .cornerRadius(12)
                            
                            Text(item.title)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                            
                            Text("Instant confirmation")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text(item.price)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(height: 200) // ✅ Consistent card height
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                }
                .padding(.horizontal, 15)
            }
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
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                } else {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

struct WhereToNextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Text("Where to next?")
                    .font(.headline)
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.black)
            }

            // Horizontal Scroll Chips
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    DestinationChip(imageName: "singapore", title: "Keep exploring", subtitle: "Singapore")
                    DestinationChip(imageName: "phuket", title: "Phuket", subtitle: nil)
                    DestinationChip(imageName: "malaysia", title: "Malaysia", subtitle: nil)
                }
                .padding(.trailing)
            }
        }
        .padding(.horizontal)
    }
}

struct TruncatedText: View {
    let text: String
    let characterLimit: Int
    let lineLimit: Int
    
    var body: some View {
        Text(displayText)
            .lineLimit(lineLimit)       // ✅ maximum lines
            .truncationMode(.tail)      // ✅ adds "..." if overflow
    }
    
    private var displayText: String {
        if text.count > characterLimit * lineLimit {
            let endIndex = text.index(text.startIndex, offsetBy: characterLimit * lineLimit)
            return String(text[..<endIndex]) + "..."
        }
        return text
    }
}


// ✅ Model
struct TourItem: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let imageName: String
}



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
}

#Preview {
    HomeView()
}
