//
//  AddAlertView.swift
//  Sports App
//
//  Created by MAC on 22/06/2022.
//

import UIKit


func addAlert(title:String, message:String, ActionTitle:String, viewController: UIViewController) {
    let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: ActionTitle, style: .cancel, handler: nil))
    
    DispatchQueue.main.async {
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
