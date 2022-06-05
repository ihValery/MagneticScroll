# MagneticScroll

- "Scroll" с авто центрированием

    - вместо ScrollView создаем HStack и заполняем его карточками

    - Очевидно, что это не тот горизонтальный стек, который мы хотим построить. Мы ожидаем, что каждый вид карты будет занимать всю ширину экрана или чуть меньше. Для этого нам нужно обернуть HStack в GeometryReader, чтобы получить размер экрана

    - Что бы отобразить 3 элемент, нужно всего лишь сдвинуть на ширину карточки умноженную на индекс самой карточки. Не забываем HStack(spacing: 0) лучше добавить padding

    - Добавим жест и следить за ним

.updating($dragOffset) { value, state, transaction in

state = value.translation.width

}, 

    - а по завершению жеста проверка, сдвинули ли мы карточку на величину порога и обновим индекс попутно проверив что не выходим за рамки.

let threshold = widthCard * 0.5

var newIndex = Int(-value.translation.width / threshold) + currentIndex

newIndex = min(max(newIndex, 0), palette.count - 1)

currentIndex = newIndex


