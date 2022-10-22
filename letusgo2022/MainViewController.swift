//
//  let us: Go! 2022, fall
//  MainViewController.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

import UIKit
import Combine

final class MainViewController: UIViewController {

    private var x: Double {
        get {
            let strX = inputXTextField.text ?? ""
            return Double(strX) ?? 0.0
        }
    }
    
    enum ArithmeticType: String, CaseIterable {
        case tan2x, cos2x, sin2x, sinx, square
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "calculator"
        setupButtons()
    }
    
    private func calculate(type: ArithmeticType) {
        inputXTextField.resignFirstResponder()
        resultLabel.text = "계산 중..."
        
        Task {
            let result: Double
            
            switch type {
            case .tan2x:
                result = try await tangent2(x)
            case .cos2x:
                result = try await cosine2(x)
            case .sin2x:
                result = try await sine2(x)
            case .sinx:
                result = try await sine(x)
            case .square:
                result = try await square(x)
            }
            await MainActor.run {
                resultLabel.text = String(result)
            }
        }
    }
    
    // MARK: - setup UI
    
    @IBOutlet weak private var inputXTextField: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var buttonStackView: UIStackView!
    @IBAction func resetTextField(_ sender: Any) {
        inputXTextField.text = ""
        inputXTextField.becomeFirstResponder()
    }
    
    private func setupButtons() {
        buttonStackView.spacing = 10
        buttonStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        ArithmeticType.allCases.forEach {
            let button = makeButton(type: $0)
            buttonStackView.addArrangedSubview(button)
        }
    }
    
    private func makeButton(type: ArithmeticType) -> UIButton {
        let button = MyButton()
        button.setTitle(type.rawValue, for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.calculate(type: type)
        }), for: .touchUpInside)
        return button
    }
    
}


// MARK: - Cosine
private extension MainViewController {
    func cosine(_ x: Double) async throws -> Double {
        print("아주 복잡한 cosine 함수 계산 중")
        try await Task.sleep(nanoseconds: .oneSecond)
        let cos = String(format: "%.5f", Darwin.cos(x))
        return Double(cos) ?? 0.0
    }
    
    func cosine2(_ x: Double) async throws -> Double {
        try await Task.sleep(nanoseconds: .oneSecond)
        let sine = try await sine(x)
        let squaredSine = try await square(sine)
        return 1 - 2 * squaredSine
    }
}

// MARK: - Sine
private extension MainViewController {
    func sine(_ x: Double) async throws -> Double {
        print("아주 복잡한 sine 함수 계산 중")
        try await Task.sleep(nanoseconds: .oneSecond)
        let sin = String(format: "%.5f", Darwin.sin(x))
        return Double(sin) ?? 0.0
    }
    
    func sine2(_ x: Double) async throws -> Double {
        let sine = try await sine(x)
        let cosine = try await cosine(x)
        return 2 * sine * cosine
    }
}

// MARK: - Tangent
private extension MainViewController {
    func tangent(_ x: Double) async throws -> Double {
        let cosine = try await cosine(x)
        let sine = try await sine(x)
        return sine / cosine
    }
    
    func tangent2(_ x: Double) async throws -> Double {
        let tangent = try await tangent(x)
        let squaredTangent = try await square(tangent)
        return (2 * tangent) / (1 - squaredTangent)
    }
}

// MARK: - Arithmetic
private extension MainViewController {
    func square(_ x: Double) async throws -> Double {
        print("아주 복잡한 square 함수 계산 중")
        try await Task.sleep(nanoseconds: .oneSecond)
        let squared = String(format: "%.5f", x*x)
        return Double(squared) ?? 0.0
    }
}


extension UInt64 {
    static let oneSecond: UInt64 = 1_000_000_000
}
