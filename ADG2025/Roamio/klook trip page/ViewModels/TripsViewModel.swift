import Foundation

// This class acts as the "brain" for the TripsView, handling data and logic.
class TripsViewModel: ObservableObject {
    
    // @Published properties will automatically notify any listening views of changes.
    @Published var trips: [Trip] = []
    @Published var selectedStatus: TripStatus = .upcoming
    
    // A computed property that filters the trips based on the selected status.
    var filteredTrips: [Trip] {
        trips.filter { $0.status == selectedStatus }
    }
    
    init() {
        loadTrips()
    }
    
    // This function populates the initial trip data.
    // It now starts with an empty array as requested.
    func loadTrips() {
        self.trips = [] // Start with an empty list of trips.
        
        // You can add sample data here for testing if you wish, for example:
        /*
        self.trips = [
            Trip(destination: "Paris, France", date: "Sep 20, 2025", status: .upcoming, imageName: "airplane.departure"),
            Trip(destination: "Tokyo, Japan", date: "Oct 15, 2025", status: .upcoming, imageName: "airplane.departure"),
            Trip(destination: "London, UK", date: "May 12, 2025", status: .completed, imageName: "checkmark.seal.fill"),
            Trip(destination: "New York, USA", date: "Jun 05, 2025", status: .cancelled, imageName: "xmark.seal.fill")
        ]
        */
    }
}


