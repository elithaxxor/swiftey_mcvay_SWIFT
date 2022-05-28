import UIKit


// MARK: Declare Protocol
protocol SomeProtocol : class {
    var somProperty: Int { get set }
    func aMethod(arg1: Double, anotherArg: String) -> Int
    mutating func changeIt()
  //  init(arg: Type)
}

// MARK: Impliment Protocol [struct]
struct SomeStruct : SomeProtocol {
    struct SomeStruct {
        func aMethod (arg1: Double, anotherArg: String) -> Int {
        print("Impliment struct from protocol")
            return 15
        }
        mutating func changeIt() {
            print("mutating func called")
        }
    }
}

// MARK: Implement protocol [Extension]
extension Something : SomeProtocol {
    // start implimentation
}


enum FastFoodMenuItem {
    case hamburger(numberOfPatties: Int)
    case drink(brand: String, Ounces: Int)
    case fries(size: FryOrderSize)
    case cookie(size: Int)
    
    mutating func isInMenu() {
        switch menuItem {
            case .hamburger: print("burger")
            case .drink: print("drink")
            case.fries: print("fries")
            case.cookie: print("cookie")
        default: print("nothing to show here")
        }
    }
    enum FryOrderSize {
        case large
        case small
    }
}


var menuItem = FastFoodMenuItem.hamburger(numberOfPatties: 2)
var otherItem: FastFoodMenuItem = FastFoodMenuItem()
print(otherItem)
print(menuItem)





