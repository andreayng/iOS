import UIKit
import Alamofire
import SwiftyJSON
import ReactiveCocoa

class PeopleListViewController: UIViewController{
    let peopleSignal = MutableProperty<[Person]>([])

    @IBOutlet weak var tableView: UITableView!

    var viewModel: PeopleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        viewModel = PeopleListViewModel(peopleService: PeopleService())
        peopleSignal <~ viewModel.people.producer

        peopleSignal.producer.startWithNext { _ in
            self.tableView.reloadData()
        }
    }
}

extension PeopleListViewController : UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPeople
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let personForIndex = viewModel.getPersonAtIndex(indexPath.row)
        let cellIdentifier = "\(personForIndex.id)"
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) ?? UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)

        cell.textLabel?.text = personForIndex.name
        cell.detailTextLabel?.text = personForIndex.phone
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}



