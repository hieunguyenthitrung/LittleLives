//
//  Event.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import UIKit
import ObjectMapper

enum EventType : String {
    case CheckOutType = "checkOut"
    case CheckInType = "checkIn"
    case EventType = "event"
    case PortfolioType = "portfolio"
    case HealthType = "everydayHealth"
    case StoryExportedType = "story_exported"
    case StoryPublishedType = "story_published"
}

enum EventStringType : String {
    case CheckOutType = "CHECK OUT"
    case CheckInType = "CHECK IN"
    case EventType = "EVENT"
    case PortfolioType = "PORTFOLIO"
    case HealthType = "EVERY HEALTH"
    case StoryExportedType = "STORY EXPORTED"
    case StoryPublishedType = "STORY PUBLISHED"
}

class Result: Mappable {
    var data: UserTimeline?
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        data                <- map["data"]
    }
}

class UserTimeline: Mappable {
    var userTimeline: [UserEvent]?
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        userTimeline                <- map["userTimeline"]
    }
}

class UserEvent: Mappable {
    var __typename: String = ""
    var eventDate: String = ""
    var eventDescription: String = ""
    var eventSnapshot: AnyObject?
    var eventType: String = ""
    var insertedAt: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        __typename                <- map["__typename"]
        eventDate                <- map["eventDate"]
        eventDescription                <- map["eventDescription"]
        eventType                <- map["eventType"]
        insertedAt                <- map["insertedAt"]
        
        let html = map["eventSnapshot"]
        if(eventType.contains(EventType.CheckOutType.rawValue) || eventType.contains(EventType.CheckInType.rawValue)){
            eventSnapshot = EventCheckInOut.init(JSON: (html.currentValue! as! String).parseHTMLJson!)
        }
        else if(eventType.contains(EventType.StoryExportedType.rawValue) || eventType.contains(EventType.StoryPublishedType.rawValue)){
            eventSnapshot = EventStoryPublishedExported.init(JSON: (html.currentValue! as! String).parseHTMLJson!)
        }
        else if(eventType.contains(EventType.HealthType.rawValue)){
            eventSnapshot = EventHealth.init(JSON: (html.currentValue! as! String).parseHTMLJson!)
        }
        else if(eventType.contains(EventType.PortfolioType.rawValue)){
            eventSnapshot = EventPortfolio.init(JSON: (html.currentValue! as! String).parseHTMLJson!)
        }
        else if(eventType.contains(EventType.EventType.rawValue)){
            eventSnapshot = Event.init(JSON: (html.currentValue! as! String).parseHTMLJson!)
        }
    }
}

class EventCheckInOut: Mappable {
    
    var checkinThumb: String = ""
    var checkinUrl: String = ""
    var msgParams: MsgParams?
    var referenceObj: ReferenceObject?
    var schoolId: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        checkinThumb                <- map["checkinThumb"]
        checkinUrl                <- map["checkinUrl"]
        msgParams                <- map["msgParams"]
        referenceObj                <- map["referenceObj"]
        schoolId                <- map["schoolId"]
    }
}

class MsgParams: Mappable {
    
    var attendanceRecordId: String = ""
    var checkInDate: String = ""
    var childName: String = ""
    var rawCheckInDate: String = ""
    var schoolName: String = ""
    
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        attendanceRecordId                <- map["attendanceRecordId"]
        checkInDate                <- map["checkInDate"]
        childName                <- map["childName"]
        rawCheckInDate                <- map["rawCheckInDate"]
        schoolName                <- map["schoolName"]
    }
}


class Event: Mappable {
    
    var childId: String = ""
    var childName: String = ""
    var eventDate: String = ""
    var eventTitle: String = ""
    var schoolId: String = ""
    var schoolName: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        childId                <- map["childId"]
        childName                <- map["childName"]
        eventDate                <- map["eventDate"]
        eventTitle                <- map["eventTitle"]
        schoolId                <- map["schoolId"]
        schoolName                <- map["schoolName"]
    }
}

class EventStoryPublishedExported: Mappable {
    
    var exp: String = ""
    var school_id: String = ""
    var url: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        exp                <- map["exp"]
        school_id                <- map["school_id"]
        url                <- map["url"]
    }
}

class EventPortfolio: Mappable {
    
    var albumId: String = ""
    var albumName: String = ""
    var caption: String = ""
    var childId: String = ""
    var childName: String = ""
    var fileId: String = ""
    var imageUrl: String = ""
    var referenceObj: ReferenceObject?
    var schoolId: String = ""
    var schoolName: String = ""
    var teacherName: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        albumId                <- map["albumId"]
        albumName                <- map["albumName"]
        caption                <- map["caption"]
        childId                <- map["childId"]
        childName                <- map["childName"]
        fileId                <- map["fileId"]
        imageUrl                <- map["imageUrl"]
        referenceObj                <- map["referenceObj"]
        schoolId                <- map["schoolId"]
        schoolName                <- map["schoolName"]
        teacherName                <- map["teacherName"]
    }
}


class EventHealth: Mappable {
    
    var activityClass: String = ""
    var activityId: String = ""
    var activitySubType: String = ""
    var activityType: String = ""
    var childName: String = ""
    var endTime: String = ""
    var referenceObject: ReferenceObject?
    var remarks: String = ""
    var schoolId: String = ""
    var startTime: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        activityClass                <- map["activityClass"]
        activityId                <- map["activityId"]
        activitySubType                <- map["activitySubType"]
        activityType                <- map["activityType"]
        childName                <- map["childName"]
        endTime                <- map["endTime"]
        referenceObject                <- map["referenceObject"]
        remarks                <- map["remarks"]
        startTime                <- map["startTime"]
        schoolId                <- map["schoolId"]
    }
    
}

class ReferenceObject : Mappable{
    var type: String = ""
    var value: String = ""
    
    init() {}
    
    required  init?(map: Map) {
        mapping(map: map)
    }
    
    func  mapping(map: Map) {
        type                <- map["type"]
        value                <- map["value"]
    }
}


