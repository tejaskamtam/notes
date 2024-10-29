---
title: 05 - Software Design
area: ucla
created: 2024-36-22
course: CS 130
parent: CS 130
layout: note
---
## SOLID Principles
- Single Responsibility Principle
	- a class should have responsibility over only a single part of functionality
- Open-Close Principle
	- entities should be open for extension but closed for modification
- Liskov Substitution Principle
	- subtypes should be substitutable for their supertypes without conflicts
	- this allows subtypes to interface with their supertypes and implement/invoke functionality of their supertype(s)
- Interface Segregation Principle
	- clients/entities/classes should not be forced to depend on interfaces they do not use/require
	- a violation of this principle would require inheriting types to implement the interface they inherit without ever requiring their implementations
- Dependency Inversion Principle
	- high level modules should not depend on low level modules directly
	- instead, modules must interface with modules in other packages via shared interfaces
### Pros and Cons
- pro: design patterns offer common solutions to common problems through common vocabulary
- pro: they reduce system complexity through abstraction and inheritance allowing for better reorganization and refactoring of hierarchies
- pro: allow for flexible and maintainable systems
- con: design patterns have tradeoffs and may be realized differently depending on the codebase and language
- con: directory structure and class naming may reduce readability when adhering to specific design patterns

## Gang of Four Design Patterns
![[Pasted image 20241022224438.png]]
## GoF Creational Patterns
### Factory Method Pattern
The Factory Method design pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created. This pattern is particularly useful when the exact type of the object to be created isn't known until runtime or when the creation process involves complex logic.

#### Concepts

1. **Product**: This is the interface or abstract class that defines the type of object the factory method will create.

2. **Concrete Product**: These are the specific implementations of the Product interface.

3. **Creator**: This is the abstract class or interface that declares the factory method. It may also provide some default implementation.

4. **Concrete Creator**: These are the subclasses of the Creator that implement the factory method to return an instance of a Concrete Product.

#### Structure

- **Product Interface**: Defines the interface for objects created by the factory method.
- **Concrete Products**: Implement the Product interface.
- **Creator Interface**: Declares the factory method.
- **Concrete Creators**: Implement the factory method to return an instance of a Concrete Product.

#### Example

Imagine a scenario where you have different types of vehicles (e.g., Car, Truck). You want to create a factory that can produce these vehicles based on some input.

```python
# Product Interface
class Vehicle:
    def drive(self):
        pass

# Concrete Products
class Car(Vehicle):
    def drive(self):
        return "Driving a car"

class Truck(Vehicle):
    def drive(self):
        return "Driving a truck"

# Creator Interface
class VehicleFactory:
    def create_vehicle(self):
        pass

# Concrete Creators
class CarFactory(VehicleFactory):
    def create_vehicle(self):
        return Car()

class TruckFactory(VehicleFactory):
    def create_vehicle(self):
        return Truck()

# Client Code
def get_vehicle(factory: VehicleFactory):
    vehicle = factory.create_vehicle()
    print(vehicle.drive())

# Usage
car_factory = CarFactory()
get_vehicle(car_factory)  # Output: Driving a car

truck_factory = TruckFactory()
get_vehicle(truck_factory)  # Output: Driving a truck
```

#### Advantages:

- **Encapsulation of Object Creation**: The creation logic is encapsulated in the factory, making it easier to manage and modify.
- **Decoupling**: The client code is decoupled from the concrete classes, allowing for easier maintenance and scalability.
- **Flexibility**: New types of products can be introduced without changing the existing code.
#### Disadvantages:

- **Complexity**: It can introduce additional classes and complexity to the codebase.
- **Overhead**: If not used judiciously, it may lead to unnecessary abstraction.

### Abstract Factory Pattern
The Abstract Factory design pattern is another creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes. It is particularly useful when a system needs to be independent of how its objects are created, composed, and represented.

#### Key Concepts:

1. **Abstract Factory**: This is an interface that declares methods for creating abstract products.

2. **Concrete Factories**: These are implementations of the Abstract Factory that create specific products.

3. **Abstract Products**: These are interfaces or abstract classes that define the types of objects that can be created.

4. **Concrete Products**: These are the specific implementations of the abstract products.

#### Structure:

- **Abstract Factory**: Declares methods for creating abstract products.
- **Concrete Factories**: Implement the abstract factory methods to produce concrete products.
- **Abstract Products**: Define the interfaces for a family of products.
- **Concrete Products**: Implement the abstract product interfaces.

#### Example:

Consider a scenario where you want to create different types of user interfaces for different operating systems (e.g., Windows and macOS). Each operating system has its own set of UI components (buttons, checkboxes, etc.).

