import SwiftUI

struct AllBookingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // "My bookings" dropdown placeholder
                HStack {
                    Text("My bookings")
                        .font(.title2)
                        .fontWeight(.bold)
                    Image(systemName: "chevron.down")
                    Spacer()
                }
                .padding(.horizontal)
                
                // "Nothing booked yet" section
                VStack(spacing: 16) {
                    Image(systemName: "suitcase.cart.fill") // Illustration from screenshot
                        .font(.system(size: 80))
                        .foregroundColor(.indigo) // Bluish-purple theme
                    
                    Text("Nothing booked yet!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Start planning your next adventure!")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    // NavigationLink styled as a button, leading to the placeholder ExploreView
                    NavigationLink(destination: ExploreView()) {
                        Text("Start exploring")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo) // Bluish-purple theme
                            .cornerRadius(14)
                    }
                    .padding(.horizontal)
                }
                
                // "Travelers' favorite choices" section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Travelers' favorite choices")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            FavoriteChoiceCard()
                            FavoriteChoiceCard()
                            FavoriteChoiceCard()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
        .navigationTitle("All bookings")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

// A helper view for the favorite choice cards shown on the AllBookingsView.
struct FavoriteChoiceCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 250, height: 150)
                .cornerRadius(12)
                .overlay(
                    Image(systemName: "photo.on.rectangle.angled") // Placeholder for image
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                )
            
            Text("Universal Studios Singapore Ticket")
                .font(.headline)
                .lineLimit(2)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.indigo) // Bluish-purple theme
                Text("4.8 (104,631)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 250)
    }
}

struct AllBookingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllBookingsView()
        }
    }
}


