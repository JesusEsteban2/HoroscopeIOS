//
//  File.swift
//  HoroscopeIOS
//
//  Created by Mañanas on 5/4/24.
//

import Foundation

struct Horoscope {
    let nombre: String
    let fechas: String
    let imageName: String
}

let horoArray = [
    Horoscope(nombre: "Acuario",fechas: "20 de enero al 18 de febrero", imageName: "aquarius"),
    Horoscope(nombre: "Piscis",fechas: "19 de febrero al 20 de marzo", imageName: "pisces"),
    Horoscope(nombre: "Aries",fechas: "21 de marzo al 19 de abril", imageName: "aries"),
    Horoscope(nombre: "Tauro",fechas: "20 de abril al 20 de mayo", imageName: "taurus"),
    Horoscope(nombre: "Geminis",fechas: "21 de mayo al 20 de junio", imageName: "gemini"),
    Horoscope(nombre: "Cancer",fechas: "21 de junio al 22 de julio", imageName: "cancer"),
    Horoscope(nombre: "Leo",fechas: "23 de julio al 22 de agosto", imageName: "leo"),
    Horoscope(nombre: "Virgo",fechas: "23 de agosto al 22 de septiembre", imageName: "virgo"),
    Horoscope(nombre: "Libra",fechas: "23 de septiembre al 22 de octubre", imageName: "libra"),
    Horoscope(nombre: "Escorpio",fechas: "23 de octubre al 21 de noviembre", imageName: "scorpio"),
    Horoscope(nombre: "Sagitario",fechas: "22 de noviembre al 21 de diciembre", imageName: "sagittarius"),
    Horoscope(nombre: "Capricornio",fechas: "22 de diciembre al 19 de enero", imageName: "capricorn"),
]

struct DataResponse:Codable {
    let date: String
    let horoscope_data:String
}
struct ApiData:Codable {
    let data:DataResponse
    let status:Int
    let success:Bool
}


func performAPICall(name:String) async throws -> String {
    let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(name)&day=TODAY")!
    //print ("Llamada a api")
    let (data,_) = try await URLSession.shared.data(from: url)
    //print ("data es vacio: \(data)")
    
    let decoder=JSONDecoder()
    let apiData:ApiData = try decoder.decode(ApiData.self, from: data)
    
    //print ("Llamada correcta?: \(apiData.success)")
    //print ("Pronostico?: \(apiData.data.horoscope_data)")
    
    return (apiData.data.horoscope_data)
}



