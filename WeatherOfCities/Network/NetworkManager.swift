import UIKit

class NetworkManager {
	var session = URLSession(configuration: .default)
	
	var inputNameOfSity: Sities = .Bishkek
	
	func go() {
	var url: URL
	switch inputNameOfSity {
		case .Bishkek:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=3d8704a8f9b69c73745f86284f980bef&units=metric&q=Bishkek")!
		case .London:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .NewYork:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=New%20York&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .LosAngeles:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Los%20Angeles&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .Paris:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .Tokyo:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .Sydney:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Sydney&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .RioDeJaneiro:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Rio%20De%20Janeiro&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .HongKong:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Hong%20Kong&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		case .Dubai:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Dubai&appid=3d8704a8f9b69c73745f86284f980bef&units=metric")!
		}
			
		let task = session.dataTask(with: url) { data, response, error in
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
				let answer = try JSONDecoder().decode(jsonAnswer.self, from: data)
			}
			catch {
				print(error)
			}
		}
		task.resume()
	}
}
