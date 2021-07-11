//
//  CustomButton.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import UIKit

class CustomButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(text, for: .normal)
        self.backgroundColor = .systemGreen
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
