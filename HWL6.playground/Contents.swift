import Cocoa

/*
 1. в заданном массиве строк найти строки начинающиеся с числа. каждое число умножить на 2,
 преобразовать в строку вида "число * 2 = результат" вывести через принт. Сделать в одну строку
 [123 hello, "other", "no name 1111", "custom number", "111", "", "345 and 1112"]
 "".components(separatedBy: .whitespacesAndNewline)
 */

let array = ["123 hello", "other", "no name 1111", "custom number", "111", "", "345 and 1112"]
array
    .map {$0.components(separatedBy: .whitespacesAndNewlines)[0]}
    .compactMap{Int($0)}
    .map{print("\($0) * 2 = \($0 * 2)")}

/*
 2. Составить словарь для цены продуктов в магазине. Ключ - имя продукта, значчение - цены в Double.
 сделать массив из имен продуктов. пройтись по этим продуктам и посчитать суммарную цену
 сформировать и вывести через принт чек с указанием продукта и его цены и колчества
 */

let price = ["milk" : 100, "eggs" : 75, "bread" : 155.5, "cheese" : 1430, "chocolate" : 1070, "ice cream" : 1720]
let order = ["milk", "eggs", "eggs", "milk", "cheese", "ice cream", "bread", "eggs", "qwe"]

let receipt: [String : (Int, Double)] = Dictionary(
    grouping: order, by: {$0})
    .mapValues{($0.count, price[$0.first!] ?? 0)}
// почему дальше не получается продолжить работать через map
receipt.map{print("Продукт: \($0.key), количество \($0.value.0) шт., стоимостью: \($0.value.1), итого: \(Double($0.value.0) * $0.value.1)")}



/*
 3. решето эратосфена.проверка простоты числа.
 */

var n = 30

var sieveOfEratosthenes1 = Array(0...n).map{($0, true)}

sieveOfEratosthenes1
    .map{i in sieveOfEratosthenes1
        if i.0 > 1 && i.1 && i.0 * i.0 <= n {sieveOfEratosthenes1
            .map{if $0.0 % i.0 == 0 && $0.0 > 1 && i.0 != $0.0 {sieveOfEratosthenes1[$0.0].1 = false}}}}
//zip reduce into
print(sieveOfEratosthenes1
    .filter{$0.1 == true && $0.0 > 1}
    .map{$0.0})


//for i in sieveOfEratosthenes1 {
//    if i.0 > 1 && i.1 && i.0 * i.0 <= n {
//        print("i.0 = \(i.0)")
//        for j in sieveOfEratosthenes1 {
//            print("     i.0 = \(i.0)    j.0 = \(j.0)")
//            if j.0 % i.0 == 0 && j.0 > 1 && i.0 != j.0 {
//                print("             \(j.0) = false")
//                sieveOfEratosthenes1[j.0].1 = false
//            }
//        }
//    }
//}


