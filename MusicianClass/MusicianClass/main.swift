//
//  main.swift
//  MusicianClass
//
//  Created by Emre Gemici on 18.07.2022.
//

import Foundation

let sam = Musicians(initName: "Same", intAge: 37, initInstrument: "Guitar", initType:.Guitarist)
print(sam.age)
print(sam.type)

let daniel = SuperMusicians(initName: "Daniel", intAge: 27, initInstrument: "Drum", initType: .Drummer)
daniel.sing()

