import Foundation
import SwiftUI


public enum SocialNetwork: CaseIterable {
    case google
    case facebook
    case twitter
    case apple
    
    public var imageName: String {
        switch self {
        case .google: return ImageName.socialNetworkGoogleIcon
        case .facebook: return ImageName.socialNetworkFacebookIcon
        case .twitter: return ImageName.socialNetworkTwitterIcon
        case .apple: return ImageName.socialNetworkAppleIcon
        }
    }
    
    public var color: Color {
        switch self {
        case .google: return .white
        case .facebook: return Color(red: 0.233, green: 0.348, blue: 0.594)
        case .twitter: return Color(red: -0.31, green: 0.679, blue: 0.946)
        case .apple: return .black
        }
    }
}
