//
//  ToDo.swift
//  toDo
//
//  Created by Vitaliy on 26.11.2021.
//

import Foundation


struct TodoItem{
    let id: String
    let text : String;
    let important : enumImportant;
    let deathline: Date?
    
    init(byText text : String, id: String = "", important: enumImportant, deathline: Date? = nil){

        self.id = id == "" ? UUID().uuidString : id;
        self.text = text;
        self.important = important
        self.deathline = deathline
       
    }
}

enum enumImportant: String{
    case important
    case normal
    case unimportant
}

struct keyJsonToDo{
    static let id = "id"
    static let text = "text"
    static let important = "important"
    static let deathline = "deathline"
    
}

extension TodoItem{
    
    var json: Any{
        
        var json = [ keyJsonToDo.id : id, keyJsonToDo.text :text]
        
        if let deathLine = deathline{
            json[keyJsonToDo.deathline] = String(deathLine.timeIntervalSince1970)
        }
        
        if  important != enumImportant.normal{
            json[keyJsonToDo.important] = important.rawValue
        }
       
        return (json)

        
    }
    static func parse(json: Any) -> TodoItem? {
        

        guard let json = (json as? [String:String]) else {return nil}
        
        guard let id = json[keyJsonToDo.id] else {return nil}
        guard let text = json[keyJsonToDo.text] else {return nil}
        
        var date : Date?
        
        if let deathLine = json[keyJsonToDo.deathline] {
           
            if let d = Double(deathLine){
                 date = Date(timeIntervalSince1970: d)
            }
            
        }
        
        
        if let important_string = json[keyJsonToDo.important]  {
            
            if let imp = enumImportant(rawValue: important_string){
                
                return TodoItem(byText: text, id: id, important: imp, deathline: date)
            }
        }
        
        return TodoItem(byText: text, id: id, important: enumImportant.normal , deathline: date)
    }

}

class FileCache{
    
}





