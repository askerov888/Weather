import UIKit

class NetworkManager {
	var session = URLSession(configuration: .default)
	
	func go(nameOfSity: Sities) {
		var url: URL!
		switch nameOfSity {
		case .Bishkek:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid={{KeyWeather}}&units=metric&q=Bishkek")
		case .London:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid={{KeyWeather}}&units=metric")
		case .NewYork:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=New York&appid={{KeyWeather}}&units=metric")
		case .LosAngeles:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Los Angeles&appid={{KeyWeather}}&units=metric")
		case .Paris:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Paris&appid={{KeyWeather}}&units=metric")
		case .Tokyo:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid={{KeyWeather}}&units=metric")
		case .Sydney:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Sydney&appid={{KeyWeather}}&units=metric")
		case .RioDeJaneiro:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Rio De Janeiro&appid={{KeyWeather}}&units=metric")
		case .HongKong:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Hong Kong&appid={{KeyWeather}}&units=metric")
		case .Dubai:
			url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Dubai&appid={{KeyWeather}}&units=metric")
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
			} catch {
				print(error)
			}
		}
		task.resume()
	}
}
