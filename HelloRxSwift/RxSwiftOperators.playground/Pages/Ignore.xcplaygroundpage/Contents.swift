//: [Previous](@previous)

import UIKit
import RxSwift
import PlaygroundSupport

/*
 RxSwift Operators
 
 Ignore
 Element At
 Filter
 Skip
 Skip While
 Skip Until
 ...
 */


// Ignore
let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()

strikes
    .ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
    }
    .disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes
    .onCompleted()
