# String Comparison Program in EMU8086

## Author

**Robin Vail U. Bacosa**  
**Course & Section:** BSIT-3-B3

## 📌 Description

This EMU8086 assembly program compares two strings entered by the user and determines if they are identical. The user can select between case-sensitive and case-insensitive comparison.

## ⚙️ Features

✅ Accepts two user-inputted strings  
✅ Asks if the comparison should be case-sensitive  
✅ Displays `1` if the strings match and `0` if they don’t  
✅ Works in EMU8086

## 🛠 How to Use

1. Run the program in **EMU8086**.
2. Enter the **first string** when prompted.
3. Enter the **second string** when prompted.
4. Choose **Y** (Yes) for case-sensitive or **N** (No) for case-insensitive comparison.
5. The program will output **1** (if the strings match) or **0** (if they don't).

## 💾 Code Overview

- Uses **INT 21H** for input and output.
- Compares characters one by one.
- Converts to lowercase if case-insensitive mode is selected.
- Prints the result based on the comparison.
