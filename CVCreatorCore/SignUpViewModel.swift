import Foundation


public class SignUpViewModel: ObservableObject {
    public let socialNetworkButtonsGroupViewModel = SocialNetworkButtonsGroupViewModel(optionType: .signUp)
    
    public init() {
        
    }
}
