//
//  ConverterViewController.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

// MARK: - Converter View Controller
final class ConverterViewController: UIViewController {
    // MARK: Subviews
    private let topContainer: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = Model.Layout.topContainerCornerRadius
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = Model.Color.primary
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Model.Color.title
        label.font = Model.Font.title
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Model.Color.balance
        label.font = Model.Font.balance
        return label
    }()
    
    private let currencyItemsScrollView: UIScrollView = {
        let scrollView: UIScrollView = .init()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let currencyItemsStack: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = Model.Layout.accountItemsSpacing
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(
            top: .zero,
            left: Model.Layout.accountItemsSpacing,
            bottom: .zero,
            right: Model.Layout.accountItemsSpacing
        )
        return stack
    }()
    
    private lazy var pickerWrapper: PickerViewWrapperController = {
        let pickerWrapper: PickerViewWrapperController = .init()
        pickerWrapper.delegate = self
        pickerWrapper.modalPresentationStyle = .overCurrentContext
        return pickerWrapper
    }()
    
    private lazy var submitButton: UIButton = {
        let button: UIButton = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        button.backgroundColor = Model.Color.buttonDisabled
        button.layer.cornerRadius = Model.Layout.submitButtonCornerRadius
        button.titleLabel?.textColor = Model.Color.buttonTitle
        return button
    }()
    
    private var currencyChips: [CurrencyChip] = []

    // MARK: Properties
    private typealias Model = ConverterUIModel
    
    var presenter: ConverterPresentable!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.viewDidLoad()
    }
    
    // MARK: Set Up
    private func setup() {
        view.backgroundColor = Model.Color.background
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(topContainer)
        
        topContainer.addSubview(titleLabel)
        topContainer.addSubview(balanceLabel)
        topContainer.addSubview(currencyItemsScrollView)
        
        currencyItemsScrollView.addSubview(currencyItemsStack)
        
        view.addSubview(submitButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            topContainer.topConstraint(toView: view),
            topContainer.leadingConstraint(toView: view),
            topContainer.trailingConstraint(toView: view),
            
            titleLabel.topConstraint(toView: topContainer, constant: Model.Layout.titleLabelMarginVer),
            titleLabel.centerXConstraint(toView: topContainer),
            
            balanceLabel.topConstraint(toView: titleLabel, attribute: .bottom, constant: Model.Layout.balanceLabelMarginVer),
            balanceLabel.leadingConstraint(toView: topContainer, constant: Model.Layout.balanceLabelMarginHor),
            balanceLabel.trailingConstraint(toView: topContainer, relation: .lessThanOrEqual,constant: -Model.Layout.balanceLabelMarginHor),
            
            currencyItemsScrollView.leadingConstraint(toView: topContainer, constant: Model.Layout.accountScrollViewMarginHor),
            currencyItemsScrollView.trailingConstraint(toView: topContainer, constant: -Model.Layout.accountScrollViewMarginHor),
            currencyItemsScrollView.topConstraint(toView: balanceLabel, attribute: .bottom, constant: Model.Layout.accountItemsMarginVer),
            currencyItemsScrollView.heightConstraint(toView: currencyItemsStack),
            
            currencyItemsStack.leadingConstraint(toView: currencyItemsScrollView),
            currencyItemsStack.trailingConstraint(toView: currencyItemsScrollView),
            currencyItemsStack.topConstraint(toView: currencyItemsScrollView),
            currencyItemsStack.bottomConstraint(toView: currencyItemsScrollView),
            
            topContainer.bottomConstraint(toView: currencyItemsScrollView, constant: Model.Layout.accountScrollViewMarginBottom),
            
            submitButton.centerXConstraint(toView: view),
            submitButton.widthConstraint(toView: view, multiplier: Model.Layout.submitButtonWidthMult),
            submitButton.heightConstraint(constant: Model.Layout.submitButtonHeight),
            submitButton.bottomConstraint(toView: view, constant: -Model.Layout.submitButtonMarginVer)
        ])
    }
}

// MARK: - Converter View
extension ConverterViewController: ConverterView {
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setBalanceTitle(_ title: String) {
        balanceLabel.text = title
    }
    
    func setAccountItems(_ items: [AccountItem]) {
        currencyChips.forEach { $0.removeFromSuperview() }
        
        currencyChips.removeAll()
        
        items.forEach { item in
            let newCurrencyItem: CurrencyChip = {
                let item: CurrencyChip = .init(viewModel: .init(accountItem: item))
                item.translatesAutoresizingMaskIntoConstraints = false
                return item
            }()
            
            currencyChips.append(newCurrencyItem)
            currencyItemsStack.addArrangedSubview(newCurrencyItem)
        }
    }
    
    func updateAccountItem(at index: Int, _ item: AccountItem) {
        guard (0..<currencyChips.count).contains(index) else { return }
        
        currencyChips[index].configure(viewModel: .init(accountItem: item))
    }
    
    func showCurrencySelectorPopUp() {
        present(pickerWrapper, animated: true)
    }
    
    func dismissCurrencySelectorPopUp() {
        dismiss(animated: true)
    }
    
    func setButtonTitle(_ title: String) {
        submitButton.setTitle(title, for: .normal)
    }
    
    func setButtonActivity(to isEnabled: Bool) {
        submitButton.backgroundColor = isEnabled ? Model.Color.buttonEnabled : Model.Color.buttonDisabled
    }
}

// MARK: - Observer
extension ConverterViewController {
    @objc private func didTapSubmitButton() {
        presenter.didTapSubmitButton()
    }
}

// MARK: - Picker View Wrapper Delegate
extension ConverterViewController: PickerViewWrapperDelegate {
    var numberOfComponents: Int {
        1
    }
    
    var numberOfCurrencies: Int {
        presenter.numberOfCurrencies
    }
    
    func titleForRow(at index: Int) -> String {
        presenter.titleForCurrency(at: index)
    }
    
    func didSelectRow(at index: Int) {
        presenter.didSelectCurrency(index)
    }
}

// MARK: - Currency Input Delegate
extension ConverterViewController: CurrencyInputDelegate {
    func didTapCurrencyButton(sender: CurrencyInput) {
        presenter.didTapCurrencyButton()
    }
}
