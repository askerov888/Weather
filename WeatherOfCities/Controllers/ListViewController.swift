import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

//	let dataSource = TestOfData().sities.keys.sorted(by: <)
	var dataSource = TestOfData().sities
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		dataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		var content = cell.defaultContentConfiguration()
		let dataForRows = dataSource.keys.sorted(by: <)
		content.text = dataForRows[indexPath.row]
//		content.text = dataSource[indexPath.row]
		content.textProperties.font = UIFont.systemFont(ofSize: 20)
		content.textProperties.alignment = .center
		cell.contentConfiguration = content
		
		cell.layer.borderColor = UIColor.systemTeal.cgColor
		cell.layer.borderWidth = CGFloat(5)
		cell.layer.cornerRadius = 15
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let story = UIStoryboard(name: "Main", bundle: nil)
		guard let detailVC = (story.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController) else {
			return}
		let dataForRows = dataSource.keys.sorted()
		let selected = dataForRows[indexPath.row]
//		detailVC.selectedSity = dataSource[selected]
		detailVC.network.inputNameOfSity = dataSource[selected] ?? .Dubai
		navigationController?.pushViewController(detailVC, animated: true)
	}
	
	@IBOutlet weak var tableView: UITableView!
}
