### Projekt na egzamin: Flatmate Helper

1. Zespół _DAMKA_

  * Dariusz Buszman
  * Klaudia Pałkowska
  * Aneta Stypa
  * Marta Walczak

1. Opis projektu

  Aplikacja Flatmate Helper jest przeznaczona dla współlokatorów. Jej głównym celem jest ułatwienie im zarządzanie mieszkaniem, w tym dzielenie się obowiązkami oraz wymianę informacji o opłatach czy innych sprawunkach.

  Użytkownik, po rejestracji do aplikacji, jest proszony o zapisanie mieszkania - podanie jego adresu oraz opłat. Zostaje on administratorem danego mieszkania. Jako jedyny może on edytować informacje o mieszkaniu oraz dodawać nowych lokatorów do mieszkania. W jego uprawnieniach leży również przydzielanie opłat, zaznaczanie, kto zapłacił swoją część oraz usuwanie lokatorów.

  Każdy lokator mieszkania może zmieniać swoje dane oraz usunąć swoje konto. Może on również zarządzać swoimi zadaniami.

  Na stronie głównej aplikacji jest wyświetlona lista obowiązków lokatorów na tygodniowym grafiku oraz notatki napisane przez lokatorów danego mieszkania.
  
  Aplikacja posiada również stronę z mapą, na której jest zaznaczona lokalizacja mieszkania zalogowanego użytkownika. 

1. Podział pracy

  - Dariusz Buszman
    - pomysł na aplikację
    - dodanie mapy z lokalizacją mieszkania
    - stworzenie statycznej strony 'O aplikacji'
    - wdrożenie aplikacji na heroku

  - Klaudia Pałkowska
    - utworzenie szkieletu aplikacji
    - wygenerowanie wszystkich modeli
    - dodanie rejestracji oraz logowania użytkowników
    - wprowadzenie dodawania mieszkania

  - Aneta Stypa
    - stworzenie operacji dodawania, edytowania, usuwania użytkownika oraz widoki do tych operacji
    - przypisywanie lokatora do mieszkania
    - rozróżnienie zadań administratora i nowego użytkownika
    - dodanie gemu polish - tłumaczy automatycznie domyślne komunikaty błędów i walidacji na język polski

  - Marta Walczak
    - stworzenie strony głównej mieszkania z grafikiem obowiązków oraz notatkami
    - dodanie edycji mieszkania
    - wprowadzenie obliczania opłat
    - testowanie manualne działania aplikacji


1. Informacje 

Wersja Ruby|Wersja Rails|Baza danych|
|---|---|---|
|2.3.0p0|5.0.0.rc1|PostgreSQL|
