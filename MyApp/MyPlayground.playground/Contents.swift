w//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "http://www.google.com.tw")!
let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    print("hello")
}

dataTask.resume()
