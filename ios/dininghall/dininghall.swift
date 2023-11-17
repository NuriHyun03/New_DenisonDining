import WidgetKit
import SwiftUI
import Foundation

func isCurtisHallOpenNow(currentDate:Date) -> Bool {
    let currentDay = Calendar.current.component(.weekday, from: currentDate)
    let currentTime = Calendar.current.component(.hour, from: currentDate) * 60 + Calendar.current.component(.minute, from: currentDate)
    switch currentDay {
    case 1: // Sunday
        if (7*60+55...14*60+25).contains(currentTime) || (16*60+25...19*60+55).contains(currentTime) {
            return true
        }
    case 2...6: // Week
        if (7*60+25...10*60+25).contains(currentTime) || (10*60+55...14*60+25).contains(currentTime) || (16*60+25...19*60+55).contains(currentTime) {
            return true
        }
    case 7: // Saturday
        if (7*60+55...14*60+25).contains(currentTime) || (16*60+25...18*60+55).contains(currentTime) {
            return true
        }

    default:
        return false
    }

    return false
}

func isHuffmanHallOpenNow(currentDate:Date) -> Bool {
    let currentDay = Calendar.current.component(.weekday, from: currentDate) //getting day Sun=1 .... Sat=7
    let currentTime = Calendar.current.component(.hour, from: currentDate) * 60 + Calendar.current.component(.minute, from: currentDate) //make time into minutes ex)12:30 -> 12*60+30 = 750
    switch currentDay {
    case 1: // Sunday
        if (7*60+55...14*60+25).contains(currentTime) || (16*60+55...20*60+55).contains(currentTime) {
            return true
        }
    case 2...5: // Monday, Tuesday, Wednesday, Thursday
        if (7*60+25...10*60+25).contains(currentTime) || (11*60+25...13*60+55).contains(currentTime) || (16*60+55...20*60+55).contains(currentTime) {
            return true
        }
    case 6: // Friday
        if (7*60+25...10*60+25).contains(currentTime) || (11*60+25...13*60+55).contains(currentTime) || (16*60+55...19*60+55).contains(currentTime) {
            return true
        }
    case 7: // Saturday
        if (7*60+55...14*60+25).contains(currentTime) || (16*60+55...19*60+25).contains(currentTime) {
            return true
        }
    default:
        return false
    }

    return false
}


func isSlayterOpenNow(currentDate:Date) -> Bool {
    let currentDay = Calendar.current.component(.weekday, from: currentDate)
    let currentTime = Calendar.current.component(.hour, from: currentDate) * 60 + Calendar.current.component(.minute, from: currentDate)
    switch currentDay {
    case 1: // Sunday
        if (11*60+55...21*60+55).contains(currentTime){
            return true
        }
    case 2...6: // Week
        if (6*60+55...10*60+25).contains(currentTime) || (11*60+00...21*60+55).contains(currentTime) {
            return true
        }
    case 7: // Saturday
        if (11*60+55...21*60+55).contains(currentTime) {
            return true
        }
    default:
        return false
    }

    return false
}
func getDateString(currentDate:Date)-> Text{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM"
    let dateString = dateFormatter.string(from: currentDate)
    return Text(dateString)
}

