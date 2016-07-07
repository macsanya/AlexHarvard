//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum State: String {
    
    case Busy = "Busy"
    case Waiting = "Waiting"
    case Running = "Running"
    
}

class TaskManager {
    var happy: Bool = false
    var state: State = .Busy
    var state = State.Busy
    
    
}



class Person{
    
    let name
    
    func handleAction(action:Action){
        switch action {
        case.Sleep(let time):
        case.Run(length: <#Float#>)
        }
    }
    
}

enum Action {
   
    case Sleep(time: Int)
    case Run(length: Float)
    
    
}

