//
//  Model.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/20.
//

import Foundation

struct BMIInfo{
    let name:String
    let height:Double
    let weight:Double
    var bmi:Double{
        return weight / (height/100) * (height/100)
    }
}
