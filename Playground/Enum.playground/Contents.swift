enum Direction {
    case east
    case west
    case south
    case north
}

let myDirection = Direction.east

func whichDirectionToGo(direction:Direction) {
    if direction == Direction.east {
        print("go east")
    } else if direction == .west {
        print("go west")
    } else if direction == .south {
        print("go south")
    } else if direction == .north {
        print("go north")
    }
}

whichDirectionToGo(direction: .north)

import UIKit
UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)

enum Season {
    case spring
    case summer
    case autumn
    case winter
}


