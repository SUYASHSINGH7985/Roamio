//
//  AccountView.swift
//  Roamio
//
//  Created by Jeevaanandh Ilayaraja on 13/09/25.
//
import SwiftUI

// MARK: - Account View
struct AccountView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    RewardsCardView()
                    PromoKlookCashView()
                    SettingsSectionView()
                    ReferralBannerView()
                    Spacer()
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("Log in or sign up")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "person.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

// MARK: - Rewards Card
struct RewardsCardView: View {
    var body: some View {
        HStack {
            Image(systemName: "r.square.fill")
                .font(.title)
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text("Roamio Rewards")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Get rewarded for exploring and enjoy exclusive deals")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(.white.opacity(0.15)) // translucent card
        .cornerRadius(12)
    }
}
// MARK: - Promo Klook Cash
struct PromoKlookCashView: View {
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Text("-")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Promo codes")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Text("-")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("KlookCash")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(.white.opacity(0.15))
        .cornerRadius(12)
    }
}

// MARK: - Settings Section
struct SettingsSectionView: View {
    var body: some View {
        VStack(spacing: 0) {
            SettingsRowView(iconName: "doc.text", title: "Bookings")
            Divider().background(Color.white.opacity(0.3)).padding(.leading, 50)
            SettingsRowView(iconName: "person", title: "My details", subtitle: "Manage your details for bookings, addresses...")
            Divider().background(Color.white.opacity(0.3)).padding(.leading, 50)
            SettingsRowView(iconName: "questionmark.circle", title: "Help Center")
            Divider().background(Color.white.opacity(0.3)).padding(.leading, 50)
            SettingsRowView(iconName: "gear", title: "Settings")
        }
        .background(.white.opacity(0.15))
        .cornerRadius(12)
    }
}

struct SettingsRowView: View {
    let iconName: String
    let title: String
    var subtitle: String? = nil
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundColor(.white)
                .frame(width: 25)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .foregroundColor(.white)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
    }
}

// MARK: - Referral Banner
struct ReferralBannerView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Share joy & get rewarded")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Get ₹400 for each successful referral!")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                
                Button("See details") {
                    // Action for button
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(.white)
                .foregroundColor(.deepBlue)
                .cornerRadius(20)
                .padding(.top, 4)
            }
            
            Spacer()
            
            Image(systemName: "gift.fill")
                .font(.system(size: 50))
                .foregroundColor(.white)
        }
        .padding()
        .background(.white.opacity(0.2))
        .cornerRadius(12)
    }
}

// MARK: - Colors Extension
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

    static let lightBlue = Color(hex: "84CEF4")
    static let deepBlue  = Color(hex: "8052FF")
    static let violet    = Color(hex: "8052FF")
}

// MARK: - Preview
struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        AccountView()
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Account")
            }
    }
}
