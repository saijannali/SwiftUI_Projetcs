//
//  SettingsView.swift
//  Crypto
//
//  Created by Sai Jannali on 2/8/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let defaultURL: URL = URL(string: "https://www.google.com")!
    let coingeckoURL: URL = URL(string: "https://coingecko.com")!
    let personalURL: URL = URL(string: "https://saijannali.github.io/Personal_Portfolio/")!
    let linkedInURL: URL = URL(string: "https://www.linkedin.com/in/sai-jannali/")!
    
    
    var body: some View {
        NavigationView {
            List{
                topSection
                coinGeckoSection
                developerSection
            }
            .listStyle(GroupedListStyle())
            .accentColor(.blue)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    xMarkButton
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView{
    private var xMarkButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
    
    private var topSection: some View{
        Section(header: Text("header")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Practicing for Fidelity Interview ")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Personal website 🫥", destination: personalURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("header")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrent data is obtained from CoinGecko free API")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🪙", destination: coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("header")) {
            VStack(alignment: .leading) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Developer: Sai Jannali")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Get in touch!", destination: linkedInURL)
        }
    }
}
