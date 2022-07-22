//
//  SuperMusicians.swift
//  MusicianClass
//
//  Created by Emre Gemici on 18.07.2022.
//

import Foundation

class SuperMusicians : Musicians{
    
    func sing2(){
        print("Vamosss")
    }
    
    override func sing(){
        print("Get in there Lewiss")
        super.sing() // Miras aldığım sınıftaki oluşturulmuş fonksiyonu kullanabilmek için super metodunu çağırıyorum.
    }
    
}
