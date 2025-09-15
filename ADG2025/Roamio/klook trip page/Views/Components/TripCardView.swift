import SwiftUI

struct TripCardView: View {
    let trip: Trip
    
    var body: some View {
        HStack {
            Image(systemName: trip.imageName)
                .font(.largeTitle)
                .foregroundColor(.indigo)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(trip.destination)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(trip.date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}


