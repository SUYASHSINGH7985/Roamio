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
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text("Roamio Rewards")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Get rewarded for exploring and enjoy exclusive deals")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

// MARK: - Promo Klook Cash
struct PromoKlookCashView: View {
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Text("-")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Promo codes")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Text("-")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("RoamioCash")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

// MARK: - Settings Section
struct SettingsSectionView: View {
    var body: some View {
        VStack(spacing: 0) {
            SettingsRowView(iconName: "doc.text", title: "Bookings")
            Divider().background(Color.gray.opacity(0.3)).padding(.leading, 50)
            SettingsRowView(iconName: "person", title: "My details", subtitle: "Manage your details for bookings, addresses...")
            Divider().background(Color.gray.opacity(0.3)).padding(.leading, 50)
            SettingsRowView(iconName: "questionmark.circle", title: "Help Center")
            Divider().background(Color.gray.opacity(0.3)).padding(.leading, 50)
            SettingsRowView(iconName: "gear", title: "Settings")
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
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
                .foregroundColor(.blue)
                .frame(width: 25)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .foregroundColor(.black)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
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
                    .foregroundColor(.black)
                
                Text("Get ₹400 for each successful referral!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button("See details") {
                    // Action
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.lightBlue, .deepBlue]),
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
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

// MARK: - Preview
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
