import UIKit
import RxSwift
import RxCocoa

/*
 Observable is a sequence can emit values whatever you like.
 */

let observable = Observable.just(1)

let observable2 = Observable.of(1,2,3)

let observable3 = Observable.of([1,2,3])

let observable4 = Observable.from([1,2,3,4,5])


/*
 Subscription to observable

 observable4.subscribe { event in
     print(event)
         next(1)
         next(2)
         next(3)
         next(4)
         next(5)
         completed

    -- To check element value
     if let element = event.element {
         print(element)
     }
 }

 */

// Diferent with OF, here element is a value on the array
observable4.subscribe { event in
//    print(event)
    if let element = event.element {
        print(element)
    }
}
observable4.subscribe(onNext: { element in
    print(element)
}).dispose()

// Diferent with FROM, here 1 element is the Array
observable3.subscribe { event in
//    print(event)
    if let element = event.element {
        print(element)
    }
}

/*
 Disposing and Terminating

 Subcribe allways is listening, so we need disposing this subscription.

 */

let subscription4 = observable4.subscribe(onNext: { element in
    print(element)
})
subscription4.dispose()

// Other way
let disposeBag = DisposeBag()
Observable.of("A","B","C")
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)


// Create Function
Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?") // Not called because I completed before.
    return Disposables.create()

}.subscribe(onNext: { print($0) },
            onError: { print($0) },
            onCompleted: { print("completed") },
            onDisposed: { print("Disposed")
}).disposed(by: disposeBag)


/*
 Subjects: Event from someone
 Public Subject
 Behavior Subject
 Replay Subject
 */

// PublishSubject
let subject = PublishSubject<String>()
subject.onNext("Issue 1")
subject.subscribe { event in
    print(event)
}
subject.onNext("Issue 2")
subject.onNext("Issue 3")
//subject.dispose()
subject.onCompleted()
subject.onNext("Issue 4")

// BehaviorSubject
let behaviorSubject = BehaviorSubject(value: "Initial value")
behaviorSubject.onNext("Last Issue") //Show first value not, initial value, because I execute onNext before subscribe
behaviorSubject.subscribe { event in
    print(event)
}
behaviorSubject.onNext("Issue 1")

// ReplaySubject
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("Issue replaySubject 1")
replaySubject.onNext("Issue replaySubject 2")
replaySubject.onNext("Issue replaySubject 3")
replaySubject.subscribe { event in
    print(event)
}

replaySubject.onNext("Issue replaySubject 4")
replaySubject.onNext("Issue replaySubject 5")
replaySubject.onNext("Issue replaySubject 6")

// Deprecated: Variable
let variableSubject = Variable("Initial value")
variableSubject.value = "Hello World"
variableSubject.asObservable()
    .subscribe {
        print($0)
    }
let variableSubject2 = Variable([String]())
variableSubject2.value.append("Hello World")
variableSubject2.asObservable()
    .subscribe {
        print($0)
    }
variableSubject2.value.append("How are you?")

// BehaviorRelay
let behaviorRelay = BehaviorRelay(value: ["Item 1"])
var value = behaviorRelay.value
value.append("Item 2")
value.append("Item 3")

behaviorRelay.accept(value)

behaviorRelay.asObservable()
    .subscribe {
        print($0)
    }
