//
//  PickerView.swift
//  test
//
//  Created by bina dev on 24/12/2023.
//

import SwiftUI
public enum GenderOption: String, Codable, CaseIterable{
    case men, women
}

struct PickerView: View {
    @State private var genderSelection: GenderOption = .men
    @State private var countries: [Country] = []
    @State var country = ""
    var body: some View {
        NavigationStack{
            Form{
                Picker("", selection: $genderSelection) {
                    ForEach(GenderOption.allCases, id: \.self) {gender in
                        Text(LocalizedStringKey(gender.rawValue))
                    }
                }
                        .pickerStyle(.segmented)
                        .frame(maxWidth: .infinity)
                Picker("Enter living country", selection: $country) {
                    ForEach(countries,id:\.self) {index in
                        Text(index.name).tag(index.name)
                    }
                }.pickerStyle(MenuPickerStyle())
                Picker("Enter living country", selection: $country) {
                    ForEach(countries.indices) {index in
                        Text(countries[index].name).tag(countries[index].name)
                    }
                }.pickerStyle(.navigationLink)
            }.onAppear{
                countries = loadCountriesFromJSON()
            }
        }
        
    }
    func loadCountriesFromJSON()->[Country] {
        if let fileURL = Bundle.main.url(forResource: "Countries", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decodedCountries = try JSONDecoder().decode([Country].self, from: data)
                return decodedCountries
            } catch {
                print("Error loading countries data: \(error.localizedDescription)")
            }
        }
        return [Country]()
    }
}
struct Country: Decodable,Hashable {
    let name: String
}
#Preview {
    PickerView()
}
