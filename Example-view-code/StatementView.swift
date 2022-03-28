//
//  StatementView.swift
//  Example-view-code
//
//  Created by Renan Toniolo Rocha on 27/03/22.
//

import Foundation
import UIKit

final class StatementView: UIViewController, UITableViewDelegate {
    
    // MARK: - Private Properties
    private let statementViewModel: StatementViewModel = StatementViewModel()
    var cards: [CardBalance]!
    
    // MARK: - Internal Properties
    internal lazy var viewStatement: UIView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var viewRecent: UIView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var cardsTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        //table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    internal lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.text = "Renan Toniolo Rocha"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var imageLogout: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .white
        image = UIImageView(image: UIImage(named: "logout-icon.png"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    internal lazy var labelAccount: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.text = "conta"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var labelAccountNumber: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24)
        label.text = "2050/01.111.222-4"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    internal lazy var labelBalance: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.text = "Saldo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var labelBalanceNumber: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24)
        label.text = "R$ 334,00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var labelTitleRecent: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        label.text = "Recentes"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle    
    override func loadView() {
        super.loadView()
        self.addSubViews()
        self.setupConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cards = self.statementViewModel.getCardBalance()
        self.view.backgroundColor = .blue
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Private
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            viewStatement.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            viewStatement.heightAnchor.constraint(equalToConstant: 200),
            viewStatement.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            viewStatement.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            viewRecent.topAnchor.constraint(equalTo: self.viewStatement.bottomAnchor, constant: 0),
            viewRecent.heightAnchor.constraint(equalToConstant: 40),
            viewRecent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewRecent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cardsTableView.topAnchor.constraint(equalTo: self.viewRecent.bottomAnchor, constant: 0),
            cardsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            cardsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            cardsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.viewStatement.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelName.leadingAnchor.constraint(equalTo: self.viewStatement.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            imageLogout.topAnchor.constraint(equalTo: self.viewStatement.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageLogout.heightAnchor.constraint(equalToConstant: 24),
            imageLogout.widthAnchor.constraint(equalToConstant: 24),
            imageLogout.trailingAnchor.constraint(equalTo: self.viewStatement.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            labelAccount.topAnchor.constraint(equalTo: self.labelName.bottomAnchor, constant: 16),
            labelAccount.leadingAnchor.constraint(equalTo: self.viewStatement.leadingAnchor, constant: 16),
            labelAccount.trailingAnchor.constraint(equalTo: self.viewStatement.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            labelAccountNumber.topAnchor.constraint(equalTo: self.labelAccount.bottomAnchor, constant: 4),
            labelAccountNumber.leadingAnchor.constraint(equalTo: self.viewStatement.leadingAnchor, constant: 16),
            labelAccountNumber.trailingAnchor.constraint(equalTo: self.viewStatement.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            labelBalance.topAnchor.constraint(equalTo: self.labelAccountNumber.bottomAnchor, constant: 16),
            labelBalance.leadingAnchor.constraint(equalTo: self.viewStatement.leadingAnchor, constant: 16),
            labelBalance.trailingAnchor.constraint(equalTo: self.viewStatement.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            labelBalanceNumber.topAnchor.constraint(equalTo: self.labelBalance.bottomAnchor, constant: 4),
            labelBalanceNumber.leadingAnchor.constraint(equalTo: self.viewStatement.leadingAnchor, constant: 16),
            labelBalanceNumber.trailingAnchor.constraint(equalTo: self.viewStatement.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            labelTitleRecent.leadingAnchor.constraint(equalTo: self.viewStatement.leadingAnchor, constant: 16),
            labelTitleRecent.centerYAnchor.constraint(equalTo: self.viewRecent.centerYAnchor),
        ])
    }
    
    private func addSubViews() {
        self.view.addSubview(viewStatement)
        self.view.addSubview(viewRecent)
        self.view.addSubview(cardsTableView)
        self.viewRecent.addSubview(labelTitleRecent)
        self.viewStatement.addSubview(labelName)
        self.viewStatement.addSubview(imageLogout)
        self.viewStatement.addSubview(labelAccount)
        self.viewStatement.addSubview(labelAccountNumber)
        self.viewStatement.addSubview(labelBalance)
        self.viewStatement.addSubview(labelBalanceNumber)
    }
}

extension StatementView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.cards[indexPath.row].typeName
        return cell
    }
}
