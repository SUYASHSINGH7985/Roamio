import SwiftUI

// A reusable view component for displaying a single trip card.
struct TripCardView: View {
    let trip: Trip
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "photo.on.rectangle.angled")
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(Color.white.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 8) {
                Text(trip.destination)
                    .font(.headline)
                
                Text(trip.date)
                    .font(.subheadline)
                    .opacity(0.8)
                
                Text(trip.status.rawValue)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .opacity(0.5)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
}

struct TripCardView_Previews: PreviewProvider {
    static var previews: some View {
        // This is the line that fixes the error.
        // We now provide an 'imageName' for the preview.
        TripCardView(trip: Trip(destination: "Paris, France", date: "Sep 20 - Sep 27, 2025", imageName: "paris", status: .upcoming))
            .padding()
            .background(Color.deepBlue)
    }
}


