import UIKit

enum Sities {
	case Bishkek
	case London
	case NewYork
	case LosAngeles
	case Paris
	case Tokyo
	case Sydney
	case RioDeJaneiro
	case HongKong
	case Dubai
}

class TestOfData {
	var sities: [String: Sities] = [
		"Bishkek": .Bishkek,
		"London": .London,
		"New York": .NewYork,
		"Los Angeles": .LosAngeles,
		"Paris": .Paris,
		"Tokyo": .Tokyo,
		"Sydney": .Sydney,
		"Rio De Janeiro": .RioDeJaneiro,
		"Hong Kong": .HongKong,
		"Dubai": .Dubai
	]
}
