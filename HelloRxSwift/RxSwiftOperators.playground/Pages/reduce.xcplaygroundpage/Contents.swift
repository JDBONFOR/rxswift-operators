import UIKit
import RxSwift
import RxCocoa

/*
 RxSwift Operators
 Reduce
 */

// Reduce
let disposeBag = DisposeBag()

let source = Observable.of(1,2,3)

// Short way
source.reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// Complete way
source.reduce(0, accumulator: {
    summary, newValue in
    return summary + newValue
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
