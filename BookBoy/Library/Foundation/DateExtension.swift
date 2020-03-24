//
//  Date+Swift.swift
//  
//
//  Created by wangyang on 2018/5/18.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Date {
    public var isToday: Bool {
        return isSameDay(with: Date())
    }
    
    public var isTomorrow: Bool {
        return isSameDay(with: Date().intervalDays(1))
    }
    
    public var isYesterday: Bool {
        return isSameDay(with: Date().intervalDays(-1))
    }
    
    public func isSameDay(with date: Date) -> Bool {
        return zeroTimeStamp() == date.zeroTimeStamp()
    }
    
    public func isSameMonth(with date: Date) -> Bool {
        return firstDayOfCurrentMonth().isSameDay(with: date.firstDayOfCurrentMonth())
    }
    
    public func isSameYear(with date: Date) -> Bool {
        return firstDayOfCurrentYear().isSameDay(with: date.firstDayOfCurrentYear())
    }
    
    public func isSameWeek(with date: Date) -> Bool {
        let startTimeStamp = zeroTimeStamp()
        let endTimeStamp = date.zeroTimeStamp()
        return startTimeStamp - endTimeStamp == 86400.0 * Double(getChineseWeek() - date.getChineseWeek())
    }
    
    public func before(days: UInt) -> Date {
        return Date(timeInterval: TimeInterval.secondsPerDay * days.number.doubleValue * -1, since: self)
    }
    
    public func after(days: UInt) -> Date {
        return Date(timeInterval: TimeInterval.secondsPerDay * days.number.doubleValue, since: self)
    }
    
    public func daysBetweenDate(_ date: Date) -> Int {
        let time = timeIntervalSince(date)
        return Int((abs(time) / TimeInterval.secondsPerDay) + 0.5)
    }
    
    public func daysSinceNow() -> Int {
        return Int(ceil(timeIntervalSinceNow / TimeInterval.secondsPerDay))
    }
    
    public func secondsSince1970() -> Int64 {
        return Int64(timeIntervalSince1970)
    }
    
    public func msecondsSince1970() -> Int64 {
        return Int64(timeIntervalSince1970 * 1000.0)
    }
}

// MARK: - 获取日期的某些属性
extension Date {
    
    public func getYear() -> Int {
        return self.ymdComponets().year ?? 0
    }
    
    public func getMonth() -> Int {
        return self.ymdComponets().month ?? 0
    }
    
    public func getDay() -> Int {
        return self.ymdComponets().day ?? 0
    }
    
    public func getWeek() -> Int {
        let comps = Calendar.current.dateComponents([.weekday], from: self)
        return comps.weekday ?? 0
    }
    
    public func getChineseWeek() -> Int {
        let week = getWeek()
        return week == 1 ? 7 : (week - 1)
    }
    
    public func getWeekDesc() -> String {
        switch getWeek() {
        case 1:
            return "星期日"
        case 2:
            return "星期一"
        case 3:
            return "星期二"
        case 4:
            return "星期三"
        case 5:
            return "星期四"
        case 6:
            return "星期五"
        case 7:
            return "星期六"
        default:
            return ""
        }
    }
    
    public func ymdComponets() -> DateComponents {
        return Calendar.current.dateComponents([.year, .month, .day], from: self)
    }
    
    public func hmComponets() -> DateComponents {
        return Calendar.current.dateComponents([.hour, .minute], from: self)
    }
    
    public func is24Hours() -> Bool {
        var is24Hours = true
        let dateStr = Date().description(with: Locale.current)
        let sysbols = [Calendar.current.amSymbol,Calendar.current.pmSymbol]
        for sys in sysbols {
            if (dateStr.range(of: sys) != nil) {
                is24Hours = false
                break
            }
        }
        return is24Hours
    }
}

// MARK: - 获取特定的时间
extension Date {

    public func zeroTimeStamp() -> TimeInterval {
        return zeroTimeStampDate().timeIntervalSince1970
    }
    
    public func zeroTimeStampDate() -> Date {
        let comp = Calendar.current.dateComponents([.year, .month, .day], from: self)
        if let date = Calendar.current.date(from: comp) {
            return date
        }
        return self
    }
    
    public func lastTimeStampDate() -> Date {
        return zeroTimeStampDate().addingTimeInterval(TimeInterval.secondsPerDay - 0.001)
    }
    
    public func intervalDays(_ days: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
    
    public func intervalMonths(_ months: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = months
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
    
    public func intervalYears(_ years: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = years
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
    
    public func firstDayOfCurrentMonth() -> Date {
        var comp = Calendar.current.dateComponents([.year, .month, .day], from: self)
        comp.day = 1
        if let date = Calendar.current.date(from: comp) {
            return date
        }
        return self
    }
    
    public func firstDayOfCurrentYear() -> Date {
        var comp = Calendar.current.dateComponents([.year, .month, .day], from: self)
        comp.day = 1
        comp.month = 1
        if let date = Calendar.current.date(from: comp) {
            return date
        }
        return self
    }
    
    public func lastDayOfCurrentMonth() -> Date {
        return firstDayOfCurrentMonth().intervalMonths(1).intervalDays(-1).lastTimeStampDate()
    }
    
    public func lastDayOfCurrentYear() -> Date {
        return firstDayOfCurrentYear().intervalYears(1).intervalDays(-1).lastTimeStampDate()
    }
    
    public func dateAfterMine() -> Date {
        var dateComponents = DateComponents()
        dateComponents.minute = 1
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
    
    public func dateAfterOneMonth() -> Date {
        return intervalMonths(1)
    }
    
    public func mondayOfCurrentWeek() -> Date {
        if getWeek() == 1 {
            return intervalDays(-6).zeroTimeStampDate()
        } else {
            let offset = 2 - getWeek()
            return intervalDays(offset).zeroTimeStampDate()
        }
    }
}


public enum DateFormat: String {
    case MMddHHmm = "MM-dd HH:mm"
    case yyyyMMddHHmm = "yyyy-MM-dd HH:mm"
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    case yyyyMMdd = "yyyy-MM-dd"
    case ahmm = "ah:mm"
    case HHmm = "HH:mm"
    case HHmmss = "HH:mm:ss"
    case hmm = "h:mm"
    case EHHmm = "E HH:mm"
    case ddHHmm = "dd号 HH:mm"
}

// MARK: - Date与DateString的相互转换
extension Date {
    public func toString(with format: DateFormat) -> String {
        return toString(withFormatString: format.rawValue)
    }
    public func toString(withFormatString string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = string
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
    public func toRFC1123String() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"
        return formatter.string(from: self)
    }
}
