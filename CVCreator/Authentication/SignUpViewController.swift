//
//  SignUpViewController.swift
//  CVCreator
//
//  Created by Nathan on 20/01/2022.
//

import UIKit
import CVCreatorCore

import Combine
import SwiftUI

class SignUpViewController: UIViewController {
    
    let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        view.addSubview(formStackView)
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            formStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            formStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            formStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            formStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        viewModel.objectWillChange
            .sink {
                print("IL Y A EU UN CHANGE;ENT DASN LE VIEWMODEL (ou l'ubne de ces published properties)")
                
            }
            .store(in: &subscriptions)
        
        
        
        for (index, textFieldViewModel) in viewModel.textFieldsViewModels.enumerated() {
            
            let textField = UITextField()
            textField.tag = index
            
            textField.placeholder = textFieldViewModel.placeholder
            textField.isSecureTextEntry = textFieldViewModel.isSecured
            textField.keyboardType = textFieldViewModel.textFieldType.associatedKeyboardType
            
            textFieldViewModel.$inputText
                .receive(on: RunLoop.main)
                .map { Optional($0) }
                .assign(to: \.text, on: textField)
                //.sink { textField.text = $0 }
                .store(in: &subscriptions)
            
     
            
            textField.addTarget(self, action: #selector(updateTextField(textField:)), for: .editingChanged)
            
            
            formStackView.addArrangedSubview(textField)
        }
        
        let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(didTapOnSubmitButton(button:)), for: .touchUpInside)
        submitButton.backgroundColor = .blue
        submitButton.setTitleColor(.white, for: .normal)
        
        formStackView.addArrangedSubview(submitButton)
    }
    
    @objc private func updateTextField(textField: UITextField) {
        viewModel.textFieldsViewModels[textField.tag].inputText = textField.text ?? ""
    }
    
    @objc private func didTapOnSubmitButton(button: UIButton) {
        viewModel.submit()
    }
    
    
    lazy var formStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        
        return stackView
    }()
    
    
    private var subscriptions: Set<AnyCancellable> = []
    
    
   
}





struct SignUpViewControllerSwiftUIView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some SignUpViewController {
        let signUpViewController = SignUpViewController()
        return signUpViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