```python
# Abstract Products
class Button:
    def paint(self):
        pass

class Checkbox:
    def paint(self):
        pass

# Concrete Products for Windows
class WindowsButton(Button):
    def paint(self):
        return "Rendering a Windows button"

class WindowsCheckbox(Checkbox):
    def paint(self):
        return "Rendering a Windows checkbox"

# Concrete Products for macOS
class MacOSButton(Button):
    def paint(self):
        return "Rendering a macOS button"

class MacOSCheckbox(Checkbox):
    def paint(self):
        return "Rendering a macOS checkbox"

# Abstract Factory
class GUIFactory:
    def create_button(self):
        pass

    def create_checkbox(self):
        pass

# Concrete Factories
class WindowsFactory(GUIFactory):
    def create_button(self):
        return WindowsButton()

    def create_checkbox(self):
        return WindowsCheckbox()

class MacOSFactory(GUIFactory):
    def create_button(self):
        return MacOSButton()

    def create_checkbox(self):
        return MacOSCheckbox()

# Client Code
def client_code(factory: GUIFactory):
    button = factory.create_button()
    checkbox = factory.create_checkbox()
    print(button.paint())
    print(checkbox.paint())

# Usage
windows_factory = WindowsFactory()
client_code(windows_factory)
# Output:
# Rendering a Windows button
# Rendering a Windows checkbox

macos_factory = MacOSFactory()
client_code(macos_factory)
# Output:
# Rendering a macOS button
# Rendering a macOS checkbox
```

####  Differences from Factory Method:

1. **Purpose**:
   - **Factory Method**: Focuses on creating a single product or a family of related products. It allows subclasses to alter the type of objects that will be created.
   - **Abstract Factory**: Focuses on creating families of related or dependent objects. It provides an interface for creating multiple products that are designed to work together.

2. **Structure**:
   - **Factory Method**: Typically involves a single method for creating a product. It can be seen as a single factory for one type of product.
   - **Abstract Factory**: Involves multiple methods for creating different types of products. It can be seen as a factory for multiple related products.

3. **Use Cases**:
   - **Factory Method**: Used when a class cannot anticipate the class of objects it must create or when subclasses need to specify the objects they create.
   - **Abstract Factory**: Used when a system needs to be independent of how its products are created, composed, and represented, especially when dealing with multiple families of products.

#### TLDR:

In summary, while both the Factory Method and Abstract Factory patterns deal with object creation, the Factory Method is focused on creating a single product, whereas the Abstract Factory is concerned with creating families of related products. The Abstract Factory pattern provides a higher level of abstraction and is useful in scenarios where multiple products need to be created that are designed to work together.

### Abstract Factory vs Factory Method
![[Pasted image 20241022225002.png]]

### Singleton Pattern
The Singleton design pattern is a creational pattern that ensures a class has only one instance and provides a global point of access to that instance. This pattern is particularly useful when exactly one object is needed to coordinate actions across the system, such as in cases of configuration management, logging, or managing shared resources.

#### Key Concepts:

1. **Single Instance**: The Singleton pattern restricts the instantiation of a class to a single object. This is typically achieved by making the class constructor private or protected.

2. **Global Access Point**: The Singleton class provides a static method that allows clients to access the instance. This method is responsible for creating the instance if it does not already exist.

3. **Lazy Initialization**: The instance is created only when it is needed, which can help with resource management.

#### Structure:

- **Singleton Class**: Contains a private static variable to hold the single instance and a private constructor to prevent instantiation from outside the class. It provides a public static method to access the instance.

#### Example:

Here’s a simple implementation of the Singleton pattern in Python:

```python
class Singleton:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Singleton, cls).__new__(cls)
            # Initialize any attributes here if needed
        return cls._instance

    def some_business_logic(self):
        # Example method to demonstrate functionality
        return "Doing some business logic"

# Client Code
singleton1 = Singleton()
singleton2 = Singleton()

print(singleton1 is singleton2)  # Output: True, both variables point to the same instance

# Using the singleton instance
print(singleton1.some_business_logic())  # Output: Doing some business logic
```

#### Advantages:

1. **Controlled Access**: The Singleton pattern provides controlled access to the single instance, ensuring that no other instances can be created.

2. **Global Access**: It provides a global point of access to the instance, making it easy to use throughout the application.

3. **Lazy Initialization**: The instance is created only when it is needed, which can help save resources.

#### Disadvantages:

1. **Global State**: Singletons can introduce global state into an application, which can make testing and debugging more difficult.

2. **Concurrency Issues**: In multi-threaded environments, care must be taken to ensure that the Singleton instance is created safely, as multiple threads may attempt to create an instance simultaneously.

3. **Hidden Dependencies**: The use of Singletons can lead to hidden dependencies in the code, making it harder to understand and maintain.

#### Variants:

1. **Thread-Safe Singleton**: In multi-threaded applications, you may need to implement additional mechanisms (like locks) to ensure that the Singleton instance is created safely.

2. **Eager Initialization**: Instead of lazy initialization, the instance can be created at the time of class loading.

3. **Bill Pugh Singleton**: This approach uses a static inner helper class to hold the Singleton instance, which is only loaded when the `getInstance()` method is called.

#### TLDR:

The Singleton pattern is a useful design pattern when you need to ensure that a class has only one instance and provide a global point of access to it. While it offers several advantages, such as controlled access and lazy initialization, it also comes with potential drawbacks, particularly in terms of global state and testing challenges. Careful consideration should be given to its use in software design.

