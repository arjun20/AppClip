//
//  Account.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

struct Account {
    var orderHistory = [Order]()
    var pointsSpent = 0
    var unstampedPoints = 0
    
    var pointsEarned: Int {
        orderHistory.reduce(0) { $0 + $1.points }
    }
    
    var unspentPoints: Int {
        pointsEarned - pointsSpent
    }
    
    var canRedeemFreeSmoothie: Bool {
        unspentPoints >= 10
    }
    
    mutating func clearUnstampedPoints() {
        unstampedPoints = 0
    }
    
    mutating func appendOrder(_ order: Order) {
        orderHistory.append(order)
        unstampedPoints += order.points
    }
}
