//
//  PDFReader.swift
//  ManiApp
//
//  Created by neumacbcp on 06/03/26.
//



import SwiftUI
import PDFKit

struct PDFViewer: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> PDFKit.PDFView {
        let pdfView = PDFKit.PDFView()
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFKit.PDFView, context: Context) {
        uiView.document = PDFDocument(url: url)
    }
}
