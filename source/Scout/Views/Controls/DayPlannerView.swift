//
//  DayPlanner.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import SwiftUI
import SwiftDate

struct DayPlannerView: View {
    var model:DayPlanner
    
    init(model: DayPlanner) {
        self.model = model
    }
    
    
    var body: some View {
        ZStack() {
            Color.white
            VStack(alignment: .center) {
                Spacer()
                ForEach(Array<Player>(model.players ?? [])) {
                    player in
 
                    Text(player.firstName ?? "")
                }
                
                Text(model.startTime?.toFormat("h a") ?? "")
                    .font(.caption)
                Spacer()
                HStack() {
                    Text(model.location ?? "")
                        .font(.system(size: 12))
                        .padding(5)
                    Spacer()
                } // HStack
            } // VStack
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .center) {
                        Text(model.day?.toFormat("d") ?? "")
                            .font(.largeTitle)
                        Text(model.day?.toFormat("EEE") ?? "")
                            .font(.title3)
                    }.padding(6)

                    Spacer()
                    Button(action: {
                        print("button pressed")
                    }) {
                        Image(systemName: "square.and.pencil")
                    }.padding(10)
                }
                Spacer()
                HStack(alignment: .bottom) {
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Image("weather_sunny")
                            .resizable()
                            .frame(width: 32.0, height: 32.0, alignment: .center)
                        Text("80°")
                            .font(.caption)
                    }.padding(3)
                }
            } // VStack
        }.border(.black) // ZStack
    }
}


struct DayPlannerView_Previews: PreviewProvider {
    let model = DayPlanner()

    static var previews: some View {
        let awayTeam = Team()
        let homeTeam = Team()
        let today = Date()
        
        let model = DayPlanner()
        
        return VStack(alignment: .leading) {
                      HStack(alignment: .top) {
                             DayPlannerView(model: model)
                                .frame(width: 175.0, height: 120.0)
                             Spacer()
                      }
                      Spacer()
        }.background(Color.gray.opacity(0.1))
    }
}
