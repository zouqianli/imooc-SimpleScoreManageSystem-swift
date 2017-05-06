//
//  ScoreManage.swift
//  SimpleScoreManageSystem
//
//  Created by 邹前立 on 2017/4/5.
//  Copyright © 2017年 邹前立. All rights reserved.
//

import Foundation

//MARK:-成绩管理
// static 修饰的方法是类方法
class ScoreManage {
    var scoreArr:[Float] = []
    
    //MARK:显示菜单
    static func displayMenu(){
        print("*************************************")
        print("\t1--初始化数学成绩")
        print("\t2--求成绩的平均值")
        print("\t3--统计成绩大于85分的人数")
        print("\t4--修改制定位置处的成绩")
        print("\t5--打印输出所有成绩")
        print("\t0--退出")
        print("*************************************")
    }
    
    //MARK:1初始化成绩数组
    static func initScore() -> [Float] {
        print("请输入要存储数学成绩的数量")
        var num:Int
        num = (Int)(self.inputString())!
        
        var arr = [Float]() // 初始化
        var i:Int = 0
        while i < num {
            print("请输入第\(i+1)个学生的数学成绩")
            if let score = (Float)(self.inputString()) {
                arr.append(score)
                i += 1
            }
        }
        return arr
    }
    
    //MARK:2求平均成绩
    static func average(arr:[Float]) -> Float {
        if arr.count == 0 {
            print("成绩数组为空，请先初始初始化数学成绩")
            return -1
        }
        var sum:Float = 0.0
        var avr:Float = 0.0
        for score in arr {
            sum += score
            avr = sum / (Float)(arr.count)
        }
        return avr
    }
    
    //MARK:3统计成绩大于85分的人数
    static func count(arr:[Float]) -> Int {
        if arr.count == 0 {
            print("成绩数组为空，请先初始初始化数学成绩")
            return -1
        }
        var count = 0
        for score in arr {
            if score > 85 {
                count += 1
            }
        }
        return count
    }
    
    //MARK:4修改指定位置处成绩
    static func update(oldScore:[Float]) {
        if oldScore.count == 0 {
            print("成绩数组为空，请先初始初始化数学成绩")
            return
        }
        print("修改前：")
        print("成绩为：")
        // public func print(_ items: Any..., separator: String = default, terminator: String = default)
//        for score in oldScore {
//            print(score,separator:"\t",terminator:" ")
//        }
        self.displayAllScore(arr: oldScore);
        print("")
        var inputIndex:Int = -1000
        var indexArray:[Int] = []
        while inputIndex < 0 || inputIndex > scoreObj.scoreArr.count-1 { // index range
            print("请输入要修改数据的位置（从0开始）")
            if let index = (Int)(ScoreManage.inputString()) {
                inputIndex = index
            }
        }
        indexArray.append(inputIndex) // 存储索引
        var inputValue:Float = -1000.0
        while inputValue < 0 || inputValue > 100 {
            print("请输入0～100的数据")
            if let input = (Float)(ScoreManage.inputString()) {
                inputValue = input
            }
        }
        //        print(indexArray[0])
        let idx = oldScore.index(oldScore.startIndex, offsetBy:indexArray[0]) // 索引偏移量
        
        var newScore:[Float] = oldScore
        for _ in (0..<newScore.count) {
            if idx == indexArray[0] {
                newScore[idx] = inputValue // 修改
            }
        }
        print("修改后：")
        print("成绩为：")
        scoreObj.scoreArr = newScore // 赋值给属性，其他方法可以访问；或者利用返回值赋值给属性
//        for score in newScore {
//            print(score,separator:"\t",terminator:" ")
//        }
        self.displayAllScore(arr: newScore);
        print("")
    }
    
    //MARK:5打印输出所有成绩
    static func displayAllScore(arr:[Float]) {
        if arr.count == 0 {
            print("成绩数组为空，请先初始初始化数学成绩")
            return
        }
        for score in arr {
            print("\(score)",separator:" ",terminator:" ")
        }
        print("")
    }
    
    // MARK:输入数据
    static func inputString() -> String{
        let input = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)
        if let str = input {
            let index = str.index(str.endIndex, offsetBy:-1); // 去掉回车换行符
            return str.substring(to: index)
        }else {
            return "";
        }
    }
    
}
