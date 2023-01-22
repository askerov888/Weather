import UIKit

class ListViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// добавление фона и настройки для view
		viewImage.image = UIImage(named: "clods2")
		buttonConfig(button: searchButton)
		textFieldConfig(textField: textField)
	}
		
	@IBOutlet var viewImage: UIImageView!
	@IBOutlet var searchButton: UIButton!
	@IBOutlet var textField: UITextField!
	
	// настройка для кнопки
	private func buttonConfig(button: UIButton) {
		let buttonChange = button
		buttonChange.layer.cornerRadius = 15
	}
	
	// настройка для поля ввода
	private func textFieldConfig(textField: UITextField) {
		let textFieldChange = textField
		textFieldChange.layer.borderWidth = 2
		textField.layer.borderColor = UIColor.gray.cgColor
		textField.layer.cornerRadius = 15
	}
	
	// функция перехода к следующему VC
	@IBAction func searchAction() {
		if textField.text != nil, textField.text != "", textField.text != " " {
			let nextScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
			nextScreen.sity = textField.text!
			navigationController?.pushViewController(nextScreen, animated: true)
		} else {
			// предупреждения о заполнении поля
			let allert = UIAlertController(title: "Fill in the field", message: nil, preferredStyle: .alert)
			let actionOK = UIAlertAction(title: "Ok", style: .default, handler: nil)
			allert.addAction(actionOK)
			present(allert, animated: true, completion: nil)
		}
	}
}
