//
//  View+AlertTextField.swift
//  TrelloClone
//
//  Created by tommyhan on 19/12/2022.
//

import Foundation
import SwiftUI

extension View {
    func presentAlertTextField(title: String, message: String? = nil, defaultTextFieldText: String? = nil, confirmAction: @escaping (String?) -> ()) {
        guard let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController else { return }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.text = defaultTextFieldText
        }
        
        alertController.addAction(.init(title: "Cancel", style: .cancel, handler: { _ in }))
        
        alertController.addAction(.init(title: "Save", style: .default, handler: { _ in
            guard let textField = alertController.textFields?.first else { return }
            confirmAction(textField.text)
        }))
        rootViewController.present(alertController, animated: true)
    }
}
