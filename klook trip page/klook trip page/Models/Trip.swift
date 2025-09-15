import Foundation

// Defines the structure for a single trip.
struct Trip: Identifiable {
    let id = UUID()
    let destination: String
    let date: String
    let imageName: String // This property is required.
    let status: TripStatus
}


