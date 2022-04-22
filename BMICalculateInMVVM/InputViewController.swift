//
//  InputViewController.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/21.
//

import UIKit

class InputViewController: UIViewController{
    
    private let inputers = InputView()
    
    private let resultViewController = ViewController()
    
    override func loadView() {
        super.loadView()
        view = inputers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTextField()
    }
    
    private func setNavigationBar(){
        title = "輸入個人資訊"
        let correct = UIBarButtonItem(title: "確定", style: .plain, target: self, action: #selector(correctAction))
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationItem.rightBarButtonItem = correct
    }
    
    @objc func correctAction(){
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    private func setTextField(){
        inputers.nameInputer.inputColumn.delegate = self
        inputers.weightInputer.inputColumn.delegate = self
        inputers.heightInputer.inputColumn.delegate = self
        inputers.nameInputer.inputColumn.tag = 1
        inputers.heightInputer.inputColumn.tag = 2
        inputers.weightInputer.inputColumn.tag = 3
    }
    
    private func setNextTextField(_ textField:UITextField){
        let nextTextField = textField.tag + 1
        if let nextTextField = inputers.viewWithTag(nextTextField) as? UITextField{
            nextTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
    }
    
    private func inputInfo(){
        resultViewController.viewModel.appendRow(inputers.nameInputer.inputColumn.text!,
                                                 inputers.heightInputer.inputColumn.text!,
                                                 inputers.weightInputer.inputColumn.text!)
    }
}

extension InputViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.setNextTextField(textField)
        return true
    }
}
