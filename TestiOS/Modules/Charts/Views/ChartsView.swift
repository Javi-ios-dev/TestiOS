//
//  ChartsView.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//

import Foundation
import ARKit

class ChartsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        backgroundColor = .white
    }
}
