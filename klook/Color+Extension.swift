import SwiftUI

// MARK: - Colors Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    // MARK: - Brand Colors
    static let lightBlue = Color(hex: "84CEF4") // gradient start
    static let deepBlue  = Color(hex: "8052FF") // gradient end
    static let violet    = Color(hex: "8052FF") // alias for deepBlue if needed

    // MARK: - Themed UI Colors
    static let cardBackground    = Color.white.opacity(0.15) // Rewards, settings cards
    static let bannerBackground  = Color.white.opacity(0.2)  // Referral banner
    static let dividerLine       = Color.white.opacity(0.3)  // Divider lines
    static let textSecondary     = Color.white.opacity(0.8)  // Subtitles / secondary text
    static let iconSecondary     = Color.white.opacity(0.7)  // Chevron / secondary icons
}
