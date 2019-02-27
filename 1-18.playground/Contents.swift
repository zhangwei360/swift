import UIKit

func dengcha (n:Int) -> Int {
    var result = Int()
    result = Int((1 + Double(n)) * Double(n) / 2)
    return result
}
let result1 = dengcha(n: 11)
print(result1)