func whatTimeisit(currentDate:Date) -> Array<String>{
    var timeslot = [String]()
    let currentDay = Calendar.current.component(.weekday, from: currentDate) //getting day Sun=1 .... Sat=7
    let currentTime = Calendar.current.component(.hour, from: currentDate) * 60 + Calendar.current.component(.minute, from: currentDate) //make time into minutes ex)12:30 -> 12*60+30 = 750
    switch currentDay {
    case 1: // Sunday
        if (0...14*60+30).contains(currentTime){
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("12:00 AM - 10:00 PM")
        }
        else if (14*60+25...22*60+0).contains(currentTime) {
            timeslot.append("04:30 PM - 08:00 PM")
            timeslot.append("05:00 PM - 09:00 PM")
            timeslot.append("12:00 PM - 10:00 PM")
        }
        else if (21*60+59...23*60+59).contains(currentTime){
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:00 AM - 10:30 AM")
        }
        else {
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
        }
    case 2...5: // Monday, Tuesday, Wednesday, Thursday
        if (0...10*60+30).contains(currentTime){ //breakfast
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:00 AM - 10:30 AM")
        }
        else if(10*60+25...14*60+30).contains(currentTime) { //lunch time
            timeslot.append("11:00 AM - 02:30 PM")
            timeslot.append("11:30 AM - 02:00 PM")
            timeslot.append("11:05 AM - 10:00 PM")
        }
        else if (14*60+30...22*60+0).contains(currentTime) { //dinner time
            timeslot.append("04:30 PM - 08:00 PM")
            timeslot.append("05:00 PM - 09:00 PM")
            timeslot.append("11:05 AM - 10:00 PM")
        }
        else if (22*60+0...23*59+59).contains(currentTime){
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:00 AM - 10:30 AM")
        }
        else{
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
        }
    case 6: // Friday
        if (0...10*60+30).contains(currentTime) {
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:30 AM - 10:30 AM")
            timeslot.append("07:00 AM - 10:30 AM")
        }
        else if (10*60+25...14*60+30).contains(currentTime){
            timeslot.append("11:00 AM - 02:30 PM")
            timeslot.append("11:30 AM - 02:00 PM")
            timeslot.append("11:05 AM - 10:00 PM")
        }
        else if (14*60+25...21*60+59).contains(currentTime) {
            timeslot.append("04:30 PM - 08:00 PM")
            timeslot.append("05:00 PM - 08:00 PM")
            timeslot.append("11:05 AM - 10:00 PM")
        }
        else if (21*60+59...23*60+59).contains(currentTime) {
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("12:00 AM - 10:00 PM")
        }
        else{
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
        }
    case 7: // Saturday
        if (0...14*60+30).contains(currentTime){
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("12:00 AM - 10:00 PM")
        }
        else if (14*60+25...19*60+30).contains(currentTime) {
            timeslot.append("04:30 PM - 07:00 PM")
            timeslot.append("05:00 PM - 07:30 PM")
            timeslot.append("12:00 PM - 10:00 PM")
        }
        else if (19*60+30...23*60+59).contains(currentTime) {
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("08:00 AM - 02:30 PM")
            timeslot.append("12:00 AM - 10:00 PM")
        }
        else {
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
            timeslot.append("Will get updated soon")
        }
    default:
        return timeslot
    }

    return timeslot
}
struct dininghallEntry: TimelineEntry {
    let date: Date
    let statusH: Bool //Huffman Status
    let statusC: Bool //Curtis Status
    let statusS: Bool //Slayter Status
}
struct dininghallProvider: TimelineProvider {
    func placeholder(in context: Context) -> dininghallEntry {
        let currentDate = Date() //Get current date
        let statusH = isHuffmanHallOpenNow(currentDate:currentDate)
        let statusC = isCurtisHallOpenNow(currentDate:currentDate)
        let statusS = isSlayterOpenNow(currentDate:currentDate)
        return dininghallEntry(date: currentDate, statusH: statusH,statusC: statusC,statusS: statusS)
    }

    func getSnapshot(in context: Context, completion: @escaping (dininghallEntry) -> ()) {
        let currentDate = Date()
        let statusH = isHuffmanHallOpenNow(currentDate:currentDate)
        let statusC = isCurtisHallOpenNow(currentDate:currentDate)
        let statusS = isSlayterOpenNow(currentDate:currentDate)
        let entry = dininghallEntry(date: currentDate, statusH: statusH,statusC: statusC,statusS: statusS)
        completion(entry)
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<dininghallEntry>) -> Void) {
        var entries: [dininghallEntry] = []

        let currentDate = Date()
        let nextRefreshTime = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        let statusH = isHuffmanHallOpenNow(currentDate:currentDate)
        let statusC = isCurtisHallOpenNow(currentDate:currentDate)
        let statusS = isSlayterOpenNow(currentDate:currentDate)
        entries.append(dininghallEntry(date: currentDate, statusH: statusH,statusC: statusC,statusS: statusS))
        //refresh the widget every 1 minute
        let timeline = Timeline(entries: entries, policy: .after(nextRefreshTime))
        completion(timeline)
        }
    }


struct dininghall: Widget {
    let kind: String = "Denison Dining"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: dininghallProvider()) { entry in
            dininghallView(entry: entry)
        }
        .configurationDisplayName("Denison Dining Hall Status Widget")
        .description("Check if the dining hall is open.")
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall,.systemMedium])
    }
}

