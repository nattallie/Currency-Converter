//
//  PickerViewWrapperController.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 29.06.22.
//

import UIKit

// MARK: Picker View Wrapper Controller
class PickerViewWrapperController: UIViewController {
    // MARK: Subviews
    private let containerView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.shadowRadius = Model.Misc.shadowRadius
        view.layer.shadowOffset = Model.Misc.shadowOffset
        view.layer.shadowColor = Model.Color.shadowColor.cgColor
        view.layer.shadowOpacity = Model.Misc.shadowOpacity
        return view
    }()
    
    private lazy var picker: UIPickerView = {
        let pickerView: UIPickerView = .init()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.clipsToBounds = true
        pickerView.layer.cornerRadius = Model.Layout.pickerCornerRadius
        pickerView.backgroundColor = Model.Color.pickerBackground
        return pickerView
    }()
    
    // MARK: Properties
    weak var delegate: PickerViewWrapperDelegate?
    
    private typealias Model = PickerViewWrapperUIModel
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
    }
    
    // MARK: Configure
    func configure(selectedRow: Int, in component: Int) {
        picker.selectRow(selectedRow, inComponent: component, animated: false)
    }
    
    // MARK: Set Up
    private func setup() {
        view.backgroundColor = .clear
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(containerView)
        containerView.addSubview(picker)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.widthConstraint(toView: view, multiplier: Model.Layout.containerViewMult),
            containerView.heightConstraint(toView: containerView, attribute: .width),
            containerView.centerXConstraint(toView: view),
            containerView.centerYConstraint(toView: view)
        ])
        
        NSLayoutConstraint.activate(picker.fillSuperView())
    }
}

// MARK: - Picker View Data Source
extension PickerViewWrapperController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        delegate?.numberOfComponents ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        delegate?.numberOfCurrencies ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = .init()
        }

        label.text = delegate?.titleForRow(at: row)
        label.textAlignment = .center
        label.font = Model.Font.label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = Model.Misc.labelScaleFactor

        return label
    }}

// MARK: - Picker View Delegate
extension PickerViewWrapperController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.didSelectRow(at: row)
    }
}
