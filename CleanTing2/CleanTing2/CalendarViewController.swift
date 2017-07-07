//
//  CalendarViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 4..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit
import CVCalendar



class CalendarViewController: UIViewController{
    
    
    
    
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var currentCalendar: Calendar?
    
    var animationFinished = true
    var shouldShowDaysOut = true
    
    var selectedDay:DayView!
    
    override func awakeFromNib() {
        let timeZoneBias = 480 // (UTC+08:00)
        currentCalendar = Calendar.init(identifier: .gregorian)
        if let timeZone = TimeZone.init(secondsFromGMT: -timeZoneBias * 60) {
            currentCalendar?.timeZone = timeZone
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentCalendar = currentCalendar {
            monthLabel.text = CVDate(date: Date(), calendar: currentCalendar).koreanDescription
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
    }
}
extension CalendarViewController : CVCalendarViewDelegate, CVCalendarMenuViewDelegate{
    public func presentationMode() -> CalendarMode {
        return .monthView
    }
    public func firstWeekday() -> Weekday {
        return .sunday
    }
    
    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        selectedDay = dayView
        
        //필요한 데이터는 월, 일
        
        print(selectedDay.date.year) //년
        print(selectedDay.date.month) //월
        print(selectedDay.date.day) // 일
        
        let data = "\(selectedDay.date.year)-\(selectedDay.date.month)-\(selectedDay.date.day)"
        
        print(" 달력 데이터 : \(data)")
        
        UserDefaults.standard.set(data, forKey: "calendar_data")
        //자동 으로 뒤로 가기
        navigationController?.popViewController(animated: true)
        
    }
    
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.frame, shape: CVShape.circle)
        circleView.fillColor = .colorFromCode(0xffc900)
        return circleView
    }
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        if (dayView.isCurrentDay) {
            return true
        }
        return false
    }
    
    
    func calendar() -> Calendar? {
        return currentCalendar
    }
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {
        return UIColor.gray
    }
    func dayLabelPresentWeekdayHighlightedBackgroundColor() -> UIColor {
        return UIColor.orange
    }
    func dayLabelPresentWeekdaySelectedBackgroundColor() -> UIColor {
        return UIColor.orange
    }
    func dayLabelPresentWeekdaySelectedBackgroundAlpha() -> CGFloat {
        return 1.0
    }
    func dayLabelWeekdaySelectedBackgroundAlpha() -> CGFloat {
        return 0.0
    }
    func dayLabelPresentWeekdayHighlightedBackgroundAlpha() -> CGFloat {
        return 1.0
    }
    func dayLabelPresentWeekdayTextColor() -> UIColor {
        return UIColor.gray
    }
    func dayLabelWeekdaySelectedTextColor() -> UIColor {
        return UIColor.blue
    }
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return false
    }
    func shouldShowWeekdaysOut() -> Bool {
        return shouldShowDaysOut
    }
    
    func shouldAnimateResizing() -> Bool {
        return true // Default value is true
    }
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .hangeul
    }
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool { //구분선 추가
        return true
    }
    func dayLabelFont(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIFont { return UIFont.systemFont(ofSize: 13)
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        if monthLabel.text != date.koreanDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .center
            updatedMonthLabel.text = date.koreanDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransform(translationX: 0, y: offset)
            updatedMonthLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
            
            UIView.animate(withDuration: 0.35, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransform(translationX: 0, y: -offset)
                self.monthLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransform.identity
                
            }) { _ in
                
                self.animationFinished = true
                self.monthLabel.frame = updatedMonthLabel.frame
                self.monthLabel.text = updatedMonthLabel.text
                self.monthLabel.transform = CGAffineTransform.identity
                self.monthLabel.alpha = 1
                updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
    func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        
        guard let currentCalendar = currentCalendar else {
            return false
        }
        var components = Manager.componentsForDate(Foundation.Date(), calendar: currentCalendar)
        
        /* For consistency, always show supplementaryView on the 3rd, 13th and 23rd of the current month/year.  This is to check that these expected calendar days are "circled". There was a bug that was circling the wrong dates. A fix was put in for #408 #411.
         
         Other month and years show random days being circled as was done previously in the Demo code.
         */
        
        if dayView.date.year == components.year &&
            dayView.date.month == components.month {
            
            if (dayView.date.day == 3 || dayView.date.day == 13 || dayView.date.day == 23)  {
                //print("Circle should appear on " + dayView.date.commonDescription)
                return true
            }
            return false
        } else {
            
            if (Int(arc4random_uniform(3)) == 1) {
                return true
            }
            
            return false
        }
        
    }
    
}

// MARK: - CVCalendarViewAppearanceDelegate

extension CalendarViewController: CVCalendarViewAppearanceDelegate {
    
    func dayLabelWeekdayDisabledColor() -> UIColor {
        return UIColor.lightGray
    }
    
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return false
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 0
    }
}
// MARK: - IB Actions
extension CalendarViewController {
    @IBAction func loadPrevious(sender: AnyObject) {
        calendarView.loadPreviousView()
    }
    
    
    @IBAction func loadNext(sender: AnyObject) {
        calendarView.loadNextView()
    }
    
}

extension CalendarViewController {
    
    func didShowNextMonthView(_ date: Date) {
        guard let currentCalendar = currentCalendar else {
            return
        }
        
        let components = Manager.componentsForDate(date, calendar: currentCalendar) // from today
        
        print("Showing Month: \(components.month!)")
    }
    
    
    func didShowPreviousMonthView(_ date: Date) {
        guard let currentCalendar = currentCalendar else {
            return
        }
        
        let components = Manager.componentsForDate(date, calendar: currentCalendar) // from today
        
        print("Showing Month: \(components.month!)")
    }
}
