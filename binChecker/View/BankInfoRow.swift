//
//  BankInfoRow.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import UIKit

protocol CustomView {
    func setupViews()
    func setupConstraints()
}

class BankInfoRow: UIView, CustomView {
    
    private var title: UILabel = {
        let textfield = UILabel()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.font = UIFont.boldSystemFont(ofSize: 13)
        textfield.textAlignment = .center
        return textfield
    }()
    
    private var result: UILabel = {
        let textfield = UILabel()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.numberOfLines = 0
        textfield.font = UIFont.systemFont(ofSize: 10)
        textfield.textAlignment = .center
        return textfield
    }()
    
    init(topic: String) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.title.text = topic
        self.setupViews()
    }
    
    func updateUI(with result: String) {
        self.result.text = result
    }
    
    internal func setupViews() {
        self.addSubview(title)
        self.addSubview(result)
        self.setupConstraints()
    }
    
    internal func setupConstraints() {
        self.title.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        self.title.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        self.result.anchor(top: title.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
