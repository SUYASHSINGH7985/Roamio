import SwiftUI

// MARK: - Account View
struct AccountView: View {
    init() {
        // Transparent navigation bar with white text
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
                    gradient: Gradient(colors: [
                        Color(red: 135/255, green: 206/255, blue: 250/255), // Sky Blue (light)
                        Color(red: 72/255, green: 61/255, blue: 139/255),   // Deep Slate Blue (contrast)
                        Color(red: 138/255, green: 43/255, blue: 226/255)   // Medium Violet
                    ]),
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
                    .foregroundColor(.white.opacity(0.9))
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.white.opacity(0.2)) // More visible card
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
                    .foregroundColor(.white.opacity(0.9))
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Text("-")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("KlookCash")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(12)
    }
}

// MARK: - Settings Section
struct SettingsSectionView: View {
    var body: some View {
        VStack(spacing: 0) {
            SettingsRowView(iconName: "doc.text", title: "Bookings")
            Divider().background(Color.white.opacity(0.4)).padding(.leading, 50)
            SettingsRowView(iconName: "person", title: "My details", subtitle: "Manage your details for bookings, addresses...")
            Divider().background(Color.white.opacity(0.4)).padding(.leading, 50)
            SettingsRowView(iconName: "questionmark.circle", title: "Help Center")
            Divider().background(Color.white.opacity(0.4)).padding(.leading, 50)
            SettingsRowView(iconName: "gear", title: "Settings")
        }
        .background(Color.white.opacity(0.2))
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
                        .foregroundColor(.white.opacity(0.85))
                }
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.8))
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
                    .foregroundColor(.white.opacity(0.9))
                
                Button("See details") {
                    // Action
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 135/255, green: 206/255, blue: 250/255),
                            Color(red: 72/255, green: 61/255, blue: 139/255),
                            Color(red: 138/255, green: 43/255, blue: 226/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.top, 4)
            }
            
            Spacer()
            
            Image(systemName: "gift.fill")
                .font(.system(size: 50))
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.white.opacity(0.25))
        .cornerRadius(12)
    }
}

// MARK: - Preview
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
