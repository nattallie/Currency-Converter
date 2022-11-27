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
    
    // MARK: Top Container
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
    
    private let accountItemsScrollView: UIScrollView = {
        let scrollView: UIScrollView = .init()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let accountItemsStack: UIStackView = {
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
    
    private var accountChips: [AccountChip] = []
    
    // MARK: Currency Inputs
    private let inputsScrollView: UIScrollView = {
        let scrollView: UIScrollView = .init(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private let inputsScrollViewContainer: UIView = {
        let view: UIView = .init(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var pickerWrapper: PickerViewWrapperController = {
        let pickerWrapper: PickerViewWrapperController = .init()
        pickerWrapper.delegate = self
        pickerWrapper.modalPresentationStyle = .overCurrentContext
        return pickerWrapper
    }()
    
    private let currencyExchangeLabel: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Model.Color.currencyExchange
        label.font = Model.Font.currencyExchange
        return label
    }()
    
    private let currencyInputStack: UIStackView = {
        let stack: UIStackView = .init()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = Model.Layout.currencyInputStackSpacing
        return stack
    }()
    
    private lazy var sellInput: CurrencyInput = {
        let model: CurrencyInputModel = {
            var model: CurrencyInputModel = .init()
            model.color.inputText = Model.Color.sellInputText
            return model
        }()
        
        let input: CurrencyInput = .init(
            model: model,
            viewModel: .init(
                icon: ImageBook.Icon.arrowUp,
                title: presenter.sellInputTitle,
                amount: presenter.defaultAmount,
                selectedCurrency: presenter.sellCurrency
            )
        )
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.delegate = self
        
        return input
    }()
    
    private lazy var receiveInput: CurrencyInput = {
        let model: CurrencyInputModel = {
            var model: CurrencyInputModel = .init()
            model.color.inputText = Model.Color.receiveInputText
            return model
        }()
        
        let input: CurrencyInput = .init(
            model: model,
            viewModel: .init(
                icon: ImageBook.Icon.arrowDown,
                title: presenter.receiveInputTitle,
                amount: presenter.defaultAmount,
                selectedCurrency: presenter.receiveCurrency
            )
        )
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.delegate = self
        
        return input
    }()
    
    // MARK: Submit Button
    private lazy var submitButton: UIButton = {
        let button: UIButton = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        button.backgroundColor = Model.Color.buttonDisabled
        button.layer.cornerRadius = Model.Layout.submitButtonCornerRadius
        button.titleLabel?.textColor = Model.Color.buttonTitle
        return button
    }()
    
    private let indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()

    // MARK: Properties
    private typealias Model = ConverterUIModel
    
    var presenter: ConverterPresentable!
    
    private var titleLabelTopConstraint: NSLayoutConstraint?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        titleLabelTopConstraint?.constant = UIApplication.shared.rootWindow?.safeAreaInsets.top ?? 0
    }
    
    // MARK: Set Up
    private func setup() {
        view.backgroundColor = Model.Color.background
        addSubviews()
        addConstraints()
        addKeyboardObservers()
    }
    
    private func addSubviews() {
        view.addSubview(topContainer)
        
        topContainer.addSubview(titleLabel)
        topContainer.addSubview(balanceLabel)
        topContainer.addSubview(accountItemsScrollView)
        
        accountItemsScrollView.addSubview(accountItemsStack)
        
        view.addSubview(currencyExchangeLabel)
        view.addSubview(inputsScrollView)
        inputsScrollView.addSubview(inputsScrollViewContainer)
        inputsScrollViewContainer.addSubview(currencyInputStack)
        currencyInputStack.addArrangedSubview(sellInput)
        currencyInputStack.addArrangedSubview(receiveInput)
        
        inputsScrollViewContainer.addSubview(submitButton)
        view.addSubview(indicatorView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            topContainer.topConstraint(toView: view),
            topContainer.leadingConstraint(toView: view),
            topContainer.trailingConstraint(toView: view),
            
            titleLabel.topConstraint(
                toView: topContainer,
                constant: Model.Layout.titleLabelMarginVer
            ).reference(in: &titleLabelTopConstraint),
            titleLabel.centerXConstraint(toView: topContainer),
        
            balanceLabel.leadingConstraint(toView: topContainer, constant: Model.Layout.balanceLabelMarginHor),
            balanceLabel.trailingConstraint(
                toView: topContainer,
                relation: .lessThanOrEqual,
                constant: -Model.Layout.balanceLabelMarginHor
            ),
            balanceLabel.topConstraint(toView: titleLabel, attribute: .bottom, constant: Model.Layout.balanceLabelMarginVer),
            
            accountItemsScrollView.leadingConstraint(toView: topContainer, constant: Model.Layout.accountScrollViewMarginHor),
            accountItemsScrollView.trailingConstraint(toView: topContainer, constant: -Model.Layout.accountScrollViewMarginHor),
            accountItemsScrollView.topConstraint(
                toView: balanceLabel,
                attribute: .bottom,
                constant: Model.Layout.accountItemsMarginVer
            ),
            accountItemsScrollView.heightConstraint(toView: accountItemsStack),
            
            accountItemsStack.leadingConstraint(toView: accountItemsScrollView),
            accountItemsStack.trailingConstraint(toView: accountItemsScrollView),
            accountItemsStack.topConstraint(toView: accountItemsScrollView),
            accountItemsStack.bottomConstraint(toView: accountItemsScrollView),
            
            topContainer.bottomConstraint(toView: accountItemsScrollView, constant: Model.Layout.accountScrollViewMarginBottom),
            
            currencyExchangeLabel.leadingConstraint(toView: view, constant: Model.Layout.currencyExchangeLabelMarginHor),
            currencyExchangeLabel.trailingConstraint(
                toView: view,
                relation: .lessThanOrEqual,
                constant: -Model.Layout.currencyExchangeLabelMarginHor
            ),
            currencyExchangeLabel.topConstraint(
                toView: topContainer,
                attribute: .bottom,
                constant: Model.Layout.currencyExchangeLabelMarginVer
            ),
            
            inputsScrollView.widthConstraint(toView: view),
            inputsScrollView.centerXConstraint(toView: view),
            inputsScrollView.topConstraint(toView: currencyExchangeLabel, attribute: .bottom, constant: Model.Layout.currencyInputStackMarginVer),
            inputsScrollView.bottomConstraint(toView: view),
            
            inputsScrollViewContainer.widthConstraint(toView: inputsScrollView),
            inputsScrollViewContainer.centerXConstraint(toView: inputsScrollView),
            inputsScrollViewContainer.topConstraint(toView: inputsScrollView),
            inputsScrollViewContainer.bottomConstraint(toView: inputsScrollView),
            
            currencyInputStack.leadingConstraint(toView: inputsScrollViewContainer, constant: Model.Layout.currencyInputStackMarginHor),
            currencyInputStack.trailingConstraint(toView: inputsScrollViewContainer, constant: -Model.Layout.currencyInputStackMarginHor),
            currencyInputStack.topConstraint(toView: inputsScrollViewContainer),
            
            submitButton.centerXConstraint(toView: inputsScrollViewContainer),
            submitButton.widthConstraint(toView: inputsScrollViewContainer, multiplier: Model.Layout.submitButtonWidthMult),
            submitButton.heightConstraint(constant: Model.Layout.submitButtonHeight),
            submitButton.topConstraint(toView: currencyInputStack, attribute: .bottom, constant: Model.Layout.currencyInputStackMarginVer),
            submitButton.bottomConstraint(toView: inputsScrollViewContainer, constant: -Model.Layout.submitButtonMarginBottom),
            
            indicatorView.centerXConstraint(toView: view),
            indicatorView.centerYConstraint(toView: view)
        ])
    }
    
    // MARK: Keyboard Responsiveness
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil,
            using: keyboardWillShow
        )
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil,
            using: keyboardWillHide
        )
    }
    
    private func keyboardWillShow(notification: Notification) {
        let keyboardInfo: SystemKeyboardInfo = .init(notification: notification)
        
        animateView(
            keyboardInfo: keyboardInfo,
            animationCallback: { [weak self] in
                guard let self = self else { return }
                
                self.inputsScrollView.contentInset.bottom = keyboardInfo.frame.height - (self.view.frame.height - keyboardInfo.frame.height - self.inputsScrollView.frame.minY) + Model.Layout.submitButtonMarginBottom
            }
        )
    }
    
    private func keyboardWillHide(notification: Notification) {
        let keyboardInfo: SystemKeyboardInfo = .init(notification: notification)
        
        animateView(
            keyboardInfo: keyboardInfo,
            animationCallback: { [weak self] in
                guard let self = self else { return }
                
                self.inputsScrollView.contentInset.bottom = 0
            }
        )
    }
    
    private func animateView(keyboardInfo: SystemKeyboardInfo, animationCallback: @escaping () -> Void) {
        UIView.animate(
            withDuration: keyboardInfo.animationDuration,
            delay: 0,
            options: keyboardInfo.animationOptions,
            animations: {
                animationCallback()
            }
        )
    }
}

