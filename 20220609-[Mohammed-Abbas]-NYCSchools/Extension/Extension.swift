//
//  Extension.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/11/22.
//

import Foundation
import UIKit

// binding to the super view will help with constraints when displaying the data
extension UIView {
    func bindToSuperView(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superview = self.superview else {
            fatalError("Did not add to view hierarchy")
        }
        self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: insets.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -insets.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}
