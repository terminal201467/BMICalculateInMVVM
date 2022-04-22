//
//  inPutVIew.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/21.
//

import UIKit

class InputView: UIView {

    var nameInputer:Inputer = {
       let inputer = Inputer()
        inputer.item.text = "姓名:"
        return inputer
    }()
    
    var heightInputer:Inputer = {
       let inputer = Inputer()
        inputer.item.text = "身高:"
        return inputer
    }()
    
    var weightInputer:Inputer = {
       let inputer = Inputer()
        inputer.item.text = "體重:"
        return inputer
    }()
    
    private lazy var inputers:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameInputer,heightInputer,weightInputer])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(inputers)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        NSLayoutConstraint.activate([
            nameInputer.heightAnchor.constraint(equalToConstant: 50),
            nameInputer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 2/3),
            heightInputer.heightAnchor.constraint(equalToConstant: 50),
            heightInputer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 2/3),
            weightInputer.heightAnchor.constraint(equalToConstant: 50),
            weightInputer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 2/3),
            
            inputers.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            inputers.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -200)
        ])
    }
}
