//
//  NutritionRow.swift
//  DemoAppClip
//
//  Created by Arjun on 02/01/24.
//

import SwiftUI

public struct NutritionRow: View {
    public var nutrition: Nutrition

    public init(nutrition: Nutrition) {
        self.nutrition = nutrition
    }

    var nutritionValue: String {
        nutrition.measurement.localizedSummary(
            unitStyle: .short,
            unitOptions: .providedUnit
        )
    }

    public var body: some View {
        HStack {
            Text(nutrition.name)
                .fontWeight(.medium)
            Spacer()
            Text(nutritionValue)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
        .font(.footnote)
    }
}

struct NutritionRow_Previews: PreviewProvider {
    static var previews: some View {
        let nutrition = Nutrition(
            id: "iron",
            name: "Iron",
            measurement: Measurement(
                value: 25,
                unit: UnitMass.milligrams
            )
        )
        return NutritionRow(nutrition: nutrition)
            .frame(maxWidth: 300)
    }
}
