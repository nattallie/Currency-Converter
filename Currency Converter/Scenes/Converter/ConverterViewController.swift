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
        stack.spacing = Model.Layout.currencyItemsSpacing
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(
            top: .zero,
            left: Model.Layout.currencyItemsSpacing,
            bottom: .zero,
            right: Model.Layout.currencyItemsSpacing
        )
        return stack
    }()

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
            
            currencyItemsScrollView.leadingConstraint(toView: topContainer),
            currencyItemsScrollView.trailingConstraint(toView: topContainer),
            currencyItemsScrollView.topConstraint(toView: balanceLabel, attribute: .bottom, constant: Model.Layout.balanceLabelMarginVer),
            currencyItemsScrollView.heightConstraint(toView: currencyItemsStack),
            
            currencyItemsStack.leadingConstraint(toView: currencyItemsScrollView),
            currencyItemsStack.trailingConstraint(toView: currencyItemsScrollView),
            currencyItemsStack.topConstraint(toView: currencyItemsScrollView),
            currencyItemsStack.bottomConstraint(toView: currencyItemsScrollView),
            
            topContainer.bottomConstraint(toView: currencyItemsScrollView, constant: Model.Layout.currencyScrollViewMarginBottom)
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
}
