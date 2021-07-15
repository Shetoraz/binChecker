//
//  ViewController.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import UIKit

class ViewController: UIViewController, CustomView {
    
    private let button = CustomButton(text: "Find")
    
    private let binCheckerText: UILabel = {
       let label = UILabel()
        label.text = "Bin checker"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    private lazy var binInputView: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter bin code"
        textfield.backgroundColor = .white
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 8
        return textfield
    }()
    
    private let resultView = BankInfoView()
    
    private let bankManager = BankModelManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    @objc private func checkBin() {
        guard let bin = self.binInputView.text?.replacingOccurrences(of: " ", with: "") else { return }
        self.bankManager.binService.checkBin(bin) { [weak self] result in
            switch result {
            case .success(let bank):
                DispatchQueue.main.async {
                    self?.resultView.updateUI(bank: bank)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Views setup
    internal func setupViews() {
        self.view.addSubview(self.button)
        self.button.addTarget(self, action: #selector(checkBin), for: .touchUpInside)
        self.view.addSubview(binInputView)
        self.view.addSubview(resultView)
        self.view.addSubview(binCheckerText)
        self.setupConstraints()
    }
    
    internal func setupConstraints() {
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.binInputView.anchor(top: nil, leading: view.leadingAnchor, bottom: button.topAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8), size: CGSize(width: 0, height: 30))
        
        self.resultView.anchor(top: button.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        self.binCheckerText.anchor(top: nil, leading: nil, bottom: binInputView.topAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
        self.binCheckerText.anchorCenterXToSubview(subView: self.view)
    }
}

