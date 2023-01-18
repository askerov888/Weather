import Foundation

struct coord: Codable {
	var lon: Double
	var lat: Double
}

struct weather: Codable {
	var id: Int
	var main: String
	var description: String
	var icon: String
}

struct main: Codable {
	var temp: Double
	var pressure: Int
	var feels_like: Double
	var temp_min: Double
	var temp_max: Double
	var humidity: Int
}

struct wind: Codable {
	var speed: Double
	var deg: Int
}

struct sys: Codable {
	var type: Int
	var id: Int
	var country: String
	var sunrise: Int
	var sunset: Int
}

struct clouds: Codable {
	var all: Int
}

struct jsonAnswer: Codable {
	var coord: coord
	var weather: [weather]
	var base: String
	var main: main
	var visibility: Int
	var wind: wind
	var clouds: clouds
	var dt: Int
	var sys: sys
	var timezone: Int
	var id: Int
	var name: String
	var code: Int
}
