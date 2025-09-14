import SwiftUI

struct NoTripsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // Updated icon to suitcase and color to match the bluish-purple theme
            Image(systemName: "suitcase.fill")
                .font(.system(size: 60))
                .foregroundColor(.indigo)
            
            Text("No upcoming trips...yet!")
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding()
    }
}

struct NoTripsView_Previews: PreviewProvider {
    static var previews: some View {
        NoTripsView()
    }
}


