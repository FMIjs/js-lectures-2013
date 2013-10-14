# Initial

    #reveal.js идва като submodule на git, за да не си разнасяме ненужни файлове с репото
    git submodule init
    git submodule update

# Компилиране

coffee и node трябва да са достъпни в пътя(повече инфо за Джам в скоро време)

В папката, в която е clone-нато репото:

    ./compile.coffee

или

    coffee compile.coffee

# Template синтаксис
Шаблоните се пишат съгласно [указанията на reveal.js](https://github.com/hakimel/reveal.js#markup).

## Добавки към reveal.js синтаксиса
Текст ограден в `<spand data-notes></span>` таг се премахва при компилирането на сладйовете.

Създава се `lecures/`, в която са компилираните слайдове.
reveal.js папката би трябвало да се symlink-не в lectures, за да се вижда в html-ите със слайдовете. Ако не се е случило link-ваш на ръка(yes, it's buggy)
