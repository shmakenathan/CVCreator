import Foundation


public enum SocialNetwork: CaseIterable {
    case google
    case facebook
    case twitter
    
    public var imageName: String {
        switch self {
        case .google: return ImageName.socialNetworkGoogleIcon
        case .facebook: return ImageName.socialNetworkFacebookIcon
        case .twitter: return ImageName.socialNetworkTwitterIcon
        }
    }
}
