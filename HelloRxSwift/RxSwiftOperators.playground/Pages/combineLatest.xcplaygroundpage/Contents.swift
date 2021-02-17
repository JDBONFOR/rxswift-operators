import UIKit
import RxSwift
import RxCocoa

/*
 RxSwift Operators
 Combine Latest
 */

// Combine Latest
let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left, right, resultSelector: { lastLeft, lastRight in
    "\(lastLeft) and \(lastRight)"
})

let disposable = observable.subscribe(onNext: { value in
    print(value)
})

left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(1)
right.onNext(2)
