//
//  ExperienceViewModel.swift
//  ManiApp
//
//  Created by neumacbcp on 04/03/26.
//

import SwiftUI
import Combine

class ExperienceViewModel: ObservableObject {
    @Published var experienceItems: [ExperienceItemModel] = [
        ExperienceItemModel(title: "Primary language and frameworks", subtitle: "Swift, SwiftUI,Objective-C,Swift Package Manager, Cocoa Touch, Cocoa pods", imageName: "applelogo", description: ""),
        ExperienceItemModel(title: "Secondary skills and frameworks", subtitle: "Flutter, Dart, River Pod, Provider, Getx", imageName: "book.fill"),
        ExperienceItemModel(title: "Notifications", subtitle: "APNS, Firebase", imageName: "car.fill"),
        ExperienceItemModel(title: "IDE Tools", subtitle: "Xcode, Visual studio, Android Studio", imageName: "car.fill"),
        ExperienceItemModel(title: "API", subtitle: "REST, GraphQL, Http Package", imageName: "car.fill"),
        ExperienceItemModel(title: "Performance and debugging tools", subtitle: "StaticAnalyser, Instrumentation for memory leaks and performance issues.", imageName: "car.fill"),
        ExperienceItemModel(title: "User interface creation tools", subtitle: "Interface builder, Storyboard, Auto Layout, Programatic UI", imageName: "car.fill"),
        ExperienceItemModel(title: "Core Technics", subtitle: "Keychain Services, Security Framework,Instruments,Performance Optimazation, Memory Management, CICD(Github Actions), JSON Decodable", imageName: "car.fill"),
        ExperienceItemModel(title: "Rich iOS user interface frameworks", subtitle: "Core Graphics, Core animation techniques", imageName: "car.fill"),
        ExperienceItemModel(title: "Third party frameworks", subtitle: "URL Session,Alamofire,AFNetworking, Firebase, Google Maps, Social media login.CocoaPods,Swiift Package Manager, Core location, MapKit", imageName: "car.fill"),
        ExperienceItemModel(title: "Third party tracking APIs /tools", subtitle: "Google analytics, Crashlytics.", imageName: "car.fill"),
        ExperienceItemModel(title: "iOS Best practices/ Patterns/Way of working", subtitle: "MVC, MVVM, CleanArchitecture patterns, protocol oriented programming.", imageName: "car.fill"),
        ExperienceItemModel(title: "Dist.technologies / Infrastructure", subtitle: "Firebase cloud service, RESTFULJSON web services, GraphQL API Service.", imageName: "car.fill"),
        ExperienceItemModel(title: "Databases", subtitle: "SQLite", imageName: "car.fill"),
        ExperienceItemModel(title: "ORM technologies", subtitle: "CoreData", imageName: "car.fill"),
        ExperienceItemModel(title: "Payment gateway", subtitle: "Paypal, Stripe, JustPay", imageName: "car.fill"),
        ExperienceItemModel(title: "Agile Software DevelopmentTool", subtitle: "JIRA", imageName: "car.fill"),
        ExperienceItemModel(title: "Version controlling", subtitle: "Git, Bitbucket, GitLab", imageName: "car.fill"),
        ExperienceItemModel(title: "Versioning Tools", subtitle: "GitHub Desktop, SourceTree and Xcode", imageName: "car.fill"),
        ExperienceItemModel(title: "Testing frameworks", subtitle: "Unit Testing,XCTest, Testflight", imageName: "car.fill"),
        ExperienceItemModel(title: "UI/UX Tools", subtitle: "Zeplin, Adobe XD, Invision, Figma", imageName: "car.fill"),
        ExperienceItemModel(title: "Development methodologies", subtitle: "Pair programming, Agile, Scrum", imageName: "car.fill"),

        ]
        
    
    
    @Published var companyExperienceItems: [ExperienceItemModel] = [
        ExperienceItemModel(title: "Neurealm (Formarly GSLab/ Gavs)", subtitle: "Senior Software Engineer", description: "from April 2024 to till Date"),
        ExperienceItemModel(title: "Canny Digital Solutions", subtitle: "Senior Software Developer", description: "from Jan 2023 to Jan 2024"),
        ExperienceItemModel(title: "Photon Technology", subtitle: "Senior Software Developer", description: "from June 2021 to May 2022"),
        ExperienceItemModel(title: "Pickzy Software Pvt Ltd", subtitle: "Senior Software Developer", description: "from Sep 2019 to Dec 2020"),
        ExperienceItemModel(title: "O’Clock Software Pvt Ltd", subtitle: "iOS Developer", description: "from Sep 2015 to April 2019"),
        ]
    
   
}


