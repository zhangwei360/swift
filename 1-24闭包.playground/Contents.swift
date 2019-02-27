import UIKit

//func add (num1:Int, num2:Int) -> Int {
//    let result = num1 + num2
//    return result
//}

let spAdd = {
    (num1:Int, num2:Int) -> Int in
    let result = num1 + num2
        return result
}

let spMinus = {
    (num1:Int, num2:Int) -> Int in
    let result = num1 - num2
    return result
}

let spMul = {
    (num1:Int, num2:Int) -> Int in
    let result = num1 * num2
    return result
}

func getNum (num1:Int, addNum:(Int, Int) -> Int) -> Int {
    let result = num1 * addNum(3, 2)
    return result
}

let num = getNum(num1: 6, addNum: spMul)

