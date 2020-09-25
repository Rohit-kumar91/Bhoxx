//
//  Date+Extentions.swift
//  Auttle
//
//  Created by CodeBrew on 9/18/17.
//  Copyright © 2017 CodeBrew. All rights reserved.
//

import Foundation


//MARK:- DATE Extention
extension Date {
    
    
    func toLocalTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        
        return formatter.string(from: self)
    }
    func toLocalDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: self)
    }
    
    //"dd MMM yy
    
    func toLocalDate_DD_MMM_yy() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: self)
    }
    
    func toLocalDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy hh:mm aa"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: self)
    }
    
    
    func toFormattedDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: self)
    }
    
    func toString(format:String)->String{
        
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == .orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == .orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == .orderedSame {
            isEqualTo = true
        }
        //Return Result
        return isEqualTo
    }
    
    
    
    
    
    
    //    func isdateEqual(toDate:Date)->Bool{
    //
    ////      return self.year == toDate.year && self.day == toDate.day && self.month == toDate.month ? true : false
    //    }
    
    func subtractDays(daysToAdd: Int) -> Date {
        
        let secondsInDays: TimeInterval = -(Double(daysToAdd) * 60 * 60 * 24)
        let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays) as Date
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addDays(daysToAdd: Int) -> Date {
        
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays) as Date
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> Date {
        
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours) as Date
        
        //Return Result
        return dateWithHoursAdded
    }
    
    
    func addMintues(mintuesToAdd : Int) -> Date {
        let secondsInMintues : TimeInterval = Double(mintuesToAdd) * 60
        let dateWithmintuesAdded: Date = self.addingTimeInterval(secondsInMintues) as Date
        //Return Result
        return dateWithmintuesAdded
    }
    
    //date to string
    func dateToString(format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //Your New Date format as per requirement change it own
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US")
        let newDate = dateFormatter.string(from: self)
        
        return newDate
    }
    
    func dateToStringWithShortStyle() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.short
        let newDate = dateFormatter.string(from: self)
        return newDate
    }
    
    func addTime(time: Date) -> Date? {
        
        let calendar = NSCalendar.current
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        
        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year!
        mergedComponments.month = dateComponents.month!
        mergedComponments.day = dateComponents.day!
        mergedComponments.hour = timeComponents.hour!
        mergedComponments.minute = timeComponents.minute!
        mergedComponments.second = timeComponents.second!
        
        return calendar.date(from: mergedComponments)
    }
    
    var millisecondsSince1970:Double {
        return Double((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    
    func getNextDays(_ days : Int) -> [Date] {
        
        var arrDates = [Date]()
        
        let currentDate = Date()
        arrDates.append(currentDate)
        
        for i in 1...days {
            
            let dateUpdated = currentDate.addDays(daysToAdd: i)
            arrDates.append(dateUpdated)
        }
        return arrDates
    }
    
    func getTimeSlots(_ startTime : String , endTime : String) -> [String] {
        
        var arrSlots = [String]()
        
        let dateFrmtted = Formatter.dateFormatddMMYYYY.string(from: self)
        
        let strStart = dateFrmtted + " \(/startTime.uppercased())"
        let strEnd = dateFrmtted + " \(/endTime.uppercased())"
        
        if var startDateFrmtted = Formatter.dateFormatddMMYYYYA.date(from: strStart)
            , let endDateFrmtted = Formatter.dateFormatddMMYYYYA.date(from: strEnd){
            //  print(startDateFrmtted)
            while (startDateFrmtted < endDateFrmtted) {
                arrSlots.append(Formatter.amPM.string(from: startDateFrmtted))
                startDateFrmtted = startDateFrmtted.addMintues(mintuesToAdd: 30)
            }
        }
        return arrSlots
    }
    
    
    
    public func timeAgoSince() -> String {
        
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
        
        if let year = components.year, year >= 2 {
            return "\(year)" + " " + "years ago".localized
        }
        
        if let year = components.year, year >= 1 {
            return "Last year".localized
        }
        
        if let month = components.month, month >= 2 {
            return "\(month)" + " " + "months ago".localized
        }
        
        if let month = components.month, month >= 1 {
            return "Last month".localized
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return "\(week)" + " " + "weeks ago".localized
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return "Last week".localized
        }
        
        if let day = components.day, day >= 2 {
            return "\(day)" + " " + "days ago".localized
        }
        
        if let day = components.day, day >= 1 {
            return "Yesterday".localized
        }
        
        if let hour = components.hour, hour >= 2 {
            return "\(hour)" + " " + "hours ago".localized
        }
        
        if let hour = components.hour, hour >= 1 {
            return "An hour ago".localized
        }
        
        if let minute = components.minute, minute >= 2 {
            return "\(minute)" + " " + "mins ago".localized
        }
        
        if let minute = components.minute, minute >= 1 {
            return "a min ago".localized
        }
        
        if let second = components.second, second >= 3 {
            return "\(second)" + " " + "secs ago".localized
        }
        return "Just now".localized
    }
    
    public func timePending(endTime : Date) -> String {
        
        let calendar = Calendar.current
        let now = endTime
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
        
        if let year = components.year, year >= 2 {
            return "\(year) years"
        }
        
        if let year = components.year, year >= 1 {
            return "year"
        }
        
        if let month = components.month, month >= 2 {
            return "\(month) months"
        }
        
        if let month = components.month, month >= 1 {
            return "\(month) month"
        }
        
        if let week = components.weekOfYear, week >= 2 {
            return "\(week) weeks"
        }
        
        if let week = components.weekOfYear, week >= 1 {
            return "\(week) week"
        }
        
        if let day = components.day, day >= 2 {
            return "\(day) days"
        }
        
        if let day = components.day, day >= 1 {
            return "\(day) day"
        }
        
        if let hour = components.hour, hour >= 2 {
            return "\(hour) hours"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "\(hour) hour"
        }
        
        if let minute = components.minute, minute >= 2 {
            return "\(minute) minutes"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "\(minute) minute"
        }
        
        if let second = components.second, second >= 3 {
            return "\(second) seconds"
        }
        return "1 second"
    }
    
    public func timeAgo() -> String {
        
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])
        
        
        if let week = components.weekOfYear, week >= 1 {
            return "\(week)w"
        }
        
        if let day = components.day, day >= 1 {
            return "\(day)d"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "\(hour)h"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "\(minute)m"
        }
        
        if let second = components.second, second >= 1 {
            return "\(second)s"
        }
        return "1s"
    }
    
}

