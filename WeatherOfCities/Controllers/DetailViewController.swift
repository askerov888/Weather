import UIKit

class DetailViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
//		let _ = {
//			let editScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
//		}()
		taskGo()
	}
	
	var sity = ""
	
	func taskGo() {
		let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?appid=\(API.key)&units=metric&q=\(sity)")!
		
		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			if error != nil {
				print("Error")
			}
			guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
				print("status code wrong")
				return
			}
			guard let data2 = data else {
				return
			}
			guard let result = try? JSONDecoder().decode(JsonAnswer.self, from: data2) else {
				return
			}
			
			DispatchQueue.main.async {
				self.nameOfSity.text = result.name!
				self.temp.text = String(format: "%0.f", result.main?.temp as! CVarArg)
			}
		}
		task.resume()
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
