//
//  LoginViewController.swift
//  QuizTask
//
//  Created by Santhosh on 30/09/20.
//  Copyright © 2020 Contus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    /// This object is to enter the username to be registered
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UIEvent Method
    // UIEvent callback to dismiss keyboard on touch in view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Segue methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "quizPageSegue") {
            if let destinationVC = segue.destination as? QuizViewController {
                destinationVC.registeredName = self.usernameTextField.text
                usernameTextField.text = ""
                destinationVC.modalPresentationStyle = .fullScreen
            }
        }
    }
    
    // To cancel segue action based on username validation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let username = usernameTextField.text
        guard username?.trimmingCharacters(in: .whitespaces).count != 0 else {
            return false
        }
        return true
    }

}
