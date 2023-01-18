import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	let dataSource = TestOfData().sities.sorted(by: <)
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		dataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		var content = cell.defaultContentConfiguration()
		content.text = dataSource[indexPath.row]
		content.textProperties.font = UIFont.systemFont(ofSize: 20)
		content.textProperties.alignment = .center
		cell.contentConfiguration = content
		
		cell.layer.borderColor = UIColor.systemTeal.cgColor
		cell.layer.borderWidth = CGFloat(5)
		cell.layer.cornerRadius = 15
		return cell
	}
	
	@IBOutlet weak var tableView: UITableView!
}
