import UIKit
import RxSwift
import RxCocoa

/*
 RxSwift Operators
 flatMapLatest
 */

// flatMapLatest
let disposeBag = DisposeBag()

struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()

student.asObservable()
    .flatMapLatest { return $0.score.asObservable() }
    .subscribe( onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)
john.score.accept(100)

student.onNext(mary)
john.score.accept(45)
