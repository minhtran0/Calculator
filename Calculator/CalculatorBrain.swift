//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Minh Tran on 8/21/16.
//  Copyright © 2016 Minh. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var value: Double
    func get() -> Double {
        return self.value
    }
    func set(newValue: Double) {
        self.value = newValue
    }
    
    init() {
        value = 0
    }
    func performOperation(op: String, val: Double) {
        switch op {
        case "+","-","*","/":
            value = val
            evaluateBinaryOperation();
            pending = PendingOperation(value: value, op: op)
        case "=":
            value = val
            evaluateBinaryOperation();
            pending = nil
        case "+/-":
            value = -1*val
        case "%":
            value = val/100
        case "C":
            value = 0
            pending = nil
        default:
            break
        }
    }
    
    func evaluateBinaryOperation() {
        if (pending != nil) {
            switch pending!.op {
            case "+":
                value = pending!.value + value
            case "-":
                value = pending!.value - value
            case "*":
                value = pending!.value * value
            case "/":
                value = pending!.value / value
            default:
                break
            }
        }
    }
    
    private var pending: PendingOperation?
    
    struct PendingOperation {
        var value: Double
        var op: String
    }
}