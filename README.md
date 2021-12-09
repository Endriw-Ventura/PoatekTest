# poatek_test

A project for the Poatek Test

## Getting Started

poatektest This is a ReadMe file for usage of this program:

Step 1 - Clone the repository, and build it on Android Studio or any android emulator flutter compatible and have an Android Emulator.

Step 2 - Select one of the three tests.

Step 3 - Test One - Lists => pretty self explanatory, the only thing to look out for is that you have to submit 10 times, the rest will be automatic, it will calculate the average height of all studants and return the number that are over the age of 13 and under average. All data are required, name is a string, the age only accept 2 digits of int unsing regex and the height is a 3 digits, also with regex, on the result page (after 10 submits) the page will return the number (all tested) (Could be API oriented but i wanted to make it interactive).

step 4 - Test Two - Functions => also self explanatory, simply type a string with or without numbers and will be reversed in the middle.

Step 5 - Test Three - Classes => thats the hard part to explain, because its kinda clunky, there are somethings i couldnt do mostly for the lack of time (i work presencially far away from home), but what is needed to work is is substeps:

         Substep 1 => click on the dropdown to select your desired pump, that has individual values and quantities.
  
         Substep 2 => type a value, a double with max 5 digits and a dot (can be any value).
  
         Substep 3 => click on "Fill with price" or "Fill with liters" to have the respective return (liters returns amout to pay and price returns the amount of fuel).
  
         Substep 4 => click on "Change Price" and you need to selected the dropdown, even if it comes with the selected on the first value, for some reason i couldnt make it select the first out of the "onChanged" event, after that type the new value of price you want (be gentle to drivers) and click "Submit"
  
         Substep 5 => when you click "Submit" it will take you back to the previous page, to see the changes in prices, you need to change the dropdown value again (setState problems).
  
         Substep 6 => you are free to go now.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
