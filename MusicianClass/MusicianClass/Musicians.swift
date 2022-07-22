//
//  Musicians.swift
//  MusicianClass
//
//  Created by Emre Gemici on 18.07.2022.
//

import Foundation
enum MusicianType {
    case Guitarist
    case Vocalist
    case Bassits
    case Violenist
    case Drummer
}
class Musicians {
    var name : String = ""
    var age : Int = 0
    var instrument : String = ""
    var type : MusicianType

    init(initName : String, intAge : Int, initInstrument : String, initType : MusicianType){
        name=initName
        age=intAge
        instrument=initInstrument
        type=initType 
    
    }
    
    func sing(){
        print("Smooth Operaatooorr")
    }
    
}
