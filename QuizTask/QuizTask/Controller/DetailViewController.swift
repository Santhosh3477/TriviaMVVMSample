//
//  DetailViewController.swift
//  QuizTask
//
//  Created by Santhosh on 01/10/20.
//  Copyright © 2020 Contus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    
    // DetailViewModel instance
    var detailsViewModel = DetailsViewModel()
    
    // This array holds the participants record fetched from coredata
    var participantArray = [ParticipantRecords]()
    
    // This button outlet is to change button title while toggling to display my details and users game history
    @IBOutlet weak var historyorMydetailButton: UIButton!
    
    // These outlets are to display the user details
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var answer1label: UILabel!
    @IBOutlet weak var answer2label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.isHidden = true
        participantArray = detailsViewModel.fetchDataFromDB()
        let userdetail : ParticipantRecords = participantArray.last!
        nameLabel.text = "Hello \(userdetail.name!)"
        answer1label.text = userdetail.answer1!
        answer2label.text = userdetail.answer2!
        navigationController?.setNavigationBarHidden(true, animated: false)
        detailTableView.reloadData()
    }
    
    // MARK: Button Actions
    // Finish and History/My Detail Button actions collection
    @IBAction func finishOrHistoryButtonAction(_ sender: UIButton) {
        if (sender.tag == 1) {
            if (sender.titleLabel?.text == "HISTORY") {
                detailTableView.isHidden = false
                historyorMydetailButton .setTitle("MY DETAIL", for: .normal)
            } else {
                detailTableView.isHidden = true
                historyorMydetailButton .setTitle("HISTORY", for: .normal)
            }
        } else {
            self.navigationController?.popToRootViewController(animated: false)
        }
    }

}

// MARK: Tableview Datasource and Delegate Methods
extension DetailViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userdetail : ParticipantRecords = participantArray[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.gamedateLabel.text = "GAME \(String(indexPath.row + 1)) : \(userdetail.submitTime ?? "")"
        cell.usernameLabel.text = "Name : \(userdetail.name ?? "")"
        cell.ans1Label.text = userdetail.answer1
        cell.ans2Label.text = userdetail.answer2
        return cell
    }
}
