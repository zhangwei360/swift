import UIKit

//取得cell所需高度
func getLabelHeight(content: String, labelWidth: CGFloat,textSize: CGFloat) -> CGFloat {
    //如果内容为空，返回高度为0
    if content == "" {
        return 0
    }
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: textSize)
    label.text = content
    label.sizeToFit()
    
    return label.frame.height
}


//获取当前时间
func getCurrentTime(form: GetNowForm) -> (Int, Int, Int) {
    let date = Date()
    let calendar = Calendar.current
    
    //取得月日年
    let year = calendar.component(.year, from: date)
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)
    
    //取得时分秒
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)
    
    //获得时间戳
    let timeInterval:TimeInterval = date.timeIntervalSince1970 * 1000
    let timeStamp = Int(timeInterval)
    
    switch form {
    case .CurrentDate:
        return (year, month, day)
    case .CurrentTime:
        return (hour, minutes, seconds)
    case .TimeStamp:
        return (timeStamp, 0, 0)
    }
}

//十进制转二进制
func decToBin(number: Int) -> String {
    var num = number
    var str = ""
    //二进制转换
    while num > 0 {
        str = "\(num % 2)" + str
        num /= 2
    }
    //翻转字符串
    let binStr = String(str.reversed())
    return binStr
}
