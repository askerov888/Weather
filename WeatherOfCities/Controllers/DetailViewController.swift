import UIKit

class DetailViewController: UIViewController {
	let network = NetworkManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		network.go()
		print(network.answer.name)
//		nameOfSity.text = network.answer.name
		}
	
	
	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var nameOfSity: UILabel!
	@IBOutlet weak var temp: UILabel!
	@IBOutlet weak var day1: UILabel!
	@IBOutlet weak var day2: UILabel!
	@IBOutlet weak var day3: UILabel!
	@IBOutlet weak var day4: UILabel!
	@IBOutlet weak var day5: UILabel!

}
