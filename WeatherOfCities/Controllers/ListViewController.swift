import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
	let dataSource = TestOfData()
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		dataSource.sities.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
		
		var content = cell.defaultContentConfiguration()
		content.text = dataSource.sities[indexPath.row]
		cell.contentConfiguration = content
		
		return cell
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBOutlet weak var tableView: UITableView!
    
	
}
