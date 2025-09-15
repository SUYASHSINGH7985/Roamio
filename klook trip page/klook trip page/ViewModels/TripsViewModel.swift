import Foundation
import Combine

// Manages the state and logic for the TripsView.
class TripsViewModel: ObservableObject {
    @Published var allTrips: [Trip] = []
    @Published var selectedStatus: TripStatus = .upcoming
    
    var filteredTrips: [Trip] {
        allTrips.filter { $0.status == selectedStatus }
    }
    
    init() {
        loadTrips()
    }
    
    // Loads the trips. Starts empty as requested.
    func loadTrips() {
        // This starts with an empty array. You can later replace this
        // with a network call or database fetch.
        self.allTrips = []
    }
}


