import SwiftUI

struct TripsView: View {
    @StateObject private var viewModel = TripsViewModel()
    
    // Updated blue-purple gradient for the header
    private var backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.blue, Color.indigo]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    init() {
        // Configure the navigation bar appearance to be transparent and have black text
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        // Set the appearance for all states
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
        // Set the tint color for navigation bar items (like our button) to black
        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Header with Gradient
                VStack {
                    Picker("Trip Status", selection: $viewModel.selectedStatus) {
                        ForEach(TripStatus.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                .background(backgroundGradient)
                
                // ZStack to correctly layer the list and the empty state view
                ZStack {
                    // List is in the background and only shows its content
                    List {
                        ForEach(viewModel.filteredTrips) { trip in
                            NavigationLink(destination: Text("Trip Details for \(trip.destination)")) {
                                TripCardView(trip: trip)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    // Show the placeholder view on top if the list is empty
                    if viewModel.filteredTrips.isEmpty {
                        NoTripsView()
                    }
                }
                .animation(.default, value: viewModel.selectedStatus) // Animate tab changes
            }
            .navigationTitle("My Trips")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AllBookingsView()) {
                        Image(systemName: "calendar.badge.plus")
                            .font(.title2)
                    }
                }
            }
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
        // The dark theme for the preview has been removed to default to light mode.
    }
}


