//
//  let us: Go! 2022, fall
//  MainViewController.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

import UIKit

final class MainViewController: UIViewController {

    private var x: Double {
        get {
            let strX = inputXTextField.text ?? ""
            return Double(strX) ?? 0.0
        }
    }
    
    enum ArithmeticType: String, CaseIterable {
        case tanx, cosx, sinx
        case 미분, 적분, 여러복잡한계산
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "렛어스고 공학계산기"
        setupButtons()
    }
    
    private func calculate(type: ArithmeticType) {
        inputXTextField.resignFirstResponder()
        resultLabel.text = "계산 중..."
        
        Task {
            let result: Double
            switch type {
            case .tanx:
                result = try await tangent(x)
            case .cosx:
                result = try await cosine(x)
            case .sinx:
                result = try await sine(x)
            default:
                result = 0.0
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
}

// MARK: - Sine
private extension MainViewController {
    func sine(_ x: Double) async throws -> Double {
        print("아주 복잡한 sine 함수 계산 중")
        try await Task.sleep(nanoseconds: .oneSecond)
        let sin = String(format: "%.5f", Darwin.sin(x))
        return Double(sin) ?? 0.0
    }
}

// MARK: - Tangent
private extension MainViewController {
    func tangent(_ x: Double) async throws -> Double {
        let cosine = try await cosine(x)
        let sine = try await sine(x)
        return sine / cosine
    }
}

extension UInt64 {
    static let oneSecond: UInt64 = 1_000_000_000
}
