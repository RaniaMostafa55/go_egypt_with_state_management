# go_egypt_with_state_management

It is a mobile application for tourists visiting Egypt to explore landmarks, museums, and other attractions across different Egyptian governorates
# Sign Up Page
  Widget Used
   - Scaffold
      - body
         - Center to make the content centered
         - SingleChildScrollView to make page scrollable
         - Form to create a form and validate user input
         - TitleText to add title of the page
         - CustomTextField to let user enter his name, email and password
         - IntlPhoneField to let user enter his phone number but it's optional
         - CustomButton to add "Sign up" button
         - AlertDialog to show a success dialog to the user
# Login Page
   Widget Used
  - Scaffold
    - body
       - Center to make the content centered
       - SingleChildScrollView to make page scrollable
       - Form to create a form and validate user input
       - TitleText to add title of the page
       - CustomTextField to let user enter his email and password
       - CustomButton to add "Login" button
# Layout Page
Widget Used
   - Scaffold
      - Bottom Navigation Bar to contain different items like home , governement , favoriate , profile
      - body which show page according to item selected
        
# Home Page
Widget Used
   - Scaffold
        - App Bar which contain text as title & icon for toggle language
        - body
            - SingleChildScrollView to make screen scrollable
            -  Grid view to show list of PlaceWidget which show places(image for place & text under image)
            -  Text to show title (popular places)
            -  other GridView to show list of Card Widget which show card that contain image for place , name of place , governament , favourite icon,
# Government Page
Widget Used
  - scaffold
       - AppBar which has a text called Governments of Egypt
       - body(Stack) that has ListView to show list of GovernmentCardItem
  - GovernmentCardItem(clickable when it click it navigates to GovernementsDetailsView)
      - container that show image when it loading it show CircularProgressIndicator
      - text that show governmentName
 - GovernementDetailsView(Scaffold)
    - appBar to show governmentName LandMrks
    - body(Column)
        - GovernmentBannerItem:Container to show image of government
        - Listview to show landmarks(LandmarkCardItem)
  - LandmarkCardItem :
      - container that show image when it loading it show CircularProgressIndicator
      - text that show LandmarkName       
  # Favorites Page:
  Widget Used
  - Scaffold
    - appBar to add page title
    - body
      - SingleChildScrollView to make page scrollable
      - GridView.builder to add favorite places in a grid manner
      - Card to express each place
      - CachedNetworkImage to add the place image
      - Text to add the place and government name
  
         
# Profile Page
Widget Used
   - Take data from shared preferens to show it
   - Scaffold
      - App Bar which contain text as title(Profile)
      - body (Column)
          - ProfilePicFrame which contains Stack to show items as a layers inside stack Container to show image & IconButton to has icon edit
          - CustomListTile to show ListTile that take title ,subTitle ,trailing , function onpressed when click arrow icon to edit.
          - function showEditDialog to edit  any item contains
              - Alert Dialog to edit any item it has a
                  - Text called edit item ,
                  - content has widget CustomEditingTextField that contain textField
                  -  action it is a list of Widget called CustomTextButtom to show TextButton(confirm , back) and a snakBar if data edit

## State Management

- Bloc: Manage the states and data passing throw screens efficiently with bloc using `bloc_consumer` that easily perform listen to changes and rebuild the widgets together.

## Dependencies

- flutter_bloc: Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern.

## Team Members

- Omar Ameer
- Ahmed Elnahrawy
- Hanan Ashraf
- Rania Mostafa
- Mazen Mounir
- Mohamed Adel