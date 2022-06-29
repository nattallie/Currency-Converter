//
//  CurrencyInput.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 28.06.22.
//

import UIKit

// MARK: - Currency Input
class CurrencyInput: UIView {
    // MARK: Subviews
    private lazy var containerStack: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = model.layout.spacing
        return stack
    }()
    
    private let iconView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let inputLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let spaceView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var inputField: UITextField = {
        let textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.textColor = model.color.inputText
        
        let doneToolbar: UIToolbar = UIToolbar(
            frame: CGRect(x: 0, y: 0, width: 300, height: 40)
        )
        doneToolbar.barStyle = UIBarStyle.default

        let flexSpace: UIBarButtonItem = .init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(textFieldEditingDone))

        doneToolbar.items = [flexSpace, done]
        textField.inputAccessoryView = doneToolbar

        return textField
    }()
    
    private lazy var currencyStack: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.isUserInteractionEnabled = true
        stack.addGestureRecognizer(
            UITapGestureRecognizer.init(
                target: self, action: #selector(didTapCurrencyButton)
            )
        )
        return stack
    }()
    
    private lazy var currencyLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.font = model.font.currency
        return label
    }()
    
    private lazy var chevronImage: UIImageView = {
        let imageView: UIImageView = .init(image: .init(systemName: "chevron.down"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    // MARK: Properties
    weak var delegate: CurrencyInputDelegate?
    
    var amount: String {
        inputField.text ?? ""
    }
    
    var selectedCurrency: String {
        currencyLabel.text ?? ""
    }
    
    private var model: CurrencyInputModel
    
    // MARK: Initializers
    init(
        model: CurrencyInputModel,
        viewModel: CurrencyInputViewModel
    ) {
        self.model = model
        
        super.init(frame: .zero)
        
        setup()
        configure(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    func configure(viewModel: CurrencyInputViewModel) {
        iconView.image = viewModel.icon
        inputLabel.text = viewModel.title
        configure(amount: viewModel.amount)
        configure(currency: viewModel.selectedCurrency)
    }
    
    func configure(currency: Currency) {
        currencyLabel.text = currency.rawValue
    }
    
    func configure(amount: Double) {
        inputField.text = String(format: "%.2f", amount)
    }
    
    // MARK: Set Up
    private func setup() {
        backgroundColor = .clear
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(containerStack)
        
        containerStack.addArrangedSubview(iconView)
        containerStack.addArrangedSubview(inputLabel)
        containerStack.addArrangedSubview(spaceView)
        containerStack.addArrangedSubview(inputField)
        
        containerStack.addArrangedSubview(currencyStack)
        currencyStack.addArrangedSubview(currencyLabel)
        currencyStack.addArrangedSubview(chevronImage)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthConstraint(constant: model.layout.iconDimension.width),
            iconView.heightConstraint(constant: model.layout.iconDimension.height),
            
            spaceView.widthConstraint(toView: self, relation: .greaterThanOrEqual, constant: 1, multiplier: .zero),
            spaceView.heightConstraint(toView: self, relation: .greaterThanOrEqual, constant: 1, multiplier: .zero),
            
            inputField.widthConstraint(constant: model.layout.inputFieldWidth),
            
            containerStack.leadingConstraint(toView: self, constant: model.layout.spacing),
            containerStack.trailingConstraint(toView: self, constant: -model.layout.spacing),
            containerStack.topConstraint(toView: self, constant: model.layout.spacing),
            containerStack.bottomConstraint(toView: self, constant: -model.layout.spacing),
        ])
    }
    
    // MARK: Observer
    @objc private func didTapCurrencyButton() {
        delegate?.didTapCurrencyButton(sender: self)
    }
}

// MARK: - Text Field Delegate
extension CurrencyInput: UITextFieldDelegate {
    @objc private func textFieldEditingDone() {
        delegate?.didChangeAmount(sender: self, amount: inputField.text ?? "")
        inputField.resignFirstResponder()
    }
}

