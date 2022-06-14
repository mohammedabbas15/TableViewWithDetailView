//
//  ViewController.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/9/22.
//

import UIKit

class ViewController: UIViewController {
    let viewModel: UserAccess = ViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        print(self.viewModel.numberOfHighSchools())
    }
    
    private func setUpUI() {
        self.title = "City of New York High Schools"
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.tableView)
        self.tableView.bindToSuperView(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfHighSchools()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.schoolName.text = self.viewModel.highSchoolName(index: indexPath.row)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let highSchoolInfo = self.viewModel.highSchoolInfo(index: indexPath.row)
        guard let DBN = highSchoolInfo.dbn else {
            return
        }
        guard let schoolName = highSchoolInfo.schoolName else {
            return
        }
        guard let numOfSatTestTakers = highSchoolInfo.numOfSatTestTakers else {
            return
        }
        guard let avgReadingScore = highSchoolInfo.satCriticalReadingAvgScore else {
            return
        }
        guard let avgMathScore = highSchoolInfo.satMathAvgScore else {
            return
        }
        guard let avgWritingScore = highSchoolInfo.satWritingAvgScore else {
            return
        }
        detailViewController.DBN.text = "DBN Number: " + DBN
        detailViewController.schoolName.text = "High School Name: " + schoolName
        detailViewController.numofTestTakers.text = "Participants: " + numOfSatTestTakers
        detailViewController.readingScoreAvg.text = "Average Reading Scores: " + avgReadingScore
        detailViewController.mathScoreAvg.text = "Average Math Scores: " + avgMathScore
        detailViewController.writingScoreAvg.text = "Average Writing Scores: " + avgWritingScore
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
