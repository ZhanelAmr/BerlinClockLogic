//
//  main.swift
//  BerlinClockLogic
//
//  Created by Zhanel Amralina on 7/14/24.
//

import Foundation

print("Enter hours:")
let hoursInput = Int(readLine()!)!

print("Enter minutes:")
let minutesInput = Int(readLine()!)!

print("Enter seconds:")
let secondsInput = Int(readLine()!)!


func testSecondsLamp(seconds: Int) -> String {
    return seconds % 2 == 0 ? "Y" : "O"
}

func testFiveHoursRow(hours: Int) -> String {
    return processHours(lights: 4, divide: hours / 5)
}

func testSingleHoursRow(hours: Int) -> String {
    return processHours(lights: 4, divide: hours % 5)
}

func testFiveMinutesRow(minutes: Int) -> String {
    return processFiveMinutes(lights: 11, divide: minutes / 5)
}

func testSingleMinutesRow(minutes: Int) -> String {
    return processMinutes(lights: 4, divide: minutes % 5)
}

// Processing hours
func processHours(lights: Int, divide: Int) -> String {
    let offLights = lights - divide
    var resultOn = ""
    var resultOff = ""
    
    if divide > 0 {
        for _ in 1...divide {
            resultOn += "R" // Red lights for hours
        }
    }
    if offLights > 0 {
        for _ in 1...offLights {
            resultOff += "O" // Off lights
        }
    }
    
    return resultOn + resultOff
}

// Processing five-minute intervals with correct color coding
func processFiveMinutes(lights: Int, divide: Int) -> String {
    let offLights = lights - divide
    var resultOn = ""
    var resultOff = ""
    
    if divide > 0 {
        for i in 1...divide {
            if i % 3 == 0 {
                resultOn += "R"
            } else {
                resultOn += "Y"
            }
        }
    }
    if offLights > 0 {
        for _ in 1...offLights {
            resultOff += "O"
        }
    }
    
    return resultOn + resultOff
}

// Processing single-minute intervals
func processMinutes(lights: Int, divide: Int) -> String {
    let offLights = lights - divide
    var resultOn = ""
    var resultOff = ""
    
    if divide > 0 {
        for _ in 1...divide {
            resultOn += "Y"
        }
    }
    if offLights > 0 {
        for _ in 1...offLights {
            resultOff += "O"
        }
    }
    
    return resultOn + resultOff
}

// Displaying the results
func displayResults() {
    print(testSecondsLamp(seconds: secondsInput),
          testFiveHoursRow(hours: hoursInput),
          testSingleHoursRow(hours: hoursInput),
          testFiveMinutesRow(minutes: minutesInput),
          testSingleMinutesRow(minutes: minutesInput))
}

displayResults()
