//
//  BluetoothScannerViews.swift
//  ApolloTask
//
//  Created by Binal Ahiya on 2023-03-08.
//

import SwiftUI
import CoreBluetooth

struct HeaderView: View {
    @Binding var showLoader: Bool
    var body: some View {
        SpinnerCircle(isLoading: showLoader, start: 0, end: 0.7, size: 60)
        Image(ImageAsset.bluetooth)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
    }
}
struct BluetoothDeviceInfo : View {
    var peripheralList : [CBPeripheral]
    var viewModel: BluetoothScannerViewModel
    @Binding var showLoader: Bool
    
    var body: some View {
        Text(Constants.deviceInstruction)
            .foregroundColor(.white)
            .font(.system(size: 15))
            .frame(alignment: .leading)
        if peripheralList.count == 0 && showLoader {
            Text(Constants.deviceAvailability)
                .foregroundColor(.white)
                .font(.system(size: 30))
                .padding(.top , 50)
                .frame(alignment: .leading)
        }
        else {
            Text(Constants.scootersFound)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 20)
        }
        List() {
            Group {
                ForEach(peripheralList, id: \.self) { peripheral in
                    DeviceCell(peripheral: peripheral)
                }
                if peripheralList.isEmpty {
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .padding(.bottom ,20)
        
        Button {
            withAnimation { showLoader = false }
            viewModel.stopScan()
        } label: {
            Text(Constants.stopSearch)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct DeviceCell: View {
    var peripheral: CBPeripheral
    var body: some View {
        HStack {
            Image(ImageAsset.bluetoothIcon)
                .frame(width: 10, height: 10)
            Text(peripheral.name ?? Constants.unknownDevice)
                .foregroundColor(.white)
            Spacer()
            Button(action: { })
            {
                Image(systemName: Constants.fontForArrow)
                    .foregroundColor(.white)
                    .font(.body)
            }
        }
        .listRowBackground(Color.black)
        .padding(.leading, 5)
    }
}
struct SpinnerCircle: View {
    var isLoading: Bool
    var start : CGFloat
    var end: CGFloat
    var size: CGFloat
    let animationOn = Animation.linear(duration: 1).repeatForever(autoreverses: false)
    let animationOff = Animation.linear(duration: 0).repeatForever(autoreverses: false)

    var body: some View {
        Circle()
            .trim(from: start, to: end)
            .stroke(isLoading ? Color.blue : .clear , lineWidth: 2)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(isLoading ? animationOn: animationOff)
    }
}


