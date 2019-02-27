import UIKit


//函数
func add(num1: Int, num2: Int) -> Int {  // (Int, Int) -> Int  类型
    let result = num1 + num2
    return result
}

var str = "Hello"

func changeStr(newStr: String) {  // （String） -> Void  类型
    str = newStr
}

//把函数存入变量 （闭包）
//1.去掉函数的func关键字和函数名
//(num1: Int, num2: Int) -> Int {
//  let result = num1 + num2
//  return result
//}
//2.将参数和返回值的部分移入到代码块内
//{ (num1: Int, num2: Int) -> Int
//  let result = num1 + num2
//  return result
//}
//3.在参数/返回值和代码之间，加入 in
//{ (num1: Int, num2: Int) -> Int in
//  let result = num1 + num2
//  return result
//}
//4.将整个代码块存入变量
let addClosure = { (num1: Int, num2: Int) -> Int in
    let result = num1 + num2
    return result
}

//闭包的使用
addClosure(5,3)

//闭包的简化
//0.当前闭包的简化
//let addClosure1: (Int, Int) -> Int = { (num1: Int, num2: Int) -> Int in
//    return num1 + num2
//}
//1.如果能够确定参数和返回值的类型的话 可以删除closure内返回值的类型
//let addClosure1: (Int, Int) -> Int = { (num1, num2) in
//    return num1 + num2
//}
//2.如果closure有返回值，并且代码处理的部分只有一行的情况下，可以省略return
//let addClosure1: (Int, Int) -> Int = { (num1, num2) in num1 + num2 }
//3.可以用$0, $1, $2来表示第一个,第二个,第三个参数
let addClosure1: (Int, Int) -> Int = { $0 + $1 }

let mineClosure: (Int, Int) -> Int = { $0 - $1 }

//数组的遍历，map
var array = [1,2,3,4,5,6,7,8,9,10]
var strArray = [String]()
for num in array {
    strArray.append("当前数字是\(num)")
}

//let newStrArray = array.map({ (num:Int) -> String in
//    return "当前数字是\(num)"
//})

//1.
//let newStrArray = array.map({ (num) in
//    return "当前数字是\(num)"
//})
//2.
//let newStrArray = array.map({ (num) in "当前数字是\(num)" })
//3.
let newStrArray = array.map({ "当前数字是\($0)" })
//4.如果closure是最后一个或者唯一一个参数，可以把closure移动到括号外
//let newStrArray = array.map(){ "当前数字是\($0)" }
//5.如果是唯一参数，可以省略（）
//let newStrArray = array.map{ "当前数字是\($0)" }



//数组的过滤，filter
var intArray = [Int]()
for num in array {
    if num % 2 != 0 {
        intArray.append(num)
    }
}

//let newIntArray = array.filter({ (num:Int) -> Bool in
//    return num % 2 != 0
//})
//1.
//let newIntArray = array.filter({ (num) in
//    return num % 2 != 0
//})
//2.
//let newIntArray = array.filter({ (num) in num % 2 != 0 })
//3.
//let newIntArray = array.filter({ $0 % 2 != 0 })
//4.
//let newIntArray = array.filter(){ $0 % 2 != 0 }
//5.
let newIntArray = array.filter{ $0 % 2 != 0 }

