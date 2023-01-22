import UIKit

class DetailViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		taskGo()
	}
	
	var sity = ""
	
	func taskGo() {
		let session = URLSession.shared
		
		let sityWithoutSpace = sity.replacingOccurrences(of: " ", with: "%20")
		
		let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?appid=\(API.key)&units=metric&q=\(sityWithoutSpace)")!
		
		
		let taskURL = session.dataTask(with: url) { data, response, error in
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
			
			guard let icon: String = result.weather?[0].icon else {return}
			
			let urlImage = URL(string: "https://openweathermap.org/img/wn/\(icon)@4x.png")!

			guard let dataImage = try? Data(contentsOf: urlImage) else {
				return
			}
			
			DispatchQueue.main.async {
				self.nameOfSity.text = result.name!
				self.temp.text = String(format: "%0.f", result.main?.temp as! CVarArg)
				self.minTemp.text = String(format: "%0.f", result.main?.temp_min as! CVarArg) + "\n min"
				self.maxTemp.text = String(format: "%0.f", result.main?.temp_max as! CVarArg) + "\n max"
				self.image.image = UIImage(data: dataImage)
			}
		}
		taskURL.resume()
	}
	
	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var nameOfSity: UILabel!
	@IBOutlet weak var temp: UILabel!
	@IBOutlet weak var minTemp: UILabel!
	@IBOutlet weak var maxTemp: UILabel!

}
