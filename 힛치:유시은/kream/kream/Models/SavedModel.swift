//
//  SavedModel.swift
//  kream
//
//  Created by 유시은 on 10/6/24.
//

import Foundation

struct SavedModel{
    let savedImage: String
    let savedName: String
    let savedDescription: String
    let savedPrice: String
    let isSavedButton: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(savedImage: "saved1.png", savedName: "Matin Kim ", savedDescription: "(W) Matin Kim Matin Crop Hoody Coating Jumper Black", savedPrice: "148,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved2.png", savedName: "Polo Ralph Lauren", savedDescription: "[30%적립] Polo Ralph Lauren Double Knit Sweatshirt Light Sport Heather", savedPrice: "219,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved3.png", savedName: "Max Mara", savedDescription: "(W) S Max Mara Poldo Wool Coat Camel", savedPrice: "1,101,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved4.png", savedName: "Mischief", savedDescription: "Mischief Rhombus Light Weight Cross Bag Black - The Hyundai Seoul Exclusive", savedPrice: "176,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved5.png", savedName: "Saint Laurent", savedDescription: "Saint Laurent Cassandre Matelasse Card Case in Grain De Poudre Embossed Leather Black", savedPrice: "357,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved6.png", savedName: "AMI", savedDescription: "AMI de Coeur Wool Cardigan Black", savedPrice: "306,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved7.png", savedName: "Diesel", savedDescription: "(W) Diesel T-Angie Peekaboo Logo T-Shirt White", savedPrice: "88,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved8.png", savedName: "Acne", savedDescription: "Acne Studios Narrow Wool Fringe Scarf Rose Melange", savedPrice: "239,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved9.png", savedName: "Sony", savedDescription: "Sony WH-1000XM4 Silver (Sony Korea Ver.)", savedPrice: "319,000원", isSavedButton: "savedButton.png"),
        SavedModel(savedImage: "saved10.png", savedName: "Aesop", savedDescription: "Aesop Olous Aromatique Room Spary 100ml (Korean Ver.)", savedPrice: "66,000원", isSavedButton: "savedButton.png"),
    ]
}

import SwiftUI
#Preview
{
    MainSavedViewController()
}
