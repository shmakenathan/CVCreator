import Foundation


public class SocialNetworkButtonsGroupViewModel: ObservableObject {
    
    public enum OptionType {
        case login
        case signUp
    }
    
    
    public init(
        optionType: SocialNetworkButtonsGroupViewModel.OptionType
    ) {
        self.optionType = optionType
    }
    
    private let optionType: OptionType
    
    public lazy var socialNetworkButtonViewModels: [SocialNetworkButtonViewModel] = SocialNetwork.allCases.map { socialNetwork in
        SocialNetworkButtonViewModel(
            socialNetwork: socialNetwork,
            didTapOnButton: { [weak self] socialNetwork in
                print("Did tap on \(socialNetwork.imageName) social network button 🤡")
                self?.triggerProcess(socialNetwork: socialNetwork)
              
            }
        )
    }
    
    
    
    private func triggerProcess(socialNetwork: SocialNetwork ) {
        switch (socialNetwork, optionType) {
        case (.google, .login):
            logInWithGoogle()
        case (.google, .signUp):
            signUpWithGoogle()
            
        case (.facebook, .login):
            logInWithFacebook()
        case (.facebook, .signUp):
            signUpWithFacebook()
            
        case (.twitter, .login):
            logInWithTwitter()
        case (.twitter, .signUp):
            signUpWithTwitter()
        case (.apple, .login):
            logInWithApple()
        case (.apple, .signUp):
            signUpWithApple()
        }
    }
    
    private func logInWithGoogle() {
        
    }
    
    
    private func signUpWithGoogle() {
        
    }
    
    private func logInWithApple() {
        
    }
    private func signUpWithApple() {
        
    }
    
    private func logInWithFacebook() {
        
    }
    
    
    private func signUpWithFacebook() {
        
    }
    
    
    
    private func logInWithTwitter() {
        
    }
    
    
    private func signUpWithTwitter() {
        
    }
    
    
}
