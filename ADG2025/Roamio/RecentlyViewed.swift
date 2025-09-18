import SwiftUI

struct RecentlyViewedView: View {
    @Environment(\.dismiss) private var dismiss   // lets us go back
    
    var body: some View {
        ZStack {
            // Global gradient background
            LinearGradient(
                gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Custom Header
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white) // contrast with gradient
                    }
                    
                    Spacer()
                    
                    Text("Recently viewed")
                        .font(.headline)
                        .foregroundColor(.white) // theme text
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    // Empty spacer for symmetry
                    Image(systemName: "chevron.left")
                        .opacity(0) // invisible placeholder
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                
                Divider()
                    .background(Color.dividerLine) // themed divider
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Earlier")
                            .font(.headline)
                            .foregroundColor(.white) // theme text
                            .padding(.horizontal)
                        
                        TicketCardView(
                            imageName: "gardens",
                            category: "Parks & gardens • Singapore",
                            title: "Gardens by the Bay Ticket",
                            instantConfirmation: true,
                            rating: 4.8,
                            reviews: 55770,
                            bookings: "2M+ booked",
                            price: "₹ 670",
                            voucher: nil
                        )
                        
                        TicketCardView(
                            imageName: "universall",
                            category: "Theme parks • Singapore",
                            title: "Universal Studios Singapore Ticket",
                            instantConfirmation: true,
                            rating: 4.8,
                            reviews: 104653,
                            bookings: "3M+ booked",
                            price: "₹ 4,679",
                            voucher: "Free voucher worth SG$15"
                        )
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarBackButtonHidden(true) // hide default back button
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TicketCardView: View {
    var imageName: String
    var category: String
    var title: String
    var instantConfirmation: Bool
    var rating: Double
    var reviews: Int
    var bookings: String
    var price: String
    var voucher: String?
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(category)
                    .font(.caption)
                    .foregroundColor(.textSecondary)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                if instantConfirmation {
                    Text("Instant confirmation")
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(4)
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                        .font(.caption)
                    Text("\(String(format: "%.1f", rating)) (\(reviews.formatted()))")
                        .font(.caption)
                        .foregroundColor(.white)
                    Text("• \(bookings)")
                        .font(.caption)
                        .foregroundColor(.textSecondary)
                }
                
                Text("From \(price)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                if let voucher = voucher {
                    Text(voucher)
                        .font(.caption2)
                        .foregroundColor(.red)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.red, lineWidth: 1)
                        )
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.cardBackground) // translucent card background
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}


#Preview {
    RecentlyViewedView()
}
