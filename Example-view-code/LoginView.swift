//
//  LoginView.swift
//  Example-view-code
//
//  Created by Renan Rocha on 05/12/21.
//

import UIKit

final class LoginView: UIViewController {

    // MARK: - Internal Properties
    internal lazy var imgLogo: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "Logo.png"))
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    internal lazy var userText: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.placeholder = "e-mail"
        text.keyboardType = .emailAddress
        text.layer.cornerRadius = 3
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    internal lazy var passwordText: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.placeholder = "senha"
        text.isSecureTextEntry = true
        text.layer.cornerRadius = 3
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    internal lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.tintColor = .red
        button.setTitle("Entrar", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(didTapEnter), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Action
    @objc
    func didTapEnter() {
        print("Entrei")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.addSubViews()
        self.setupConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    // MARK: - Private
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            imgLogo.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imgLogo.heightAnchor.constraint(equalToConstant: 48),
            imgLogo.widthAnchor.constraint(equalToConstant: 128),
            imgLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userText.heightAnchor.constraint(equalToConstant: 36),
            userText.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 24),
            userText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            userText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            passwordText.heightAnchor.constraint(equalToConstant: 36),
            passwordText.topAnchor.constraint(equalTo: userText.bottomAnchor, constant: 24),
            passwordText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            passwordText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 48),
            button.widthAnchor.constraint(equalToConstant: 128),
            button.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 34),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func addSubViews() {
        self.view.addSubview(imgLogo)
        self.view.addSubview(userText)
        self.view.addSubview(passwordText)
        self.view.addSubview(button)
    }
}
