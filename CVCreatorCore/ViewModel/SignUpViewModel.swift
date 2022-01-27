import Foundation


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
    
    @Published public var alertErrorType: AlertErrorType?
    @Published public var isAlertPresented = false
    
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

        
        //for textFieldsViewModel in textFieldsViewModels {
        //    print(textFieldsViewModel.textFieldType.placeholder + ": " + textFieldsViewModel.inputText)
        //}
    }
    
    
    public enum AlertErrorType {
        case usernameIsEmpty
        case emailIsEmpty
        case passwordNotIdentical
        case emailNotConform
        case passwordIsEmpty
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
