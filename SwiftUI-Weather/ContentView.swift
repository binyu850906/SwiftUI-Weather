//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by binyu on 2021/7/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, buttonColor: isNight ? .gray : Color("lightBlue"))
            VStack{
                
                CityTextView(cityName: "Cupertino,CA")
                
                MainWeatherStatusView(imageName: isNight ? "cloud.moon.bolt.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 10){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 64)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 73)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 63)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "wind", temperature: 56)
                    
                }
            
            Spacer()
            
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
            Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek :String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var buttonColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, buttonColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°").font(Font.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 60)
    }
}
