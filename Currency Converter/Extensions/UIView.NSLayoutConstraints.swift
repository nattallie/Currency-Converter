//
//  UIView.NSLayoutConstraints.swift
//  Currency Converter
//
//  Created by Nata Khurtsidze on 26.06.22.
//

import UIKit

/**
*  UIView extension to ease creating Auto Layout Constraints
*/
extension UIView {
    
    // MARK: - Fill
    public func fillSuperView(_ edges: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        
        if let superview = superview {
            let topConstraint = topConstraint(toView: superview, constant: edges.top)
            let leadingConstraint = leadingConstraint(toView: superview, constant: edges.left)
            let bottomConstraint = bottomConstraint(toView: superview, constant: -edges.bottom)
            let trailingConstraint = trailingConstraint(toView: superview, constant: -edges.right)

            constraints = [topConstraint, leadingConstraint, bottomConstraint, trailingConstraint]
        }
        
        return constraints
    }


    // MARK: - Leading
    public func leadingConstraint(
        toView view: UIView?,
        attribute: NSLayoutConstraint.Attribute = .leading,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .leading,
            attribute: attribute,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }

    // MARK: - Trailing
    public func trailingConstraint(
        toView view: UIView?,
        attribute: NSLayoutConstraint.Attribute = .trailing,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .trailing,
            attribute: attribute,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Left
    public func leftConstraint(
        toView view: UIView?,
        attribute: NSLayoutConstraint.Attribute = .left,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .left,
            attribute: attribute,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Right
    public func rightConstraint(
        toView view: UIView?,
        attribute: NSLayoutConstraint.Attribute = .right,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .right,
            attribute: attribute,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Top
    public func topConstraint(
        toView view: UIView?,
        attribute: NSLayoutConstraint.Attribute = .top,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .top,
            attribute: attribute,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Bottom
    public func bottomConstraint(
        toView view: UIView?,
        attribute: NSLayoutConstraint.Attribute = .bottom,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .bottom,
            attribute: attribute,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Center X
    public func centerXConstraint(
        toView view: UIView?,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .centerX,
            attribute: .centerX,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Center Y
    public func centerYConstraint(
        toView view: UIView?,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .centerY,
            attribute: .centerY,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Width
    public func widthConstraint(
        toView view: UIView? = nil,
        attribute attr2: NSLayoutConstraint.Attribute = .width,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .width,
            attribute: attr2,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Height
    public func heightConstraint(
        toView view: UIView? = nil,
        attribute attr2: NSLayoutConstraint.Attribute = .height,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        return createConstraint(
            toView: view,
            attribute: .height,
            attribute: attr2,
            relation: relation,
            constant: constant,
            multiplier: multiplier
        )
    }


    // MARK: - Private helper
    fileprivate func createConstraint(
        toView: UIView?,
        attribute attr1: NSLayoutConstraint.Attribute,
        attribute attr2: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1.0
    ) -> NSLayoutConstraint {
        NSLayoutConstraint(
            item: self,
            attribute: attr1,
            relatedBy: relation,
            toItem: toView,
            attribute: attr2,
            multiplier: multiplier,
            constant: constant
        )
    }
}
