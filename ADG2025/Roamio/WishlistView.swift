import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WishlistView()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                })
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct WishlistView: View {
    @State private var selectedSortOption = 0
    let sortOptions = ["Default", "Price: Low to High", "Price: High to Low", "Rating"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with icons
            HStack {
                Text("Wishlist")
                    .font(.system(size: 33, weight: .semibold))
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {}) {
                        Image("editwishlist")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    
                    Button(action: {}) {
                        Image("collection")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .background(Color.white)
            
            // Scrollable tags + Sort button
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(["Genting Highlands", "Chennai", "Attraction", "Tickets", "Tour & Experiences"], id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 16, weight: .light))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                )
                                .cornerRadius(15)
                        }
                    }
                    .padding(.leading, 16)
                }
                
                Spacer()
                
                Button(action: {
                    // Sort action
                }) {
                    Image("sort")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 25)
                }
                .padding(.trailing, 16)
            }
            .padding(.vertical, 12)
            .background(Color.white)
            
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
                    
                    Divider().padding(.leading, 16)
                    
                    WishlistItemView(
                        imageName:"Chennai Half Day_ Private Guided City Tour with Hotel Pickup",
                        title: "Chennai Half Day: Private Guided City Tour with Hotel Pickup",
                        location: "Chennai",
                        category: "City Tour",
                        rating: 5.0,
                        reviews: 4,
                        price: 103.89
                    )
                    
                    Divider().padding(.leading, 16)
                    
                    Text("That's all your wishes")
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
                .background(Color.white)
            }
            
            Spacer()
            
            // Bottom navigation bar
            HStack {
                BottomNavItem(icon: "house", title: "Home", isActive: false)
                BottomNavItem(icon: "heart", title: "Wishlist", isActive: true)
                BottomNavItem(icon: "tag", title: "Deals", isActive: false)
                BottomNavItem(icon: "suitcase", title: "Trips", isActive: false)
                BottomNavItem(icon: "person", title: "Account", isActive: false)
            }
            .frame(height: 56)
            .background(Color.white)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)),
                alignment: .top
            )
        }
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
        .edgesIgnoringSafeArea(.bottom)
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
                Image(imageName)   // <-- Use the image from Assets
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                    .clipped()    // ensures image stays within the frame

                Button(action: {}) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(red: 1.0, green: 0.27, blue: 0.32))
                        .padding(6)
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(6)
            }

            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15, weight: .regular))
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack(spacing: 4) {
                    Text(location)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Text("•")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Text(category)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    // Single star only
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 1.0, green: 0.76, blue: 0.03))
                    
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    Text("(\(reviews.formatted()))")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.top, 4)
                
                Text("From ₹\(price, specifier: "%.2f")")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .padding(.top, 8)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color.white)
    }
}

struct BottomNavItem: View {
    let icon: String
    let title: String
    let isActive: Bool
    
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: icon)
                .font(.system(size: 22))
            
            Text(title)
                .font(.system(size: 12))
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(isActive ? Color(red: 1.0, green: 0.27, blue: 0.32) : Color(red: 0.8, green: 0.8, blue: 0.8))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
