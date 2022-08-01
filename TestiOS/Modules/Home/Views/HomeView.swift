//
//  HomeView.swift
//  TestiOS
//
//  Created by javier apaez on 29/07/22.
//

import Foundation
import UIKit

protocol HomeViewDelegate {
    func didSendButtonPress()
}

class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.cellId)
        tableview.register(SelfieTableViewCell.self, forCellReuseIdentifier: SelfieTableViewCell.cellId)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "simpleId")
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sendButtonPress), for: .touchUpInside)
        button.setTitle("Enviar foto", for: .normal)
        return button
    }()
    
    lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            tableView,
            sendButton
        ])
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        backgroundColor = .white
        addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: topAnchor),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackview.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackview.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 62),
        ])
    }
    
    @objc func sendButtonPress() {
        delegate?.didSendButtonPress()
    }
}

