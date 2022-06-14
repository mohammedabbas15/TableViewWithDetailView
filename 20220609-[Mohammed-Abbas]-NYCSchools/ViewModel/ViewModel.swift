//
//  ViewModel.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/10/22.
//

import Foundation
import UIKit

// the protocol will make it easy to call necessary functions
protocol UserAccess{
    func returnList() -> Welcome
    func highSchoolName(index: Int) -> String
    func numberOfHighSchools() -> Int
    func bind(updateHandler: @escaping () -> Void)
    func highSchoolInfo(index: Int) -> WelcomeElement
}

class ViewModel {
    var highSchoolList: Welcome {
        didSet {
            self.updateHandler?()
        }
    }
    var updateHandler: (() -> Void)?
    let network: GetData
    
    init(list: Welcome = [], network: GetData = NetworkManager()){
        self.network = network
        self.highSchoolList = list
        self.network.getList(url: EndPoint.Data.url){
            [weak self] (result: Result<Welcome, Error>) in
            switch result {
            case .success(let list):
                self?.highSchoolList.append(contentsOf: list)
                print(list)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewModel: UserAccess {
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    func returnList() -> Welcome{
        return self.highSchoolList
    }
    func numberOfHighSchools() -> Int{
        return self.highSchoolList.count
    }
    func highSchoolName(index: Int) -> String{
        guard let highSchoolName = self.highSchoolList[index].schoolName else{
            return "No Name Available"
        }
        return highSchoolName
    }
    func highSchoolInfo(index: Int) -> WelcomeElement{
        return self.highSchoolList[index]
    }
}
