import UIKit
import RxSwift
import RxCocoa

/*
 RxSwift Operators
 Scan
 */

// Scan
let disposeBag = DisposeBag()

let source = Observable.of(1,2,3,5,6)

source.scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