// MARK: - Converter View
extension ConverterViewController: ConverterView {
    // MARK: Properties
    var sellAmount: Double { sellInput.amount }
    var receiveAmount: Double { receiveInput.amount }
    
    var sellCurrency: Currency { sellInput.selectedCurrency }
    var receiveCurrency: Currency { receiveInput.selectedCurrency }
    
    // MARK: Top container
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setBalanceTitle(_ title: String) {
        balanceLabel.text = title
    }
    
    func setAccountItems(_ items: [AccountItem]) {
        accountChips.forEach { $0.removeFromSuperview() }
        
        accountChips.removeAll()
        
        items.forEach { item in
            let newAccountItem: AccountChip = {
                let item: AccountChip = .init(viewModel: .init(accountItem: item))
                item.translatesAutoresizingMaskIntoConstraints = false
                return item
            }()
            
            accountChips.append(newAccountItem)
            accountItemsStack.addArrangedSubview(newAccountItem)
        }
    }
    
    func updateAccountItem(at index: Int, _ item: AccountItem) {
        guard (0..<accountChips.count).contains(index) else { return }
        
        accountChips[index].configure(viewModel: .init(accountItem: item))
    }
    
    // MARK: Currency Inputs
    func setCurrencyExchangeTitle(_ title: String) {
        currencyExchangeLabel.text = title
    }
    
