import UIKit

class ListViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewImage.image = UIImage(named: "clods2")
		textField.layer.borderColor = UIColor.gray.cgColor
		textField.layer.borderWidth = 3
		textField.layer.cornerRadius = 10
	}
	@IBOutlet var viewImage: UIImageView!
	@IBOutlet var searchButton: UIButton!
	@IBOutlet var textField: UITextField!
}
