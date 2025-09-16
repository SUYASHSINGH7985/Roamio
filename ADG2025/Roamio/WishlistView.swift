import SwiftUI

struct WishlistView: View {
    @State private var selectedSortOption = 0
    let sortOptions = ["Default", "Price: Low to High", "Price: High to Low", "Rating"]
    
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with icons
                HStack {
                    Text("Wishlist")
                        .font(.system(size: 33, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            Image(systemName: "pencil")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.deepBlue.opacity(0.7))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "folder")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.deepBlue.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                // Scrollable tags + Sort button
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(["Genting Highlands", "Chennai", "Attraction", "Tickets", "Tour & Experiences"], id: \.self) { tag in
                                Text(tag)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(Color.deepBlue.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.leading, 16)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Sort action
                    }) {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.deepBlue.opacity(0.7))
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                }
                .padding(.vertical, 12)
                
                // Wishlist items
                ScrollView {
                    VStack(spacing: 0) {
                        WishlistItemView(
                            imageName: "KlookPassGentingHighlands",
                            title: "Genting Skyworlds Theme Park Ticket In Genting Highlands",
                            location: "Genting Highlands",
                            category: "Theme Park",
                            rating: 4.6,
                            reviews: 7824,
                            price: 39.55
                        )
                        
                        Divider()
                            .background(Color.white.opacity(0.3))
                            .padding(.horizontal, 16)
                        
                        WishlistItemView(
                            imageName:"Chennai Half Day_ Private Guided City Tour with Hotel Pickup",
                            title: "Chennai Half Day: Private Guided City Tour with Hotel Pickup",
                            location: "Chennai",
                            category: "City Tour",
                            rating: 5.0,
                            reviews: 4,
                            price: 103.89
                        )
                        
                        Divider()
                            .background(Color.white.opacity(0.3))
                            .padding(.horizontal, 16)
                        
                        Text("That's all your wishes")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true) // This hides the default navigation bar
    }
}

struct WishlistItemView: View {
    let imageName: String
    let title: String
    let location: String
    let category: String
    let rating: Double
    let reviews: Int
    let price: Double
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Image with heart inside
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                    .clipped()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.5), lineWidth: 2)
                    )

                Button(action: {}) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.deepBlue)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(6)
            }

            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text(location)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("•")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text(category)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("(\(reviews.formatted()))")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 4)
                
                Text("From ₹\(price, specifier: "%.2f")")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 8)
                
                Button(action: {}) {
                    Text("View Details")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.deepBlue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .cornerRadius(15)
                }
                .padding(.top, 4)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color.deepBlue.opacity(0.5))
        .cornerRadius(16)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