    func setCurrencyInputActivity(to isEnabled: Bool, inputType: CurrencyInputType) {
        switch inputType {
        case .sell:
            sellInput.isUserInteractionEnabled = isEnabled
        case .receive:
            receiveInput.isUserInteractionEnabled = isEnabled
        }
    }
    
    func setCurrentAmount(_ amount: Double, inputType: CurrencyInputType) {
        switch inputType {
        case .sell:
            sellInput.configure(amount: amount)
        case .receive:
            receiveInput.configure(amount: amount)
        }
    }
    
    func setCurrentCurrency(_ currency: Currency, inputType: CurrencyInputType) {
        switch inputType {
        case .sell:
            sellInput.configure(currency: currency)
        case .receive:
            receiveInput.configure(currency: currency)
        }
    }
    
    // MARK: Pop Ups and alerts
    func showCurrencySelectorPopUp(selectedCurrencyIndex: Int) {
        let _ = sellInput.resignFirstResponder()
        let _ = receiveInput.resignFirstResponder()
        pickerWrapper.configure(selectedRow: selectedCurrencyIndex, in: 0)
        present(pickerWrapper, animated: true)
    }
    
    func dismissCurrencySelectorPopUp() {
        dismiss(animated: true)
    }
    
    func showAlert(viewModel: AlertViewModel) {
        let alert = UIAlertController(
            title: viewModel.title,
            message: viewModel.message,
            preferredStyle: .alert
        )
        
        if let actionTitle = viewModel.actionTitle {
            alert.addAction(UIAlertAction(
                title: actionTitle,
                style: .default)
            )
        }
        
        present(alert, animated: true)
    }
    
    // MARK: Loaders
    func startLoading() {
        indicatorView.startAnimating()
    }
    
    func stopLoading() {
        indicatorView.stopAnimating()
    }
    
    func setScreenInteraction(to isInteractive: Bool) {
        view.isUserInteractionEnabled = isInteractive
    }
    
    // MARK: Button actions
    func setButtonTitle(_ title: String) {
        submitButton.setTitle(title, for: .normal)
    }
    
    func setButtonActivity(to isEnabled: Bool) {
        submitButton.backgroundColor = isEnabled ? Model.Color.buttonEnabled : Model.Color.buttonDisabled
        submitButton.isUserInteractionEnabled = isEnabled
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
    func didChangeAmount(sender: CurrencyInput, amount: Double, currency: Currency) {
        if sender == sellInput {
            presenter.didChangeAmount(
                inputType: .sell,
                amount: amount,
                currency: currency
            )
        } else {
            presenter.didChangeAmount(
                inputType: .receive,
                amount: amount,
                currency: currency
            )
        }
    }
    
    func didTapCurrencyButton(sender: CurrencyInput) {
        if sender == sellInput {
            presenter.didTapCurrencyButton(inputType: .sell)
        } else {
            presenter.didTapCurrencyButton(inputType: .receive)
        }
    }
    
    func didBeginAmountEditing(sender: CurrencyInput)  {
        if sender == sellInput {
            presenter.didTapCurrencyInput(inputType: .sell)
        } else {
            presenter.didTapCurrencyInput(inputType: .receive)
        }
    }
}
