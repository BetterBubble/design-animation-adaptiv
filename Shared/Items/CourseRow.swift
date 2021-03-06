//
//  CourseRow.swift
//  DesignCodeCourse5
//
//  Created by Alex on 14.04.2021.
//

import SwiftUI

struct CourseRow: View {
    var item: CourseSection =  courseSections[0]
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.logo)
                .renderingMode(.original)
                .frame(width: 49.0, height: 49.0)
                .imageScale(.medium)
                .background(item.color)
                .clipShape(Circle())
                
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
