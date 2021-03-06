//
//  HJBarChartView.swift
//
//
//  Created by Jaehyeon Park on 2021/12/05.
//

import SwiftUI


public struct HJBarChartView: View {
    
    let elements: [HJChartElement]
    let showLegend: Bool
    
    public init(elements: [HJChartElement], showLegend: Bool = true) {
        self.elements = elements
        self.showLegend = showLegend
    }
    
    public var body: some View {
        
        VStack {

            // Chart
            GeometryReader { geometry in
                
                HStack(spacing: 0) {
                
                    ForEach(elements.indices, id: \.self) { index in
                        
                        let element = self.elements[index]
                        let width = element.value * Float(geometry.size.width)
                        let color = element.color ?? HJChartView.colors[index % HJChartView.colors.count]
                        
                        HJBarChartSection(width: width, color: color)
                    }
                    
                }
                .cornerRadius(geometry.size.height / 5)
                
            }

            // Legend
            if showLegend {
                HStack(alignment: .center) {
                    
                    ForEach(elements.indices, id: \.self) { index in
                        
                        let element = self.elements[index]
                        let color = element.color ?? HJChartView.colors[index % HJChartView.colors.count]
                        
                        HJBarChartLegend(title: element.title, color: color)
                    }
                    
                }
                .padding([.top], 7)
            }

        }
        
    }
    
    
}


struct HJBarChartSection: View {
    
    let width: Float
    let color: Color
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .frame(width: CGFloat(width))
        
    }
    
}


struct HJBarChartLegend: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        
        VStack {
            Rectangle()
                .foregroundColor(color)
                .frame(width: 10, height: 10)
            Text(title)
                .font(.system(size: 13.0, weight: .light, design: .default))
        }
        
    }
    
}


struct HJBarChartView_Previews: PreviewProvider {
    
    static let elements = [
        HJChartElement(title: "Class0", value: 0.1),
        HJChartElement(title: "Class1", value: 0.2),
        HJChartElement(title: "Class2", value: 0.4),
        HJChartElement(title: "Class3", value: 0.3),
    ]
    
    

    static var previews: some View {
        
        Group {
            
            HJBarChartView(elements: HJBarChartView_Previews.elements)
                .previewLayout(.fixed(width: 200, height: 80))
            
            HJBarChartView(elements: HJBarChartView_Previews.elements)
                .previewLayout(.fixed(width: 300, height: 90))
            
            HJBarChartView(elements: HJBarChartView_Previews.elements)
                .previewLayout(.fixed(width: 400, height: 100))
            
        }
        
    }
    
}
