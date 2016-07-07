//
//  PersonDetailsViewController.swift
//  HelloRest
//
//  Created by Toby Tobkin on 7/1/16.
//  Copyright © 2016 Venkat. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ReactiveCocoa

class PersonDetailsViewController : UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var blingBlingLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var viewModel: PeopleDetailsViewModel!
    let personSignal = MutableProperty<Person?>(nil)
    
    var personID: Int? {
        didSet {
            viewModel = PeopleDetailsViewModel(withID: personID!, peopleService: PeopleService())
            personSignal <~ viewModel.person.producer
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        
        personSignal.producer.startWithNext { _ in
            self.updateLabels()
        }
    }
    
    func updateLabels() {
        nameLabel.text = viewModel.name
        blingBlingLabel.text = viewModel.phone
        ageLabel.text = viewModel.age
    }

    
}
