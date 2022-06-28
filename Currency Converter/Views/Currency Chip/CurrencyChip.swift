//
//  CurrencyChip.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import UIKit

// MARK: Currency Chip
class CurrencyChip: UIView {
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
    
    private let currencyLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Initializers
    init(
        model: CurrencyChipModel = .init(),
        viewModel: CurrencyChipViewModel = .mock
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
    func configure(model: CurrencyChipModel) {
        containerView.backgroundColor = model.color.backgroundColor
        containerView.layer.cornerRadius = model.layout.cornerRadius
        containerView.layer.borderWidth = model.layout.borderWidth
        containerView.layer.borderColor = model.color.borderColor.cgColor
        
        currencyLabel.textColor = model.color.text
        currencyLabel.font = model.font.text
    }
    
    func configure(viewModel: CurrencyChipViewModel) {
        currencyLabel.text = viewModel.currencyItem.stringRepresentable
    }

    // MARK: Set Up
    private func setup(model: CurrencyChipModel) {
        backgroundColor = .clear
        addSubviews()
        addConstraints(model: model)
    }
    
    private func addSubviews() {
        addSubview(containerView)
        addSubview(containerStack)
        containerStack.addArrangedSubview(currencyLabel)
    }
    
    private func addConstraints(model: CurrencyChipModel) {
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
