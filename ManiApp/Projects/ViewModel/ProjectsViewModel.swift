//
//  ProjectsViewModel.swift
//  ManiApp
//
//  Created by neumacbcp on 05/03/26.
//

import SwiftUI
import Combine

class ProjectsViewModel: ObservableObject {
    @Published var projectsExperienceItems: [ProjectsModel] = [
        ProjectsModel(title: "ABSLMF - Investor and Distributor", subtitle: """
• MF (Mutual Fund): An investment vehicle that pools money from multiple investors to invest in stocks, bonds, or other assets, managed by professional fund managers.
• SIP (Systematic Investment Plan): A method of investing a fixed amount regularly (monthly/weekly) in a mutual fund.
• Lumpsum: Investing a large amount of money at one time instead of in installments.
• Multi SIP: Investing in multiple SIPs at the same time in different schemes or dates.
• Chota SIP: A small SIP investment starting with low amount (e.g., ₹100).
• STP (Systematic Transfer Plan): Automatically transferring money from one mutual fund to another at intervals.
• SWP (Systematic Withdrawal Plan): Withdrawing a fixed amount regularly from a mutual fund investment.
""", description: "from April 2024 to till Date"),
        ProjectsModel(title: "ABCD  (ABCD Aditya  Birla  Capital  Super App)", subtitle: """
• Designed and implemented intuitive, responsive loan module UIs across iOS, Android, and Web platforms.
• Architected scalable, high-performance applications, ensuring optimal performance and maintainability.
• Led code reviews, enforcing best practices and maintaining code quality standards.
• Integrated frontend interfaces with backend APIs and services for seamless user experiences.
• Managed end-to-end project delivery, from planning through deployment and post-launch support.
• Provided leadership and mentorship to junior developers, fostering technical growth and collaboration.
• Collaborated with cross-functional teams including product managers, designers, and QA to align on deliverables.
• Engaged directly with clients to gather requirements, provide updates, and ensure alignment with business goals.
• Contributed to technical strategy, participating in key decision-making processes related to architecture and technology choices.
""", description: "from Jan 2023 to Jan 2024"),
        ProjectsModel(title: "Qmin", subtitle: """
• Developed and maintained the iOS application using Swift to provide users with a seamless food ordering experience.
• Designed and implemented the user interface based on UI/UX guidelines to ensure a polished and intuitive app experience.
• Integrated Juspay SDK for secure and smooth payment gateway functionality within the app.
• Developed features to support hamper bookings and special orders for events with proper backend integration.
• Optimized app performance to ensure fast load times and smooth user interaction across multiple iOS devices.
• Integrated deep linking so users can access specific menu items and promotions directly from notifications and external links.
• Collaborated with backend developers for API integration to retrieve restaurant data and facilitate order processing.
• Worked closely with cross-functional teams to implement features like push notifications, daily menu updates, and city-based availability.
• Ensured app compatibility and stability across different iOS versions and devices.
• Participated in code reviews to maintain code quality and best practices.
• Debugged and resolved issues promptly and continuously improved the app through iterative updates.
""", description: "Developed the iOS application for Qmin, a premium food delivery platform by the Indian Hotels Company Limited. The app enables users to explore daily curated menus and order gourmet meals from iconic hotel brands like Taj, Vivanta, and Ginger across major Indian cities. It includes features like festive-based menus, hamper bookings, event pre- booking, and secure payment integration using Juspay SDK."),
        ProjectsModel(title: "Tata Neu", subtitle: """
• Developed and maintained core iOS app modules using Swift and SwiftUI, ensuring a smooth and responsive user experience.
• Integrated features across multiple services including e-commerce, travel, food, and finance within a unified architecture.
• Implemented UPI payment functionality and ensured secure handling of financial transactions.
• Built and integrated a loyalty rewards system (NeuCoins) with transactional workflows.
• Used Sanity CMS to manage and dynamically render marketing banners, content sections, and offers.
• Collaborated with cross-functional teams to implement features aligned with product requirements and UX guidelines.
• Integrated deep linking and push notifications to support campaign engagement and improve user retention.
• Worked with API teams to consume RESTful services and handle complex data flows across modules.
• Contributed to app optimization, crash fixes, and version upgrades for improved performance and stability.
• Participated in code reviews, sprint planning, and agile development cycles.
""", description: "Contributed to the development of Tata Neu, a comprehensive iOS application integrating services from brands like bigbasket, 1mg, Tata CLiQ, Croma, and IHCL hotels. The app offers users seamless access to shopping, travel, bill payments, UPI transactions, financial services, and loyalty rewards (NeuCoins). A CMS powered by Sanity was used for content management, enabling dynamic updates across the app."),
    ]
    
}

