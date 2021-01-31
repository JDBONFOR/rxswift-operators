import UIKit
import RxSwift
import PlaygroundSupport

/*
 RxSwift Operators
 Element At : Select specified element on Observable elements.
 */


// Element At
let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

strikes.elementAt(2)
    .subscribe(onNext: { _ in
        print("You are out!")
    })
    .disposed(by: disposeBag)

strikes.onNext("X")
strikes.onNext("X")
strikes.onNext("X index 2")
