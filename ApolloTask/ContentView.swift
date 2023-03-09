//
//  ContentView.swift
//  ApolloTask
//
//  Created by Binal Ahiya on 2023-03-06.
//

import SwiftUI
import CoreBluetooth
import Combine

struct ContentView: View {
    @StateObject var viewModel = BluetoothScannerViewModel()
    @State private var peripheralArray: [CBPeripheral] = []
    @State private var isLoading = false

    @ViewBuilder
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                VStack {
                    ZStack { HeaderView(showLoader: $isLoading) }
                    Text(Constants.search)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(isLoading ? .white : .clear)
                }
                .onAppear(){
                    self.isLoading = true
                }
                .frame(width: 200, height: 200)
                VStack {
                    BluetoothDeviceInfo(peripheralList: peripheralArray, viewModel: viewModel, showLoader: $isLoading)
                }
            }
            .onAppear {
                loadPerpherals()
            }
            .onDisappear {
                viewModel.stopScan()
                viewModel.bag.removeAll()
            }
        }
    }
    func loadPerpherals() {
        viewModel.getPeripheralPublisher()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("")
                    case .failure(let error):
                        print(error)
                    }
                }, receiveValue: { peripherals in
                    self.peripheralArray = peripherals
                }
            )
            .store(in: &viewModel.bag)
        viewModel.startScan()
    }
}
