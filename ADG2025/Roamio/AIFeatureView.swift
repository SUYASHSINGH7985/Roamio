// MARK: - AI Feature Page
import SwiftUI
struct AIFeatureView: View {
    var body: some View {
        VStack {
            Text("Welcome to AI Feature")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Here you can explore AI-powered tools and features.")
                .font(.body)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
        .navigationTitle("AI Feature")
        .navigationBarTitleDisplayMode(.inline)
    }
}
