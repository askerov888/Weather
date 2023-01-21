import UIKit

class ListViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewImage.image = UIImage(named: "clods2")
		buttonConfig(button: searchButton)
		textFieldConfig(textField: textField)
	}
		
	@IBOutlet var viewImage: UIImageView!
	@IBOutlet var searchButton: UIButton!
	@IBOutlet var textField: UITextField!
	
	private func buttonConfig(button: UIButton) {
		let buttonChange = button
		buttonChange.layer.cornerRadius = 15
	}
	
	private func textFieldConfig(textField: UITextField) {
		let textFieldChange = textField
		textFieldChange.layer.borderWidth = 2
		textField.layer.borderColor = UIColor.gray.cgColor
		textField.layer.cornerRadius = 15
	}
	
	@IBAction func searchAction() {
		if textField.text != nil, textField.text != "", textField.text != " " {
			let nextScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
			nextScreen.sity = textField.text!
			navigationController?.pushViewController(nextScreen, animated: true)
		} else {
			let allert = UIAlertController(title: "Fill in the field", message: nil, preferredStyle: .alert)
			let actionOK = UIAlertAction(title: "Ok", style: .default, handler: nil)
			allert.addAction(actionOK)
			present(allert, animated: true, completion: nil)
		}
	}
}
