import UIKit

import Combine


enum MyError: Error {
    case failed
}


let subject = PassthroughSubject<String, MyError>()

subject.sink(
    receiveCompletion: { completion in
        print("recieved completion: ", completion)
    },
    receiveValue: { value in
        print("recieved value: ", value)
    }
)


subject.send("a")
subject.send("i")
subject.send("u")
subject.send("e")
subject.send("o")
subject.send(completion: .failure(.failed))
subject.send("aiueod")
