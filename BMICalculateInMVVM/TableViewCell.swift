//
//  TableViewCell.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier:String = "Cell"
    
    let name:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let height:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let weight:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let bmi:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var info:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,height,weight,bmi])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.alignment = .fill
        return stackView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(info)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: topAnchor),
            info.rightAnchor.constraint(equalTo: rightAnchor),
            info.leftAnchor.constraint(equalTo: leftAnchor),
            info.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func configuration(_ info:BMIInfo){
        name.text = "姓名:" + info.name
        height.text = "身高:\(info.height)"
        weight.text = "體重：\(info.weight)"
        bmi.text = "BMI:\(info.bmi)"
    }

}
