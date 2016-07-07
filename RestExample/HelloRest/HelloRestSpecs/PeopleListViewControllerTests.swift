import Quick
import Nimble
import SwiftyJSON
import OHHTTPStubs
import Alamofire
@testable import HelloRest

import UIKit

class PeopleListViewControllerTests : QuickSpec {
    override func spec() {
                
        describe(".viewDidLoad") {
            it("should setup title and adapter"){
                let storyBoard = UIStoryboard(name:"PeopleListView", bundle: nil)
                let vc = storyBoard.instantiateInitialViewController() as! PeopleListViewController

                //calls viewDidLoad()
                let _ = vc.view

                expect(vc.title).to(equal("Contacts"))
            }
        }
        
        describe("transition to details view") {
            it("should push the person Details view controller") {
                let viewController = TestablePeopleListViewController()
                viewController.goToPersonDetails()
                expect(viewController.didPresentViewController).to(beAKindOf(PersonDetailsViewController.self))
            }
        }
    }
}

class TestablePeopleListViewController : PeopleListViewController {
    var didPresentViewController: UIViewController?
    
    override func pushViewControllerOnNavigationController(withViewController viewController: UIViewController) {
        didPresentViewController = viewController
    }
}