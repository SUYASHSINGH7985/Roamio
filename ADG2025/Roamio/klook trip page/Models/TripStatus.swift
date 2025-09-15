import Foundation

// The CaseIterable protocol allows us to loop over all cases of the enum.
// The Identifiable protocol is required by SwiftUI's ForEach to uniquely identify elements.
enum TripStatus: String, CaseIterable, Identifiable {
    case upcoming = "Upcoming"
    case completed = "Completed"
    case cancelled = "Cancelled"
    
    // Conformance to Identifiable: Provides a stable identity for each instance.
    var id: String { self.rawValue }
}


