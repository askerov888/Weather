import UIKit

class NetworkManager {
	var session = URLSession(configuration: .default)
	var answer: JsonAnswer!
	var nameOfSite: String = "Seatle"
	
	func go() {
		print(nameOfSite)
		let url: URL = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=\(API.key)&units=metric&q=\(nameOfSite)")!
		session.dataTask(with: url) { data, response, error in
			if error != nil {
				print("Error")
			}
			guard let data2 = data else {return}
			
//			guard let response2 = response as? HTTPURLResponse, (200...299).contains(response2.statusCode) else {
//				print("status code wrong")
//				return
//			}
			do {
				let result = try JSONDecoder().decode(JsonAnswer.self, from: data2)
				print(result.name as Any, "work!")
				print("work")
			} catch {
				print("deocde wrong")
			}
		}.resume()
	}
}

// "https://api.openweathermap.org/data/2.5/weather?appid=3d8704a8f9b69c73745f86284f980bef&units=metric&q=Bishkek"
