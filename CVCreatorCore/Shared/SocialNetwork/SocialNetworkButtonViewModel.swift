import Foundation
import Combine


public class SocialNetworkButtonViewModel: ObservableObject, Identifiable {
    public let id = UUID()
    
    public init(
        socialNetwork: SocialNetwork,
        didTapOnButton: @escaping (SocialNetwork) -> Void
    ) {
        self.socialNetwork = socialNetwork
        self.didTapOnButton = didTapOnButton
    }
    
    public let socialNetwork: SocialNetwork
    
    public let didTapOnButton: (SocialNetwork) -> Void
    
    
}
