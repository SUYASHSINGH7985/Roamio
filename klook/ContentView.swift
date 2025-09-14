import SwiftUI

// Custom Color Extension from Hex
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Deal model
struct Deal: Identifiable {
    let id = UUID()
    let country: String
    let location: String
    let title: String
    let discount: String
    let price: String
    let imageName: String
}

struct ContentView: View {
    
    let countries = ["Malaysia", "UAE", "India", "Vietnam", "Singapore", "Thailand", "Japan", "Korea"]
    let filters = ["Location", "All", "Tours & experiences"]
    
    let deals: [Deal] = [
        // Malaysia
        Deal(country: "Malaysia", location: "Kuala Lumpur", title: "Aquaria KLCC Ticket", discount: "5% off", price: "₹953", imageName: "aquaria"),
        Deal(country: "Malaysia", location: "Genting Highlands", title: "Premium Outlets Cable Car", discount: "10% off", price: "₹231", imageName: "genting"),
        Deal(country: "Malaysia", location: "Selangor", title: "Zoo Negara Ticket", discount: "8% off", price: "₹520", imageName: "zoo"),
        Deal(country: "Malaysia", location: "Johor Bahru", title: "LEGOLAND Malaysia Ticket", discount: "8% off", price: "₹1200", imageName: "legoland"),
        
        // UAE
        Deal(country: "UAE", location: "Dubai", title: "Burj Khalifa Observation Deck", discount: "15% off", price: "₹1800", imageName: "burj"),
        Deal(country: "UAE", location: "Abu Dhabi", title: "Ferrari World Ticket", discount: "12% off", price: "₹1500", imageName: "ferrari"),
        Deal(country: "UAE", location: "Sharjah", title: "Sharjah Museum Entry", discount: "10% off", price: "₹300", imageName: "sharjah"),
        Deal(country: "UAE", location: "Ajman", title: "Beach Resort Package", discount: "8% off", price: "₹500", imageName: "ajman"),
        
        // India
        Deal(country: "India", location: "Delhi", title: "Red Fort Tour", discount: "10% off", price: "₹400", imageName: "redfort"),
        Deal(country: "India", location: "Agra", title: "Taj Mahal Entry", discount: "15% off", price: "₹550", imageName: "taj"),
        Deal(country: "India", location: "Jaipur", title: "Amber Fort Visit", discount: "12% off", price: "₹350", imageName: "amber"),
        Deal(country: "India", location: "Mumbai", title: "Marine Drive Cruise", discount: "8% off", price: "₹600", imageName: "marine"),
        
        // Vietnam
        Deal(country: "Vietnam", location: "Hanoi", title: "Old Quarter Tour", discount: "10% off", price: "₹200", imageName: "hanoi"),
        Deal(country: "Vietnam", location: "Ho Chi Minh City", title: "Cu Chi Tunnels", discount: "12% off", price: "₹250", imageName: "cu_chi"),
        Deal(country: "Vietnam", location: "Da Nang", title: "Golden Bridge Visit", discount: "8% off", price: "₹300", imageName: "danang"),
        Deal(country: "Vietnam", location: "Hoi An", title: "Ancient Town Tour", discount: "10% off", price: "₹220", imageName: "hoian"),
    ]
    
    let lightBlue = Color(hex: "84CEF4")
    let deepBlue  = Color(hex: "8052FF")
    let violet    = Color(hex: "8052FF")
    
    @State private var selectedCountry: String = "Malaysia"
    @State private var selectedFilter: String? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [lightBlue, deepBlue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Deals")
                            .font(.largeTitle).bold()
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(countries, id: \.self) { country in
                                    Text(country)
                                        .font(.subheadline).bold()
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(selectedCountry == country ? violet : .white)
                                        .clipShape(Capsule())
                                        .foregroundColor(selectedCountry == country ? .white : .black)
                                        .onTapGesture {
                                            selectedCountry = country
                                        }
                                }
                            }
                        }
                        
                        Text("Ongoing Promotions")
                            .font(.title2).bold()
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(filters, id: \.self) { filter in
                                    Text(filter)
                                        .font(.subheadline).bold()
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(selectedFilter == filter ? violet : .white)
                                        .clipShape(Capsule())
                                        .foregroundColor(selectedFilter == filter ? .white : .black)
                                        .onTapGesture {
                                            selectedFilter = (selectedFilter == filter ? nil : filter)
                                        }
                                }
                            }
                        }
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(deals.filter { $0.country == selectedCountry }) { deal in
                                VStack(alignment: .leading, spacing: 8) {
                                    Image(deal.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 150)
                                        .clipped()
                                        .cornerRadius(15)
                                    
                                    HStack(spacing: 4) {
                                        Image(systemName: "mappin.and.ellipse")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text(deal.location)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text(deal.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text("Combo • \(deal.discount)")
                                        .font(.caption)
                                        .foregroundColor(lightBlue)
                                    
                                    Text("From \(deal.price)")
                                        .font(.subheadline).bold()
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(18)
                            }
                        }
                        .padding(.bottom, 80)
                    }
                    .padding()
                }
                
                // Thinner Bottom Navigation Bar
                HStack {
                    Spacer()
                    navItem(icon: "house.fill", label: "Home")
                    Spacer()
                    navItem(icon: "tag.fill", label: "Deals", active: true)
                    Spacer()
                    navItem(icon: "heart.fill", label: "Wishlist")
                    Spacer()
                    navItem(icon: "briefcase.fill", label: "Trips")
                    Spacer()
                    navItem(icon: "person.crop.circle", label: "Account")
                    Spacer()
                }
                .frame(height: 60) // Reduced height here
                .background(Color.white)
            }
        }
    }
    
    private func navItem(icon: String, label: String, active: Bool = false) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(active ? violet : .black)
            Text(label)
                .font(.caption2)
                .foregroundColor(active ? violet : .black)
        }
    }
}

#Preview {
    ContentView()
}
