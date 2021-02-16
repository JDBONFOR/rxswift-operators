import UIKit
import RxSwift

/*
 RxSwift Operators
 toArray
 */

// toArray
let disposeBag = DisposeBag()

Observable.of(1,2,3,4,5)
    .toArray()
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

