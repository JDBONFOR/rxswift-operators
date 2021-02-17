import UIKit
import RxSwift
import RxCocoa

/*
 RxSwift Operators
 With Latest From
 */

// With Latest From
let disposeBag = DisposeBag()

let button = PublishSubject<Void>()
let textField = PublishSubject<String>()

let observable = button.withLatestFrom(textField)
let disposable = observable.subscribe(onNext: {
    print($0)
})

textField.onNext("Sw")
textField.onNext("Swif")
textField.onNext("Swift")
textField.onNext("Swift Rocks!")

button.onNext(())
button.onNext(())
