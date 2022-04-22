//
//  CustomObject.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/21.
//

import UIKit


class Inputer:UIView{
    
    let item:UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    let inputColumn:UITextField = {
        let textField = UITextField()
        textField.placeholder = "輸入..."
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var inputer:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [item,inputColumn])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(inputer)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        NSLayoutConstraint.activate([
            inputer.topAnchor.constraint(equalTo: topAnchor),
            inputer.rightAnchor.constraint(equalTo: rightAnchor),
            inputer.leftAnchor.constraint(equalTo: leftAnchor),
            inputer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
