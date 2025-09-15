import SwiftUI

// A view to show when there are no trips in a category.
struct NoTripsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "suitcase.fill")
                .font(.system(size: 60))
                .foregroundColor(.white) // Changed color to white
            
            Text("No upcoming trips...yet!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct NoTripsView_Previews: PreviewProvider {
    static var previews: some View {
        NoTripsView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.deepBlue)
    }
}


