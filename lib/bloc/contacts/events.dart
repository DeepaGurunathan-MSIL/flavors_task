
class ContactsEvents {}
class FetchContactsEvents extends ContactsEvents{
  FetchContactsEvents();
}

// Themes
class ThemeEvent {
}

class SetDarkTheme extends ThemeEvent{
  SetDarkTheme();
}

class SetLightTheme extends ThemeEvent{
  SetLightTheme();
}