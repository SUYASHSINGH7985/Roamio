//
//  AccountView.swift
//  Roamio
//
//  Created by Jeevaanandh Ilayaraja on 13/09/25.
//
import SwiftUI



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
            .background(Color(.systemGray6))
            .navigationTitle("Log in or sign up")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "person.circle")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}




struct RewardsCardView: View {
    var body: some View {
        HStack {
            Image(systemName: "r.square.fill") 
                .font(.title)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading) {
                Text("Klook Rewards")
                    .font(.headline)
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
    }
}




struct PromoKlookCashView: View {
    var body: some View {
        HStack(spacing: 0) {
            
            VStack {
                Text("-")
                    .font(.headline)
                Text("Promo codes")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
            
            
            VStack {
                Text("-")
                    .font(.headline)
                Text("KlookCash")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}




struct SettingsSectionView: View {
    var body: some View {
        VStack(spacing: 0) {
            SettingsRowView(iconName: "doc.text", title: "Bookings")
            Divider().padding(.leading, 50)
            SettingsRowView(iconName: "person", title: "My details", subtitle: "Manage your details for bookings, addresses...")
            Divider().padding(.leading, 50)
            SettingsRowView(iconName: "questionmark.circle", title: "Help Center")
            Divider().padding(.leading, 50)
            SettingsRowView(iconName: "gear", title: "Settings")
        }
        .background(Color.white)
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
                .foregroundColor(.black)
                .frame(width: 25)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
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




struct ReferralBannerView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Share joy & get rewarded")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Get ₹400 for each successful referral!")
                    .font(.subheadline)
                
                Button("See details") {
                    // Action for button
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.top, 4)
            }
            
            Spacer()
            
            Image(systemName: "gift.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
        }
        .padding()
        .background(Color(UIColor.systemBlue).opacity(0.1))
        .cornerRadius(12)
    }
}




struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        AccountView()
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Account")
            }
    }
}
