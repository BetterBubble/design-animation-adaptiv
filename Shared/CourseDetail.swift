//
//  CourseDetail.swift
//  DesignCodeCourse5
//
//  Created by Alex on 22.04.2021.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = courses[0]
    var namespace: Namespace.ID
    // создаем переменного нам типа, типа в котором нужные нам элементы были в прошлом вью и заменяем ими старые
    #if os(iOS)
    var cornerRadius: CGFloat = 10
    #else
    var cornerRadius: CGFloat = 0
    #endif
    @State var showModal = false
    
    var body: some View {
        #if os(iOS)
        content
        .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content: some View {
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item) /* объеденили файл со всеми курсами в файл вью, чтобы можно было легко добавлять и исправлять курсы нужные нам, мы это сделали в отедльном файле courseRow*/
                            .sheet(isPresented: $showModal) {
                                CourseSectionDetail()
                            }
                            .onTapGesture {
                                showModal = true
                            }
                        Divider() // убираются разделения между строками
                    } .padding(2)
                    // ForEach образуется с помощью cmd + click по элементу, которые мы хотим приумножить и нажатием на repeat там
                }
                .padding(8)
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
