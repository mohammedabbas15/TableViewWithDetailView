//
//  TableViewCell.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/11/22.
//

import UIKit

// this class is pretty self explanitory, here we will make the individual cells
// the cells just contain the high school name
class TableViewCell: UITableViewCell {
    static let reuseId = "\(TableViewCell.self)"

    // here we make the label for the high schools
    lazy var schoolName: UILabel = {
        let schoolName = UILabel(frame: .zero)
        schoolName.translatesAutoresizingMaskIntoConstraints = false
        schoolName.numberOfLines = 0
        return schoolName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.addArrangedSubview(self.schoolName)
        self.contentView.addSubview(stackView)
        stackView.bindToSuperView(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func prepareForReuse() {
        self.schoolName.text = nil
    }
}
