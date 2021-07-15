//
//  BankInfoView.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import UIKit

class BankInfoView: UIView, CustomView {
    
    private let schemeInfoRow = BankInfoRow(topic: "Scheme")
    private let typeInfoRow = BankInfoRow(topic: "Type")
    private let bankInfoRow = BankInfoRow(topic: "Bank")
    private let contryInfoRow = BankInfoRow(topic: "Country")
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis  = .vertical
        stack.spacing = 8
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let topHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis  = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let bottomHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis  = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.setupViews()
    }
    
    func updateUI(bank: Bank) {
        self.schemeInfoRow.updateUI(with: bank.scheme?.capitalized ?? "Unknown")
        self.typeInfoRow.updateUI(with: bank.type?.capitalized ?? "Unknown")
        self.bankInfoRow.updateUI(with: bank.bank?.name?.capitalized ?? "Unknown")
        self.contryInfoRow.updateUI(with: (bank.country?.emoji ?? "") + (bank.country?.name ?? "Unknown"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupViews() {
        self.addSubview(verticalStack)
        self.addSubview(topHorizontalStack)
        self.addSubview(bottomHorizontalStack)
        self.topHorizontalStack.addArrangedSubview(schemeInfoRow)
        self.topHorizontalStack.addArrangedSubview(typeInfoRow)
        self.bottomHorizontalStack.addArrangedSubview(bankInfoRow)
        self.bottomHorizontalStack.addArrangedSubview(contryInfoRow)
        self.verticalStack.addArrangedSubview(topHorizontalStack)
        self.verticalStack.addArrangedSubview(bottomHorizontalStack)
        self.verticalStack.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    internal func setupConstraints() {}
}
