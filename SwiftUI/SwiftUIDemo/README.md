## iOS Programming Challenge: Interactive Post Viewer

Source Code: [SwiftUI Demo]( https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/SwiftUI/SwiftUIDemo "") 

**Description:**

Your task is to create a native iOS application using Swift, SwiftUI, UIKit, WebKit, and Combine. The application should provide an interactive interface for browsing and viewing posts, comments, and associated user details from a JSONPlaceholder API.

**Requirements:**

1. Use the REST API available at `https://jsonplaceholder.typicode.com`. The API contains a `/posts`, `/comments`, and `/users` endpoints that return a list of posts, comments, and user information, respectively.

2. The application should display the list of posts on the initial screen. Each item on the list should display the post's title and a snippet of the body.

3. When a post is selected from the list, navigate to a detail screen. This screen should display the post's full body, fetch and display the associated comments from the `/comments` endpoint using the post's id. Display each comment's name, email, and body.

4. On the post detail screen, fetch the user's information from the `/users` endpoint using the post's `userId`. The user data can be fetched using the API pattern: `https://jsonplaceholder.typicode.com/users?id={userId}`. Display user's name, email, a MapKit view showing the user's location based on the `address.geo` data, and a WebView/WebKit view displaying the user's website.

5. Implement local data storage using Core Data or Realm to cache the fetched data for offline use.

6. Add an option for the user to mark a post as a favorite. The favorited posts should be stored locally using Core Data or Realm and should be easily distinguishable in the posts list.

7. Use Combine for data binding and data observing in your app.

8. Include unit tests to ensure the critical aspects of your application are working as expected.

**Bonus Points:**

1. Add a search functionality to the posts list that allows users to search for posts by title.

2. Implement pull-to-refresh functionality on the posts list screen to refresh the data.

3. Ensure the application works well on different devices and screen sizes, including iPads.

4. Use SwiftUI’s new async/await features to manage the API calls.

**Evaluation:**

You will be evaluated based on:

1. Code quality, architecture, and organization.
2. Correct and efficient use of Swift, SwiftUI, UIKit, MapKit, WebKit, Combine, and other iOS frameworks.
3. Implementation of the requirements and bonus points.
4. Handling of edge cases and application stability.
5. UI/UX design and responsiveness.
6. Adequate and meaningful unit tests.

Please submit your code as a Git repository (GitHub, BitBucket, GitLab, etc.), ensuring that your repository includes all your source code and any instructions needed to build and run your application.



### Nice to have:  

Search functionality on the posts list and comments list.  


## Result from Yilong Chen 
![https://github.com/ChenYilong](preview.gif)