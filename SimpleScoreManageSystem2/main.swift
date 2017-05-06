//
//  main.swift
//  SimpleScoreManageSystem
//
//  Created by 邹前立 on 2017/4/5.
//  Copyright © 2017年 邹前立. All rights reserved.
//

import Foundation

let input = -1
var inputItem:Int = -1
var scoreObj = ScoreManage() // 初始化数组 scoreArr

while input != 0 {
    
    // 显示菜单
    ScoreManage.displayMenu()
    print("请输入对应数字进行操作")
    
    // 输入整数菜单选项
    if let input = (Int)(ScoreManage.inputString()) {
        inputItem = input
    }
    // 根据整数调用对应方法
    switch inputItem {
    case 0:
        print("退出程序！")
    case 1:
        scoreObj.scoreArr = ScoreManage.initScore()
    case 2:
        let avr:Float = ScoreManage.average(arr:scoreObj.scoreArr)
        print("平均成绩为：\(avr)")
    case 3:
        let count:Int = ScoreManage.count(arr: scoreObj.scoreArr)
        print("大于85分的人数：\(count)")
    case 4:
        ScoreManage.update(oldScore: scoreObj.scoreArr) // 或者利用返回值赋值给属性
    case 5:
        ScoreManage.displayAllScore(arr: scoreObj.scoreArr)
    default:
        print("输入错误")
    }
    inputItem = -1 // 重置，不然回车有上一次输入的值，直接运行上次的选项。但是退出选项后会输出菜单。while中inputItem改为使用input判断0，退出
    
}





