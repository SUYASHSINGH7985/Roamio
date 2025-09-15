import Foundation

// The Trip struct conforms to Identifiable so it can be used in SwiftUI lists.
struct Trip: Identifiable {
    let id = UUID() // Provides a unique identifier for each trip instance.
    let destination: String
    let date: String
    let status: TripStatus
    let imageName: String // System name for an SF Symbol to display.
}


