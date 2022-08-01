//
//  TextFieldTableViewCell.swift
//  TestiOS
//
//  Created by javier apaez on 29/07/22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    static let cellId = "TextFieldTableViewCellId"
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Solo caracteres alfabéticos."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Add views and constraints
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupComponents() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)
        selectedBackgroundView = view
        
        
        contentView.addSubview(textField)
        textField.delegate = self
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 18),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -18),
        ])
    }
    
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    
    // Allow to enter only characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
}
