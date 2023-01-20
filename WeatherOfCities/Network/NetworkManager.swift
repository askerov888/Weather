import UIKit

class NetworkManager {
	var session = URLSession(configuration: .default)
	var answer: jsonAnswer!
	
	func go(sity: String) {
		let url: URL = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=\(API.key)&units=metric&q=\(sity)")!
		let task = session.dataTask(with: url) { [self] data, response, error in
			if let error = error {
				print(error)
			}
			guard let data = data else {
				return
			}
			guard ((response as! HTTPURLResponse?)?.statusCode == 200) else {
				return
			}
			do {
				self.answer = try JSONDecoder().decode(jsonAnswer.self, from: data)
				print(self.answer.name)
			}
			catch {
				print(error)
			}
		}
		task.resume()
	}
}


// "https://api.openweathermap.org/data/2.5/weather?appid=3d8704a8f9b69c73745f86284f980bef&units=metric&q=Bishkek"
