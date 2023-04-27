# Currency Converter

An easy-to-use program called Currency Converter enables users to convert currencies. The user enters the amount he or she want to sell or receive, selects the proper currency and the app displays the results. If he/she still desires to convert, use the submit button, and the conversion will take happen.  The first five exchanges of currencies are free, but after that, conversions fee is  0.7% of the currency that is exchanged.  According to a response from a web service, the total value of the first currency is reduced while the balance of second is increased.

## Demo


https://user-images.githubusercontent.com/48618128/234959725-16ce3161-7173-4a92-8961-7dbfe184d42f.mov




## Technical Details
The design pattern **MVP** was picked due to the app's simplicity. There are no storyboards used, instead, the UI is built programmatically using UIView's extension for **NSLAyoutConstraints**. Custom views developed as independent components are stored in the Views folder. In order to ensure similarity, these elements are applied throughout the entire application. 

A class called **NetworkClient** is in charge of making requests using URLSession. A **NetworkRequest** struct is used to pass all of the URLRequest's needed parameters. There is currently only one **ConverterUseCase** that converts  data using endpoint: http://api.evp.lt. 

I chose **UserDefaults** as a persistent layer because this app mainly serves demo purposes. Each currency and the number of remaining free conversions are synced properties.
