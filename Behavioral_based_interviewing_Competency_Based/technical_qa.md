## 软件工程

**行为面试相关：**

1. How do you keep up to date with your Swift and iOS knowledge?


## What is SOLID
![1](../assets/solid/1.jpg)

![2](../assets/solid/2.jpg)

![3](../assets/solid/3.jpg)
![4](../assets/solid/4.jpg)
![5](../assets/solid/5.jpg)
![6](../assets/solid/6.jpg)
![7](../assets/solid/7.jpg)
![8](../assets/solid/8.jpg)
![9](../assets/solid/9.jpg)
![10](../assets/solid/10.jpg)
![11](../assets/solid/11.jpg)
![12](../assets/solid/12.jpg)
![13](../assets/solid/13.jpg)


 

### S – Single Responsibility Principle (SRP)

**Concept**: A class should have only one reason to exist.

**Application**: Each class in your application should have only one specific job or responsibility. For instance, if you have a `UserHandler` class, its responsibility should be strictly limited to user-related operations, such as creating, updating, or deleting users, and not also include network functionality, for example.

In Swift or SwiftUI, adhering to the SRP means ensuring that each class or module is focused on a single task. This approach simplifies maintenance and reduces the likelihood of errors. For example, you might have:

- **A class for handling network requests**: This class is responsible solely for network communication. It could include methods for sending HTTP requests, handling responses, and managing errors related to networking.
  
  ```swift
  class NetworkManager {
      func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
          // Implementation for network request
      }
  }
  ```

- **A class for parsing data**: This class handles the parsing of raw data into usable objects or structures. It does not concern itself with how the data was obtained.

  ```swift
  class DataParser {
      func parse(data: Data) -> ParsedObject? {
          // Implementation for parsing data
      }
  }
  ```

- **A class for managing the user interface**: This class or module focuses on rendering the UI and handling user interactions.

  ```swift
  struct ContentView: View {
      var body: some View {
          // Implementation for user interface
      }
  }
  ```

By keeping these responsibilities separate, each class or module remains clean, focused, and easy to understand. This separation of concerns aligns with the Single Responsibility Principle and promotes a more modular and maintainable codebase.

**Example in Swift**:

Consider the following Swift classes and their responsibilities:

```swift
class NetworkManager {
    func fetchUserData(completion: @escaping (Data?, Error?) -> Void) {
        // Code to fetch user data from network
    }
}

class UserParser {
    func parseUser(data: Data) -> User? {
        // Code to parse data into User object
    }
}

struct UserView: View {
    var user: User
    
    var body: some View {
        VStack {
            Text(user.name)
            Text(user.email)
        }
    }
}
```

In this example:
- `NetworkManager` is responsible only for fetching data from the network.
- `UserParser` is responsible only for parsing that data into a `User` object.
- `UserView` is responsible only for displaying the user information in the UI.

Following SRP, these classes and structs are easier to test, debug, and maintain because each has a single responsibility.

In summary, the Single Responsibility Principle encourages developers to create classes and modules that focus on one particular task or responsibility, leading to a more organized and manageable code structure.
 

### STAR answer format
STAR stands for: 

* Situation – What was the situation you / your previous employer faced?
* Task – What tasks were involved in that situation?
* Action – What actions did you take?
* Results – What were the results of those actions?



### Agile Development
#### 1. Describe the project workflow in your previous career.
#### 2. Describe how to use data to drive development.
#### 3. How do you assure the code quality?
https://github.com/wheelo/Reducing-WTFs-Per-Minute
 
#### 4. How did you review code in your previous company?
https://www.morling.dev/blog/the-code-review-pyramid/

https://google.github.io/eng-practices/review/reviewer/

#### 5. If you get an emergency task now, how do you deal with it?

#### 6. State some of the Agile quality strategies.

#### 7. Do you know about Agile Manifesto & Principles? Explain in brief.

#### 8. Is there any drawback of the Agile model? If yes, explain.

#### 9. What is the use of burn-up and burn-down charts?

#### 10. Define Zero Sprint and Spike in Agile.

### Scrum Development

![SCRUM_PROCESS](../assets/SCRUM_PROCESS.jpg)



#### 1. What is the duration of a scrum sprint?

#### 2. What is Velocity?

#### 3. What do you know about impediments in Scrum? Give some examples of impediments.

#### 4. What is the difference and similarity between Agile and Scrum?

#### 5. What is the increment? Explain.

#### 6. What is the "build-breaker"?

#### 7. What do you understand by Daily Stand-Up?

#### 8. What do you about Scrum ban?


### Working Method

#### 1. How do you work with pair programming?

![pair_programming_process_softwarequal-pair_programming_styles-f](../assets/pair_programming.jpg)

![pair_programming_process_softwarequal-pair_programming_styles-f](../assets/pair_programming_process_softwarequal-pair_programming_styles-f.png)
![pair_programming_process_driver-navigator-diagram](../assets/pair_programming_process_driver-navigator-diagram.png)

ping pong mode: one writes test code, and the other one implements. 
https://www.codecademy.com/article/tdd-red-green-refactor

https://medium.com/@tunkhine126/red-green-refactor-42b5b643b506



### Questions for the interviewer
#### 1. How many percent of the automated test cover your project?
#### 2. How often is the review period?
