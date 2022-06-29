//
//  AccountChip.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import UIKit

// MARK: Account Chip
class AccountChip: UIView {
    // MARK: Subviews
    private let containerView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let containerStack: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    private let accountLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Initializers
    init(
        model: AccountChipModel = .init(),
        viewModel: AccountChipViewModel = .mock
    ) {
        super.init(frame: .zero)
        
        setup(model: model)
        configure(model: model)
        configure(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    func configure(model: AccountChipModel) {
        containerView.backgroundColor = model.color.backgroundColor
        containerView.layer.cornerRadius = model.layout.cornerRadius
        containerView.layer.borderWidth = model.layout.borderWidth
        containerView.layer.borderColor = model.color.borderColor.cgColor
        
        accountLabel.textColor = model.color.text
        accountLabel.font = model.font.text
    }
    
    func configure(viewModel: AccountChipViewModel) {
        accountLabel.text = viewModel.accountItem.stringRepresentable
    }

    // MARK: Set Up
    private func setup(model: AccountChipModel) {
        backgroundColor = .clear
        addSubviews()
        addConstraints(model: model)
    }
    
    private func addSubviews() {
        addSubview(containerView)
        addSubview(containerStack)
        containerStack.addArrangedSubview(accountLabel)
    }
    
    private func addConstraints(model: AccountChipModel) {
        NSLayoutConstraint.activate(containerView.fillSuperView())
        
        NSLayoutConstraint.activate(
            containerStack.fillSuperView(.init(
                top: model.layout.marginVer,
                left: model.layout.marginHor,
                bottom: model.layout.marginVer,
                right: model.layout.marginHor
            ))
        )
        
        NSLayoutConstraint.activate([
            heightConstraint(constant: model.layout.height)
        ])
    }
}
