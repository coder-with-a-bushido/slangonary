# Slanganory

A Flutter app for searching slang definitions from the Urban Dictionary.

## Architecture
* The dictionary definition calls are handled through repositories, so that the source can easily be swapped.
* The UI mainly uses CustomScrollView and other uncommon widgets like Slivers to achieve the customization.
* Pub package [action_process_text](https://pub.dev/packages/action_process_text) has been used for achieving ACTION_PROCESS_TEXT intent on android platform.
* Bloc has been used for the state management.
## Demo 
<img src="https://imgur.com/1VO93Lv.gif" height=444 width=250>
