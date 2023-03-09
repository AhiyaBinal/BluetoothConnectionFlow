//
//  BluetoothScannerViewModel.swift
//  ApolloTask
//
//  Created by Binal Ahiya on 2023-03-06.
//

import Foundation
import CoreBluetooth
import Combine

class BluetoothScannerViewModel: NSObject,ObservableObject,CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    private var peripheralArray: [CBPeripheral] = []
    private var peripheralPublisher = PassthroughSubject<[CBPeripheral], Never>()
    var bag = Set<AnyCancellable>()

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScan() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopScan() {
        centralManager.stopScan()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScan()
        } else {
            print("Bluetooth not available.")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if !peripheralArray.contains(peripheral) {
            peripheralArray.append(peripheral)
            peripheralPublisher.send(peripheralArray)
        }
    }
    
    func getPeripheralPublisher() -> AnyPublisher<[CBPeripheral], Never> {
        return peripheralPublisher.eraseToAnyPublisher()
    }
    
}
