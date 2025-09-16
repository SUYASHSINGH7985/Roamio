import SwiftUI

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

struct DealsPage: View {
    
    let countries = ["Malaysia", "UAE", "India", "Vietnam"]
    let filters = ["Location", "All", "Tours & experiences"]
    
    let deals: [Deal] = [
        // Malaysia
        Deal(country: "Malaysia", location: "Kuala Lumpur", title: "Aquaria KLCC Ticket", discount: "5% off", price: "₹953", imageName: "89"),
        Deal(country: "Malaysia", location: "Genting Highlands", title: "Premium Outlets Cable Car", discount: "10% off", price: "₹231", imageName: "premiumoutlest"),
        Deal(country: "Malaysia", location: "Selangor", title: "Zoo Negara Ticket", discount: "8% off", price: "₹520", imageName: "zoonegara"),
        Deal(country: "Malaysia", location: "Johor Bahru", title: "LEGOLAND Malaysia Ticket", discount: "8% off", price: "₹1200", imageName: "legolandmalaysia"),
        
        // UAE
        Deal(country: "UAE", location: "Dubai", title: "Burj Khalifa Observation Deck", discount: "15% off", price: "₹1800", imageName:  "04_Burj+Khalifa"),
        Deal(country: "UAE", location: "Abu Dhabi", title: "Ferrari World Ticket", discount: "12% off", price: "₹1500", imageName: "ferrariworldticket"),
        Deal(country: "UAE", location: "Sharjah", title: "Sharjah Museum Entry", discount: "10% off", price: "₹300", imageName: "sharjah"),
        Deal(country: "UAE", location: "Ajman", title: "Beach Resort Package", discount: "8% off", price: "₹500", imageName: "beachresortpackage"),
        
        // India
        Deal(country: "India", location: "Delhi", title: "Red Fort Tour", discount: "10% off", price: "₹400", imageName: "redfort"),
        Deal(country: "India", location: "Agra", title: "Taj Mahal Entry", discount: "15% off", price: "₹550", imageName: "taj"),
        Deal(country: "India", location: "Jaipur", title: "Amber Fort Visit", discount: "12% off", price: "₹350", imageName: "Amberpalace"),
        Deal(country: "India", location: "Mumbai", title: "Marine Drive Cruise", discount: "8% off", price: "₹600", imageName: "marinedrive"),
        
        // Vietnam
        Deal(country: "Vietnam", location: "Hanoi", title: "Old Quarter Tour", discount: "10% off", price: "₹200", imageName: "oldquarter"),
        Deal(country: "Vietnam", location: "Ho Chi Minh City", title: "Cu Chi Tunnels", discount: "12% off", price: "₹250", imageName: "tunnels"),
        Deal(country: "Vietnam", location: "Da Nang", title: "Golden Bridge Visit", discount: "8% off", price: "₹300", imageName: "goldenbridge"),
        Deal(country: "Vietnam", location: "Hoi An", title: "Ancient Town Tour", discount: "10% off", price: "₹220", imageName: "ancienttown"),
    ]
    
    @State private var selectedCountry: String = "Malaysia"
    @State private var selectedFilter: String? = nil
    
    var body: some View {
        ZStack {
            // ✅ Use your global theme colors
            LinearGradient(
                colors: [.lightBlue, .deepBlue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Deals")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    
                    // Country selection
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(countries, id: \.self) { country in
                                Text(country)
                                    .font(.subheadline).bold()
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCountry == country ? Color.deepBlue : .white)
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
                    
                    // Filters
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(filters, id: \.self) { filter in
                                Text(filter)
                                    .font(.subheadline).bold()
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedFilter == filter ? Color.deepBlue : .white)
                                    .clipShape(Capsule())
                                    .foregroundColor(selectedFilter == filter ? .white : .black)
                                    .onTapGesture {
                                        selectedFilter = (selectedFilter == filter ? nil : filter)
                                    }
                            }
                        }
                    }
                    
                    // Deals grid
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
                                    .foregroundColor(.lightBlue)
                                
                                Text("From \(deal.price)")
                                    .font(.subheadline).bold()
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(18)
                        }
                    }
                    .padding(.bottom, 80)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DealsPage()
}
