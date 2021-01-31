import UIKit
import RxSwift
import PlaygroundSupport

/*
 RxSwift Operators
 skipUntil
 */

// Skip
let disposeBag = DisposeBag()
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")

subject.onNext("C")
