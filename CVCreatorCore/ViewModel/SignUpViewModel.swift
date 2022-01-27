import Foundation


@MainActor
public class SignUpViewModel: ObservableObject {
    
    public let navigationTitle = StringKeys.loginNavigationTitle
    
    public lazy var textFieldsViewModels: [CVCreatorTextFieldViewModel] = [
        userNameTextFieldViewModel,
        emailTextFieldViewModel,
        passwordTextFieldViewModel,
        passwordConfimTextFieldViewModel
    ]
    
    
    private let userNameTextFieldViewModel = CVCreatorTextFieldViewModel(
        textFieldType: .username
    )
    
    private let emailTextFieldViewModel = CVCreatorTextFieldViewModel(
        textFieldType: .email
    )
    
    private let passwordTextFieldViewModel = CVCreatorTextFieldViewModel(
        textFieldType: .password
    )
    
    private let passwordConfimTextFieldViewModel = CVCreatorTextFieldViewModel(
        textFieldType: .passwordConfirmation
    )
    
    
    public init() {
        
    }
    
    // public init(rootViewModel: RootViewModel) {
    //     self.rootViewModel = rootViewModel
    // }
    
    //private let rootViewModel: RootViewModel
    
    public func goToMain() {
        //rootViewModel.presentedRootViewType = .main
    }
    
    @Published public var alertErrorType: AlertErrorType? {
        didSet {
            textFieldsViewModels.forEach {
                $0.hasError = false
            }
            
            guard let alertErrorType = alertErrorType else {
                return
            }
            
            switch alertErrorType {
            case .usernameIsEmpty:
                userNameTextFieldViewModel.hasError = true
            case .emailIsEmpty:
                emailTextFieldViewModel.hasError = true
            case .passwordNotIdentical:
                passwordTextFieldViewModel.hasError = true
                passwordConfimTextFieldViewModel.hasError = true
            case .emailNotConform:
                emailTextFieldViewModel.hasError = true
            case .passwordIsEmpty:
                passwordTextFieldViewModel.hasError = true
            case .failedToSignUp:
                break
            }
        }
    }
    @Published public var isAlertPresented = false
    
    @Published public var isLoading = false
    
    public func submit() {
        let username = userNameTextFieldViewModel.inputText
        guard !username.isEmpty else {
            alertErrorType = .usernameIsEmpty
            isAlertPresented = true
            return
        }
        
        let email = emailTextFieldViewModel.inputText
        guard !email.isEmpty else {
            alertErrorType = .emailIsEmpty
            isAlertPresented = true
            return
        }
        
        let password = passwordTextFieldViewModel.inputText
        guard !password.isEmpty else {
            alertErrorType = .passwordIsEmpty
            isAlertPresented = true
            return
        }
        
        let password1 = passwordTextFieldViewModel.inputText
        let password2 = passwordConfimTextFieldViewModel.inputText
        guard password1 == password2 else {
            alertErrorType = .passwordNotIdentical
            isAlertPresented = true
            return
        }
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = emailTextFieldViewModel.inputText.range(
            of: emailPattern,
            options: .regularExpression
        )

        let validEmail = (result != nil)
        guard validEmail else {
            alertErrorType = .emailNotConform
            isAlertPresented = true
            return
        }
        
        isLoading.toggle()
        
        Task {
            
            do {
                let isSignedUp = try await authenticationService.signUp(username: username, email: email, password: password1)
                if isSignedUp {
                    print("SHOULD GO TO MAIN APP SECTION")
                } else {
                    alertErrorType = .failedToSignUp
                    isAlertPresented = true
                }
            } catch {
                alertErrorType = .failedToSignUp
                isAlertPresented = true
            }
            
            
            isLoading.toggle()
        }
        

        
        //for textFieldsViewModel in textFieldsViewModels {
        //    print(textFieldsViewModel.textFieldType.placeholder + ": " + textFieldsViewModel.inputText)
        //}
    }
    
    
    
    private let authenticationService = AuthenticationService.shared
    
    
    
    public enum AlertErrorType {
        case usernameIsEmpty
        case emailIsEmpty
        case passwordNotIdentical
        case emailNotConform
        case passwordIsEmpty
        case failedToSignUp
        // other cases here
        
        public var alertTitle: String {
            switch self {
            case .usernameIsEmpty:
                return "Username is empty"
            case .emailIsEmpty:
                return "Email is empty"
            case .passwordNotIdentical:
                return "Password not identical"
            case .emailNotConform:
                return "Email not conform"
            case .passwordIsEmpty:
                return "Password is empty"
            case .failedToSignUp:
                return "Failed to signup"
                
            }
        }
    }
}
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
