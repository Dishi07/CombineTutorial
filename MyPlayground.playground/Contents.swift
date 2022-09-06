import UIKit

import Combine


enum MyError: Error {
    case failed
}


let subject = PassthroughSubject<String, Never>()


final class Receiver {
    let subscription: AnyCancellable
    init() {
        subscription = subject.sink { value in
            print("Received value:", value)
        }
    }
}

let receiver = Receiver()
subject.send("a")
subject.send("i")
subject.send("u")
subject.send("e")
subject.send("o")
subject.send("aiueod")
