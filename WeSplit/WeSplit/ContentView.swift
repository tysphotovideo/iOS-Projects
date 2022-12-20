//
//  ContentView.swift
//  WeSplit
//
//  Created by Tyler Sellers on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var ckAmount = 0.0
    @State private var people = 0
    @State private var tipPer = 20
    @FocusState private var amountFoc: Bool
    let tipPers = [10, 15, 20, 25]
    var totPers: Double{
        let count = Double(people + 2)
        let tipD = Double(tipPer)
        let tip = ckAmount / 100 * tipD
        let total = ckAmount + tip
        let amoPer = total / count
        
        return amoPer
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $ckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountFoc)
                    
                    Picker("Number of people", selection: $people){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }header: {
                    Text("Amount")
                }
                
                Section{
                    Picker("Tip Percentage", selection: $tipPer){
                        ForEach(tipPers, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Tip")
                }
                
                Section{
                    Text(totPers, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }header: {
                    Text("Total/Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountFoc = false
                    }
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