struct dininghallView: View {
    let entry: dininghallEntry
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.colorScheme) var colorScheme
    //Colors for dark mode
    var fontColor: Color {
        colorScheme == .dark ? .white : .black
    }
    var Back : Color {
        colorScheme == .dark ? .black : .white
    }
    let image = Image("applogo")
    
    var body: some View {
        let currentDate = Date()
        switch widgetFamily {
        case .systemSmall:
            ZStack(alignment: .center){
                HStack{
                    VStack(alignment: .leading,spacing:10){
                        Spacer()
                        HStack{
                            VStack(alignment: .leading){
                                image.resizable().frame(maxWidth: 40, maxHeight: 50)
                            }.padding(-10)
                            Spacer().frame(width: 25)
                            VStack(alignment: .leading){
                                Text("Today")
                                    .font(.system(size: 17)
                                        .weight(.bold)).foregroundColor(fontColor)
                                getDateString(currentDate: currentDate)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            }
                        }
                        Spacer().frame(height: 1)
                        VStack(alignment: .leading, spacing:6){
                            HStack{
                                Spacer().frame(width: 15)
                                if entry.statusC == true {
                                    Circle().frame(width: 15, height: 15).foregroundColor(Color.green)
                                } else {
                                    Circle().frame(width: 15, height: 15).foregroundColor(Color.red)
                                }
                                Spacer().frame(width: 15)
                                Text("Curtis")
                                    .font(.system(size: 14))
                                    .foregroundColor(fontColor)
                            }
                            HStack{
                                Spacer().frame(width: 15)
                                if entry.statusH == true {
                                    Circle().frame(width: 15, height: 15).foregroundColor(Color.green)
                                } else {
                                    Circle().frame(width: 15, height: 15).foregroundColor(Color.red)
                                }
                                Spacer().frame(width: 15)
                                Text("Huffman")
                                    .font(.system(size: 14))
                                    .foregroundColor(fontColor)
                            }
                            HStack{
                                Spacer().frame(width: 15)
                                if entry.statusS == true {
                                    Circle().frame(width: 15, height: 15).foregroundColor(Color.green)
                                } else {
                                    Circle().frame(width: 15, height: 15).foregroundColor(Color.red)
                                }
                                Spacer().frame(width: 15)
                                Text("Slayter")
                                    .font(.system(size: 14))
                                    .foregroundColor(fontColor)
                            }
                        }
                        Spacer()
                    }.padding(-15).frame(minWidth: 70)
                }
            }.frame(width: 155, height: 155)
                .cornerRadius(21.67).widgetBackground(Back)
        case .systemMedium:
            var CurtisT=whatTimeisit(currentDate: currentDate)[0]
            var HuffmanT=whatTimeisit(currentDate: currentDate)[1]
            var SlayterT=whatTimeisit(currentDate: currentDate)[2]
            ZStack(alignment: .center){
                image.resizable().frame(maxWidth: 80, maxHeight: 100).opacity(0.5).offset(x: 40, y:-5)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Curtis")
                                .font(.system(size: 15)
                                  .weight(.bold)
                                ).foregroundColor(fontColor)
                            Text(CurtisT)
                                .font(.system(size: 12))
                              .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.66))
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            if entry.statusC == true {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 51, height: 16)
                                  .background(Color(red: 0, green: 0.72, blue: 0.09))
                                  .cornerRadius(2)
                            } else {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 51, height: 16)
                                  .background(Color.red)
                                  .cornerRadius(2)
                            }
                            
                        }
                    }
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 312, height: 0.5)
                      .background(Color(red: 0.2, green: 0.19, blue: 0.21))
                    HStack{
                        VStack(alignment: .leading){
                            Text("Huffman")
                                .font(.system(size: 15)
                                  .weight(.bold)
                                ).foregroundColor(fontColor)
                            Text(HuffmanT)
                                .font(.system(size: 12))
                              .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.66))
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            if entry.statusH == true {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 51, height: 16)
                                  .background(Color(red: 0, green: 0.72, blue: 0.09))
                                  .cornerRadius(2)
                            } else {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 51, height: 16)
                                  .background(Color.red)
                                  .cornerRadius(2)
                            }
                        }
                    }
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 312, height: 0.5)
                      .background(Color(red: 0.2, green: 0.19, blue: 0.21))
                    HStack{
                        VStack(alignment: .leading){
                            Text("Slayter")
                                .font(.system(size: 15)
                                  .weight(.bold)
                                ).foregroundColor(fontColor)
                            Text(SlayterT)
                                .font(.system(size: 12))
                              .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.66))
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            if entry.statusS == true {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 51, height: 16)
                                  .background(Color(red: 0, green: 0.72, blue: 0.09))
                                  .cornerRadius(2)
                            } else {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 51, height: 16)
                                  .background(Color.red)
                                  .cornerRadius(2)
                            }
                        }
                    }
                    
                }
            }.widgetBackground(Back).padding()
        default:
            Text("Default")
        }
    }
}
//This is for iOS 17 containerBackground API and to make it work below iOS17.
extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
struct Widget_Previews: PreviewProvider {
    static var previews: some View {
        let currentDate = Date()
        Group {
            dininghallView(entry: dininghallEntry(date: currentDate, statusH: isHuffmanHallOpenNow(currentDate:currentDate),statusC: isCurtisHallOpenNow(currentDate:currentDate),statusS: isSlayterOpenNow(currentDate:currentDate)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))

            dininghallView(entry: dininghallEntry(date: currentDate, statusH: isHuffmanHallOpenNow(currentDate:currentDate),statusC: isCurtisHallOpenNow(currentDate:currentDate),statusS: isSlayterOpenNow(currentDate:currentDate)))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
