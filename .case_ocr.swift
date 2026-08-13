import Foundation
import PDFKit
import Vision
import AppKit
import ImageIO

guard CommandLine.arguments.count == 3 else { exit(2) }
let input = URL(fileURLWithPath: CommandLine.arguments[1])
let output = URL(fileURLWithPath: CommandLine.arguments[2])
guard let document = PDFDocument(url: input) else { exit(1) }
var pages: [String] = []

for pageIndex in 0..<document.pageCount {
    guard let page = document.page(at: pageIndex) else { continue }
    let bounds = page.bounds(for: .mediaBox)
    let scale: CGFloat = 3.0
    let thumbnail = page.thumbnail(
        of: NSSize(width: bounds.width * scale, height: bounds.height * scale),
        for: .mediaBox
    )
    guard let image = thumbnail.cgImage(forProposedRect: nil, context: nil, hints: nil) else { continue }
    let request = VNRecognizeTextRequest()
    request.recognitionLevel = .accurate
    request.recognitionLanguages = ["ja-JP"]
    request.usesLanguageCorrection = true
    let orientation: CGImagePropertyOrientation = bounds.width > bounds.height ? .right : .up
    try VNImageRequestHandler(cgImage: image, orientation: orientation).perform([request])
    let observations = (request.results ?? []).sorted {
        if abs($0.boundingBox.midY - $1.boundingBox.midY) > 0.01 {
            return $0.boundingBox.midY > $1.boundingBox.midY
        }
        return $0.boundingBox.minX < $1.boundingBox.minX
    }
    let lines = observations.compactMap { $0.topCandidates(1).first?.string }
    pages.append(lines.joined(separator: "\n"))
}
try pages.joined(separator: "\n---\n").write(to: output, atomically: true, encoding: .utf8)
