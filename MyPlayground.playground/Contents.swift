import UIKit

import Combine


enum MyError: Error {
    case failed
}


let subject = PassthroughSubject<String, Never>()
final class SomeObject {
    var value: String = "" {
        didSet {
            print("didSet value:", value)
        }
    }
}

final class Receiver {
    var subscriptions = Set<AnyCancellable>()
    let object = SomeObject()
    init() {
        subject.assign(to: \.value, on: object).store(in: &subscriptions)
    }
}

let receiver = Receiver()
subject.send("a")
subject.send("i")
subject.send("u")
subject.send("e")
subject.send("o")
subject.send("aiueod")
