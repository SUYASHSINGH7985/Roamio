import SwiftUI

// A placeholder view for the Explore menu.
// This is where you will merge your colleague's work.
struct ExploreView: View {
    var body: some View {
        Text("Explore Menu")
            .font(.largeTitle)
            .navigationTitle("Explore")
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreView()
        }
    }
}


