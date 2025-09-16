import SwiftUI

// The main screen of your app.
struct TripsView: View {
    @StateObject private var viewModel = TripsViewModel()
    
    // Defines the gradient for the background.
    private var backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.lightBlue, Color.deepBlue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Configures the appearance of the navigation bar.
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Picker("Trip Status", selection: $viewModel.selectedStatus) {
                        ForEach(TripStatus.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if viewModel.filteredTrips.isEmpty {
                        NoTripsView()
                            .frame(maxHeight: .infinity) // Ensures it centers
                    } else {
                        List {
                            ForEach(viewModel.filteredTrips) { trip in
                                NavigationLink(destination: Text("Trip Details for \(trip.destination)")) {
                                    TripCardView(trip: trip)
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .background(Color.clear)
                    }
                }
                .navigationTitle("My Trips")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AllBookingsView()) {
                            Image(systemName: "calendar.badge.plus")
                                .font(.title2)
                                .foregroundColor(.white) // White icon
                        }
                    }
                }
            }
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
