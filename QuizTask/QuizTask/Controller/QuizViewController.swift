//
//  QuizViewController.swift
//  QuizTask
//
//  Created by Santhosh on 30/09/20.
//  Copyright © 2020 Contus. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    // Option Array for second question answers
    private var optionsArray2 = [String]()
    // Boolean to check if multiple option selection is allowed
    private var isMultiSelectAllowed : Bool = false
    // username entered in Login screen to be passed from there
    var registeredName : String!
    // Answer String for the first question
    private var answer1 : String!
    // Multiple answers selected for the second question
    private var answer2Array = [String]()
    
    // Question label oulet
    @IBOutlet weak var questionLabel: UILabel!
    
    // Label to display that multiple selection is mandatory for second question
    @IBOutlet weak var selectMultipleLabel: UILabel!
    
    //Option button outlets
    // Can use Outlet collection Taken separate outlets for clear understanding
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    // DataViewModel Instance
    var detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Quiz Time"
        optionsArray2 = ["White", "Yellow", "Orange", "Green"]
    }

    // MARK: Navigation Methods
    func movetoNextScreen() {
        var answer2 : String?
        for answerStr in answer2Array {
            answer2 = ((answer2 != nil) ? (answer2! + ", ") : "") + answerStr
        }
        detailsViewModel.saveDetails(name: registeredName, answer1: answer1, answer2: answer2)
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    // MARK: Private Methods
    // Method to set default background for options
    func setbackgroundColorForOptions(color: UIColor) {
        option1Button.backgroundColor = color
        option2Button.backgroundColor = color
        option3Button.backgroundColor = color
        option4Button.backgroundColor = color
    }
}



// MARK: Button actions
extension QuizViewController {
    
    // Next button action to switch question and navigate to next screen
    @IBAction func nextAction(_ sender: UIButton) {
        if (answer2Array.count > 1) {
            movetoNextScreen()
        } else if (answer1 != nil) {    
            selectMultipleLabel.isHidden = false
            if (!isMultiSelectAllowed) {
                setbackgroundColorForOptions(color: UIColor.white)
            }
            questionLabel.text = "What are the colors in the Indian national flag?"
            option1Button.setTitle(optionsArray2[0], for: .normal)
            option2Button.setTitle(optionsArray2[1], for: .normal)
            option3Button.setTitle(optionsArray2[2], for: .normal)
            option4Button.setTitle(optionsArray2[3], for: .normal)
            isMultiSelectAllowed = true
        }
    }
    
    // Button action to select the answer
    @IBAction func selectAnswerAction(_ sender: UIButton) {
        if (isMultiSelectAllowed) {
            let buttontitle = sender.titleLabel?.text ?? ""
            if (!answer2Array.contains(buttontitle)) {
                answer2Array.append(buttontitle)
                sender.backgroundColor = UIColor.green
            }
        } else {
            answer1 = sender.titleLabel?.text
            setbackgroundColorForOptions(color: UIColor.white)
            sender.backgroundColor = UIColor.green
        }
    }

}
