//
//  GlobalPicker.swift
//  Demo
//
//  Created by Gesen on 16/3/1.
//  Copyright © 2016年 Gesen. All rights reserved.
//
import Foundation
import SwiftTheme

public enum GlobalPicker {
    public static let backgroundColor: ThemeColorPicker = ["#fff", "#fff", "#fff", "#292b38"]
    public static let textColor: ThemeColorPicker = ["#000", "#000", "#000", "#ECF0F1"]
    public static let barTextColors = ["#FFF", "#000", "#FFF", "#FFF"]
    public static let barTextColor = ThemeColorPicker.pickerWithColors(barTextColors)
    public static let barTintColor: ThemeColorPicker = ["#EB4F38", "#F4C600", "#56ABE4", "#01040D"]
}
