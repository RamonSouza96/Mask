# Android EditText Masking Project
![screen-20230925-200454](https://github.com/RamonSouza96/Mask/assets/34917070/c6265291-df08-4c39-b018-603f9c3c0151)

This project is an Android application that enables the application of masks to text input fields (EditTexts). Masks are used to automatically format the text entered by the user according to a predefined pattern, such as formatting a phone number, CPF, CNPJ, date of birth, credit card number, and more.

## Project Details

- **Platform:** Android
- **Developed in:** Embarcadero Delphi FMX 11.2
- **Tested on:** Android devices
- **Dependency:** Skia4Delphi Realise 6

## Key Components

- `TFormMask`: The main class representing the application's form.
- `RectBackground`: A rectangle used as the background of the form.
- `EdtTelefone`, `EdtCPF`, `EdtCNPJ`, `EdtDataNascimento`, `EdtNomeCard`, `EdtNumberCard`, `EdtValidade`: Text input fields (EditTexts) that will receive the masks.
- `SkSvg1`, `SkSvg2`, `SkSvg3`, `SkSvg5`, `SkSvg6`, `SkSvg7`, `SvgCard`: Graphic components to display visual elements related to the masks.
- `StyleBook1`: A style component defining the visual appearance of the controls.

## Functionality

This Delphi application for Android allows for the automatic formatting of text input fields using specific masks for different data types such as CPF, CNPJ, phone number, date of birth, and credit card number. The masks are applied as the user types data into the input fields, making data entry easier and more intuitive.

## Usage of Masks

- **CPF**: The mask for CPF is applied in the format "###.###.###-##," where "#" represents numeric digits.
- **CNPJ**: The mask for CNPJ is applied in the format "##.###.###/####-##," where "#" represents numeric digits.
- **Phone Number**: The mask for phone numbers is applied in the format "(##) #####-####."
- **Date of Birth**: The mask for date of birth is applied in the format "##/##/####."
- **Credit Card Number**: The mask for credit card numbers is applied in the format "#### #### #### ####."
- **Credit Card Expiry Date**: The mask for credit card expiry date is applied in the format "##/##."

## How It Works

When the user types into the input fields, the application checks the type of mask needed based on the context and automatically applies the mask as the text is entered. This ensures that the entered data is always correctly formatted.

## Dependency

This project depends on the Skia4Delphi Realise 6 library to function correctly. Make sure you have this library installed in your development environment.

---

This is a valuable project to enhance the user experience when entering information in an Android application, making data entry easier and preventing formatting errors. Be sure to include the necessary dependency and perform proper testing on Android devices to ensure the project functions smoothly.