extension Double {
    func toDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self / 1000))
    }
}

extension Formatter {
    static let monthMedium: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL"
        return formatter
    }()
    static let hour12: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h"
        return formatter
    }()
    static let minute0x: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        return formatter
    }()
    
    static let dateFormatMagazine: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        return formatter
    }()
    
    static let amPM: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aa"
        return formatter
    }()
    
    static let dayName: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter
    }()
    
    static let dateFormatEvent: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter
    }()
    
    static let dateFormatBooking: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM - h:mm a"
        return formatter
    }()
    
    static let dateFormatSlots : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let dateFormatddMMYYYY : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    //With time zone
    static let dateFormatddMMYYYYA : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm aa"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    static let dateFormatServer : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    static let dateFormatYYYYMMddA : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm aa"
        formatter.timeZone = NSTimeZone.local
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    
}
extension Date {
    var monthMedium: String  { return Formatter.monthMedium.string(from: self) }
    var hour12:  String      { return Formatter.hour12.string(from: self) }
    var minute0x: String     { return Formatter.minute0x.string(from: self) }
    var amPM: String         { return Formatter.amPM.string(from: self) }
    var dayName: String         { return Formatter.dayName.string(from: self) }
}



enum Formatters : String{
    case UTC
    case ddMMMyyyy
    case ddMMMyy
    case ddMMyy
    case yyyyMMdd
    case mmmddyyyy
    case ddMMM
    case ZZ
    case timeAMPM
    case time
    case MMMdd
    case ddMMMEEE
    case ddMMMEEEHHMM
    case MMMYYYY
    case yyyyMMddhhmmA
    case dMMMhhmmA
    case EEEMMMdd
    func get() -> String{
        
        switch self {
            
        case .ZZ:
            return "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case .UTC:
            return "yyyy-MM-dd HH:mm:ss"
        case .ddMMMyyyy:
            return "dd MMM yyyy"
        case .ddMMMyy:
            return "dd MMM yy"
        case .ddMMyy:
            return "dd/MM/yy"
        case .ddMMM:
            return "dd MMM"
        case .yyyyMMdd:
            return "yyyy-MM-dd"
        case .mmmddyyyy:
            return "MMM dd, yyyy"
        case .timeAMPM:
            return "hh:mm a"
        case .time:
            return "HH:mm"
        case .MMMdd:
            return "MMM dd"
        case .ddMMMEEE:
            return "dd MMM (EEE)"
        case .ddMMMEEEHHMM:
            return "dd-MMM-yyyy hh:mm a"
        case .yyyyMMddhhmmA:
            return "yyyy-MM-dd hh:mm a"
        case .MMMYYYY:
            return "MMM yyyy"
        case .dMMMhhmmA:
            return "d MMM, h:mm a"
        case .EEEMMMdd:
            return "EEE, MMM dd"

        }
    }
}

extension String {
    // MARK: CONVERT DATE TIME
    func convertDateFormater(format: String = "d MMM, h:mm a", utcToLocal: Bool = false, fromFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", localToutc: Bool = false ) -> String {
        if self == "" {
            return ""
        }
        NSLog("convert date method\(fromFormat)")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        NSLog("convert date method1\(self)")
        dateFormatter.dateFormat = fromFormat
        dateFormatter.locale = NSLocale(localeIdentifier: "en-US") as Locale//NSLocale(localeIdentifier:NSLocale.preferredLanguages.first!) as Locale! //
        if localToutc {
            dateFormatter.timeZone = NSTimeZone.local
        } else if utcToLocal {
            dateFormatter.timeZone = Foundation.TimeZone(abbreviation: "UTC")
        } else {
            //  dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
            // dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        }
        let dateTime = dateFormatter.date(from: self)
        let formatter = DateFormatter()
        formatter.locale = NSLocale.current
        formatter.locale = NSLocale(localeIdentifier: "en-US") as Locale //NSLocale(localeIdentifier:NSLocale.preferredLanguages.first!) as Locale!
        if localToutc {
            formatter.timeZone = Foundation.TimeZone(abbreviation: "UTC")
        } else if utcToLocal {
            dateFormatter.timeZone = NSTimeZone.local
        } else {
            // formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
            // formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        }
        NSLog("convert date method3")
        formatter.dateFormat = format
        var dateString =  ""
        if dateTime != nil {
            dateString = formatter.string(from: dateTime ?? Date())
            NSLog("convert date method4\(dateString)")
        } else {
            NSLog("convert date method5")
            dateString = ""
        }
        return dateString
    }
}
