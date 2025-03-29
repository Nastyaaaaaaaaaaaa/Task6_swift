struct IOSCollection<T> {
    private class Storage {
        var elements: [T]
        
        init(elements: [T]) {
            self.elements = elements
        }
    }
    
    private var storage: Storage
    private var uniqueStorage: Bool = false
    
    init(elements: [T]) {
        storage = Storage(elements: elements)
    }
    
    mutating func append(_ element: T) {
        if !isKnownUniquelyReferenced(&storage) {
            storage = Storage(elements: storage.elements)
            uniqueStorage = true
        }
        storage.elements.append(element)
    }
    
    var count: Int {
        storage.elements.count
    }
}
protocol Hotel {
    var roomCount: Int { get }
    init(roomCount: Int)
}

class HotelAlfa: Hotel {
    var roomCount: Int
    
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}
protocol GameDice {
    var numberDice: String { get }
}

extension Int: GameDice {
    var numberDice: String {
        "Выпало \(self) на кубике"
    }
}

let diceCoub = 3
print(diceCoub.numberDice) // "Выпало 3 на кубике"
protocol CustomProtocol {
    var mandatoryProperty: String { get }
    func mandatoryMethod()
    
    var optionalProperty: String? { get }
}

extension CustomProtocol {
    var optionalProperty: String? { nil }
}

class MyClass: CustomProtocol {
    var mandatoryProperty: String = "Value"
    
    func mandatoryMethod() {
        print("Mandatory method called")
    }
}