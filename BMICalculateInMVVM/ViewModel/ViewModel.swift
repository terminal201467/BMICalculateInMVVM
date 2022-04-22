//
//  ViewModel.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/20.
//

import Foundation

class ViewModel{
    
    var isLoading:Bool = false{
        didSet{
            self.valueChanged?()
        }
    }
    
    var info:[BMIInfo] = []

    //MARK:-Binding
    var valueChanged:(()->Void)?
    
    //MARK:Method
    public func appendRow(_ name:String,_ height:String,_ weight:String){
        info.append(BMIInfo(name: name, height: Double(height)!, weight: Double(weight)!))
    }
    
    public func numberOfRowInSection(_ section:Int)->Int{
        info.count
    }
    
    public func getCellViewModel(_ indexPath:IndexPath) -> BMIInfo{
        return info[indexPath.row]
    }
}
