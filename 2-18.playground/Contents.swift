import UIKit

//通信 队列
//Grand Central Dispatch(GCD) 苹果的多核编程解决方案
//可用于多核芯的并行运算 更高效的利用多个CPU 自动管理线程的生命周期 开发者不需要编写任何管理线程代码 方便使用
//任务 和 队列
//任务：1.同步任务（SYNC）  同步任务添加到指定队列中，在先添加的任务结束之前，后面的任务会一直等待，只能在当前线程中执行任务，不具备开启新线程的能力
//     2.异步任务（ASYNC） 异步任务添加到指定的队列中，不会做任何等待，可以j继续执行任务，可以在新的线程中执行任务。具备开启新线程的能力
//队列：指执行任务的等待队列，即用来存放任务的队列，采用先进先出的原则，新任务总是被插入到队尾，w而读取任务的时候总是从队列的先头开始读取，每读取一个任务，会从队列中释放一个任务
//1.串型队列（Dispatch_Queue_Serial）：每次只有一个任务被执行，让任务一个接着一个执行
//2.并行队列（Dispatch_Queue_Concurrent）：可以让多个任务同时执行，即开启多线程，并通知执行

//DispatchQueue.main  //画面相关的放倒主线程 主线程一般设置同步
//DispatchQueue.global()

let task1 = {
    for i in 1...10 {
        print("TASK1:\(i)")
    }
}

let task2 = {
    for i in 1...10 {
        print("Task2:\(i)")
    }
}

//DispatchQueue.main.async(execute: task1)
//DispatchQueue.main.async(execute: task2)

DispatchQueue.global().async(execute: task1)
DispatchQueue.global().async(execute: task2)