## GoF Structural Patterns
### Adapter Pattern
- implemented to adapt an existing component to a new interface/system ![[Pasted image 20241023181116.png]]
- adapters **extend/implement** the interface/class so, depending on lang, they MUST implement all functionality of the interfaces they extend
#### Java Example
- existing ![[Pasted image 20241023181142.png]]
- adapted ![[Pasted image 20241023181200.png]]
#### Adapter Variant
- multiple inheritance, e.g. multi-interface implementation![[Pasted image 20241023181458.png]]
### Facade Pattern
- given a complex system (complex interrelation of classes and methods), implement a Facade to simplify the interface to the complex system ![[Pasted image 20241023182158.png]]
#### Java example
- facade simplifies multi-class interconnections ![[Pasted image 20241023182230.png]]
#### Facade vs Adapter
- facades associate objects as attributes -> this allows them to not have to implement all functionality of the interface/object/class
- facade focuses on simplification while adapters perform interface "conversion" ![[Pasted image 20241023182354.png]]

### Proxy Pattern
- limits access to an object by requiring interfacing through middleware (a proxy) ![[Pasted image 20241023184243.png]]
- **Virtual proxy** - can be a placeholder for expensive to create objects. The real object is only created when a client first requests/accesses the object.
- **Remote proxy** - provides a local representative for an object that resides in a different address space. This is what "stub" code in remote-procedure-calls (RPC) provides.
- **Protective proxy** - controls access to a sensitive master object. The surrogate object checks that the caller has the access permissions required prior to forwarding the request.
- **Smart proxy** - adds additional actions when an object is accessed. Typical uses include:
	- Counting the number of references to the real object so that it can be freed automatically
	- Checking that the real object is locked before it is accessed to ensure immutability
#### Java Example
- proxy internet to act as a firewall ![[Pasted image 20241023184302.png]]
- proxies **implement/extend** the interface so, depending on the lang, they MUST implement all functionality of the interface
#### Proxy vs Adapter vs Facade
- proxy vs facade - facades don't implement/extend
- proxy vs adapter - proxy and the real subject extend the same interface while in an adapter, the adaptee does not extend the target ![[Pasted image 20241023184644.png]]
- proxies could be implemented as decorators/wrappers

### Composite Pattern
- a hierarchy of classes where higher order classes can **contain** lower order classes (usually tree structure) ![[Pasted image 20241023185141.png]]
- a composite object **must** implement the hierarchy structure as an individual object ![[Pasted image 20241023185205.png]]
	- aside: associations/contains must point to supertypes if the element can be of many types
#### Java Example
- box example as a composite object![[Pasted image 20241023185222.png]]

## GoF Behavioral Patterns

### Strategy Pattern
- problem: class can do task in many ways at many times -> bloated and fragile -> apply strategy pattern to mitigate ![[Pasted image 20241028190956.png]]
- e.g. consider inheritance is not alwayss the best due to overriding many funcs in subclass, instead consider interface extension ![[Pasted image 20241028191034.png]]
#### Java Example
![[Pasted image 20241028191050.png]]
#### Strategy vs Abstract Factory
![[Pasted image 20241028191128.png]]

### Observer Pattern
- problem: need to propagate state changes to all dependent objects ![[Pasted image 20241028191237.png]]
#### Weather Station Example
- core weather service must propagate new data to visual, api, displays ![[Pasted image 20241028191349.png]]
```java
interface Subject {
	public void registerObserver(Observer o);
	public void removeObserver(Observer o);
	public void notifyObservers();
}
interface Observer { public void update(); }
```
![[Pasted image 20241028191451.png]]

### Mediator Pattern
- remove coupling between frequently interactive applications without having to change interactions ![[Pasted image 20241028191610.png]]
- pros:
	- inc reusability of objects supported by Mediator by decoupling
	- simplify maintenance by centralizing
	- minimize diversity of messages sent between interacting services
- cons:
	- mediator itself may become too complex
	- exposes single point of vulnerability and compelxity
#### Dialog as Mediator
![[Pasted image 20241028191804.png]]
![[Pasted image 20241028191816.png]]

#### Mediator vs Observer
- mediator abstracts into one to many comms
	- from possibly many comms endpoints to one mediator sends -> all dependencies
- observer abstracts service into many to many comms
	- from one core service/data endpoint to abstracted dependencies

### Command Pattern
- need to issue requests to objects without knowing the receiver or how request will be handle, e.g., remote control (circuits abstracted to commands on controller) ![[Pasted image 20241028192409.png]]
- possibly complicated by storing state as some functions may need undo/redo, some may not support - can't just implement "execute" for all
- code example for remote control ![[Pasted image 20241028192431.png]]

### State Pattern
- when behavior is dependent on state e.g., gumball machine ![[Pasted image 20241028192547.png]]
- ![[Pasted image 20241028192706.png]]
- ![[Pasted image 20241028192717.png]]
- pros:
	- encapsulates all state behavior into one object
	- avoids state inconsistency
- cons:
	- bulky code -> increases number of objects
	- state interface is brittle, may require propagation to dependencies for new states