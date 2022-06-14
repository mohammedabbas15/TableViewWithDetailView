//
//  DetailViewController.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/11/22.
//

import UIKit

// the detail view will compose of the many labels we'll make from the data we get from the JSON and also contains the constraints for formatting
class DetailViewController: UIViewController {
    lazy var DBN: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var schoolName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var numofTestTakers: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var readingScoreAvg: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var mathScoreAvg: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var writingScoreAvg: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
    }
    
    func setupUI(){
        self.view.addSubview(self.DBN)
        self.view.addSubview(self.schoolName)
        self.view.addSubview(self.numofTestTakers)
        self.view.addSubview(self.readingScoreAvg)
        self.view.addSubview(self.mathScoreAvg)
        self.view.addSubview(self.writingScoreAvg)
        
        self.schoolName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.schoolName.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.schoolName.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.schoolName.bottomAnchor.constraint(equalTo: self.DBN.topAnchor, constant: -10).isActive = true
        
        self.DBN.topAnchor.constraint(equalTo: self.schoolName.bottomAnchor, constant: 10).isActive = true
        self.DBN.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.DBN.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.DBN.bottomAnchor.constraint(equalTo: self.numofTestTakers.topAnchor, constant: -10).isActive = true
        
        self.numofTestTakers.topAnchor.constraint(equalTo: self.DBN.bottomAnchor, constant: 10).isActive = true
        self.numofTestTakers.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.numofTestTakers.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.numofTestTakers.bottomAnchor.constraint(equalTo: self.readingScoreAvg.topAnchor, constant: -10).isActive = true
        
        self.readingScoreAvg.topAnchor.constraint(equalTo: self.numofTestTakers.bottomAnchor, constant: 10).isActive = true
        self.readingScoreAvg.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.readingScoreAvg.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.readingScoreAvg.bottomAnchor.constraint(equalTo: self.mathScoreAvg.topAnchor, constant: -10).isActive = true
        self.mathScoreAvg.topAnchor.constraint(equalTo: self.readingScoreAvg.bottomAnchor, constant: 10).isActive = true
        self.mathScoreAvg.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.mathScoreAvg.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.mathScoreAvg.bottomAnchor.constraint(equalTo: self.writingScoreAvg.topAnchor, constant: -10).isActive = true
        self.writingScoreAvg.topAnchor.constraint(equalTo: self.mathScoreAvg.bottomAnchor, constant: 10).isActive = true
        self.writingScoreAvg.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.writingScoreAvg.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
    }
}
