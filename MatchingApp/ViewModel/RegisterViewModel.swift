//
//  RegisterViewModel.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/18.
//

import Foundation
import RxSwift
import RxCocoa

class RegisterViewModel {
    
    private let disposeBag = DisposeBag()
    
    // MARK: observable
    var nameTextOutput = PublishSubject<String>()
    var emailTextOutput = PublishSubject<String>()
    var passwordTextOutput = PublishSubject<String>()
    var validRegisterSubject = BehaviorSubject<Bool>(value: false)
    
    // MARK: observer
    var nameTextInput: AnyObserver<String> {
        nameTextOutput.asObserver()
    }
    
    var emailTextInput: AnyObserver<String> {
        emailTextOutput.asObserver()
    }
    
    var passwordTextInput: AnyObserver<String> {
        passwordTextOutput.asObserver()
    }
    
    var validRegisterDriver: Driver<Bool> = Driver.never()
    
    init() {
        
        validRegisterDriver = validRegisterSubject
            .asDriver(onErrorDriveWith: Driver.empty())
        
        let nameValid = nameTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }
        
        let emailValid = emailTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }
        
        let passwordValid = passwordTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }
        
        Observable.combineLatest(nameValid, emailValid, passwordValid) { $0 && $1 && $2 }
            .subscribe { validAll in
                self.validRegisterSubject.onNext(validAll)
            }
            .disposed(by: disposeBag)

    }
    
}
