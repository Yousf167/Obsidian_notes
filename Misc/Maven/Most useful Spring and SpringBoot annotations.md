Spring Framework provides a wide range of annotations to simplify application development by reducing boilerplate code and making the framework more declarative. Below are the **most useful Spring annotations** organized by category:

---
# Spring
### **Core Annotations**

1. **`@Configuration`**
    
    - Marks a class as a source of bean definitions.
    - Replaces XML-based configuration.
    
    ```java
    @Configuration
    public class AppConfig {
        @Bean
        public MyService myService() {
            return new MyServiceImpl();
        }
    }
    ```
    
2. **`@Bean`**
    
    - Declares a method that produces a bean to be managed by the Spring container.
    - Used inside a class annotated with `@Configuration`.

---

### **Dependency Injection Annotations**

3. **`@Autowired`**
    
    - Injects a bean automatically by type.
    - Can be applied to fields, constructors, or setter methods.
    
    ```java
    @Autowired
    private MyService myService;
    ```
    
4. **`@Qualifier`**
    
    - Specifies which bean to inject when multiple beans of the same type exist.
    - Used alongside `@Autowired`.
    
    ```java
    @Autowired
    @Qualifier("specificBean")
    private MyService myService;
    ```
    
5. **`@Value`**
    
    - Injects values into fields from property files or environment variables.
    
    ```java
    @Value("${app.name}")
    private String appName;
    ```
    

---

### **Stereotype Annotations** (For Spring-managed components)

6. **`@Component`**
    
    - Marks a class as a Spring-managed component.
    - It is a general-purpose stereotype annotation.
    
    ```java
    @Component
    public class MyComponent {
    }
    ```
    
7. **`@Service`**
    
    - A specialization of `@Component` used to annotate service-layer classes.
    - Makes the purpose of the class clearer.
8. **`@Repository`**
    
    - Another specialization of `@Component`, used for the DAO (Data Access Object) layer.
    - Helps with exception translation (converts database exceptions to Spring's `DataAccessException`).
9. **`@Controller`**
    
    - Specialization of `@Component` for web controllers in a Spring MVC application.
    - Used in combination with `@RequestMapping`.
10. **`@RestController`**
    
    - Combines `@Controller` and `@ResponseBody`.
    - Every method in the class directly returns a response body (e.g., JSON, XML).
    
    ```java
    @RestController
    @RequestMapping("/api")
    public class MyRestController {
        @GetMapping("/hello")
        public String hello() {
            return "Hello, World!";
        }
    }
    ```
    

---

### **Spring MVC Annotations**

11. **`@RequestMapping`**
    
    - Maps HTTP requests to specific methods or controllers.
    - Can be used at the class or method level.
    
    ```java
    @RequestMapping("/home")
    public String home() {
        return "home";
    }
    ```
    
12. **`@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`**
    
    - Simplified versions of `@RequestMapping` for specific HTTP methods.
    
    ```java
    @GetMapping("/users")
    public List<User> getUsers() {
        return userService.getAllUsers();
    }
    ```
    
13. **`@PathVariable`**
    
    - Binds a URI template variable to a method parameter.
    
    ```java
    @GetMapping("/user/{id}")
    public User getUser(@PathVariable int id) {
        return userService.getUserById(id);
    }
    ```
    
14. **`@RequestParam`**
    
    - Extracts query parameters from the request.
    
    ```java
    @GetMapping("/search")
    public String search(@RequestParam String keyword) {
        return "Searching for " + keyword;
    }
    ```
    
15. **`@RequestBody`**
    
    - Maps the body of a request to a method parameter.
    - Typically used for JSON or XML payloads.
    
    ```java
    @PostMapping("/addUser")
    public void addUser(@RequestBody User user) {
        userService.save(user);
    }
    ```
    
16. **`@ResponseBody`**
    
    - Converts the return value of a method into the HTTP response body (e.g., JSON, XML).
    - Often used in REST APIs.

---

### **Spring Boot-Specific Annotations**

17. **`@SpringBootApplication`**
    
    - Combines `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.
    - Used to mark the main class of a Spring Boot application.
    
    ```java
    @SpringBootApplication
    public class Application {
        public static void main(String[] args) {
            SpringApplication.run(Application.class, args);
        }
    }
    ```
    
18. **`@EnableAutoConfiguration`**
    
    - Enables Spring Boot's auto-configuration feature.
    - Automatically configures beans based on the dependencies and configuration.
19. **`@ConditionalOnProperty`**
    
    - Enables or disables a bean based on the presence of a specific property in the configuration.
    
    ```java
    @ConditionalOnProperty(name = "feature.enabled", havingValue = "true")
    public class FeatureService {
    }
    ```
    

---

### **Transaction Management Annotations**

20. **`@Transactional`**
    
    - Declares a method or class to be transactional.
    - Ensures that the operations within the transaction are committed or rolled back as a unit.
    
    ```java
    @Transactional
    public void performTransaction() {
        // transactional code
    }
    ```
    

---

### **Testing Annotations**

21. **`@SpringBootTest`**
    
    - Loads the full application context for integration testing.
    
    ```java
    @SpringBootTest
    public class ApplicationTests {
    }
    ```
    
22. **`@MockBean`**
    
    - Adds a mock bean to the Spring application context for testing.
    
    ```java
    @MockBean
    private MyService myService;
    ```
    
23. **`@TestConfiguration`**
    
    - Used to define additional configuration classes for testing purposes.



# SpringBoot



### **1. Core Annotations**

- **`@SpringBootApplication`**
    
    - Combines three annotations: `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.
    - Marks the main class of a Spring Boot application and triggers auto-configuration and component scanning.
    
    ```java
    @SpringBootApplication
    public class MyApplication {
        public static void main(String[] args) {
            SpringApplication.run(MyApplication.class, args);
        }
    }
    ```
    
- **`@Configuration`**
    
    - Indicates a class is a source of bean definitions.
    
    ```java
    @Configuration
    public class AppConfig {
        @Bean
        public MyBean myBean() {
            return new MyBean();
        }
    }
    ```
    
- **`@Bean`**
    
    - Declares a Spring-managed bean within a `@Configuration` class.
- **`@ComponentScan`**
    
    - Configures the package to scan for components (e.g., `@Component`, `@Service`, `@Controller`).
    - Included automatically in `@SpringBootApplication`.

---

### **2. Dependency Injection**

- **`@Component`**
    
    - Marks a class as a Spring-managed bean, detected during component scanning.
- **`@Service`**
    
    - Specialized version of `@Component` for service-layer components.
- **`@Repository`**
    
    - Specialized version of `@Component` for data-access-layer components. It also enables exception translation for persistence-related exceptions.
- **`@Autowired`**
    
    - Injects dependencies automatically by type.
    
    ```java
    @Autowired
    private MyService myService;
    ```
    
- **`@Qualifier`**
    
    - Used with `@Autowired` to resolve conflicts when multiple beans of the same type exist.
    
    ```java
    @Autowired
    @Qualifier("specificBean")
    private MyService myService;
    ```
    

---

### **3. Web Annotations**

- **`@RestController`**
    
    - Combines `@Controller` and `@ResponseBody`, simplifying REST API creation.
    
    ```java
    @RestController
    public class MyController {
        @GetMapping("/hello")
        public String sayHello() {
            return "Hello, World!";
        }
    }
    ```
    
- **`@RequestMapping`**
    
    - Maps HTTP requests to handler methods or classes.
- **`@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`, `@PatchMapping`**
    
    - Shortcuts for `@RequestMapping` with specific HTTP methods (GET, POST, etc.).
- **`@PathVariable`**
    
    - Binds a URI template variable to a method parameter.
    
    ```java
    @GetMapping("/user/{id}")
    public User getUser(@PathVariable int id) {
        return userService.getUserById(id);
    }
    ```
    
- **`@RequestParam`**
    
    - Binds a query parameter to a method parameter.
    
    ```java
    @GetMapping("/search")
    public String search(@RequestParam String keyword) {
        return "Searching for: " + keyword;
    }
    ```
    
- **`@ResponseBody`**
    
    - Indicates the return value of a method is serialized to the HTTP response body.
- **`@CrossOrigin`**
    
    - Enables Cross-Origin Resource Sharing (CORS) for a method, class, or globally.

---

### **4. Persistence and Database Annotations**

- **`@Entity`**
    
    - Marks a class as a JPA entity.
- **`@Table`**
    
    - Specifies the database table for an entity.
- **`@Id`**
    
    - Marks a field as the primary key.
- **`@GeneratedValue`**
    
    - Specifies how the primary key is generated (e.g., auto-increment).
- **`@Column`**
    
    - Configures a specific column in the database.
- **`@Repository`**
    
    - Marks a class as a DAO (Data Access Object) and provides exception translation.
- **`@Transactional`**
    
    - Declares transactional behavior on a method or class.

---

### **5. Validation and Constraints**

- **`@Valid`**
    
    - Used to validate request objects using validation constraints (e.g., `@NotNull`, `@Size`).
- **`@NotNull`, `@Size`, `@Min`, `@Max`, `@Pattern`**
    
    - Built-in validation annotations from the `javax.validation.constraints` package.
- **`@RequestBody`**
    
    - Binds the body of an HTTP request to a method parameter.
    
    ```java
    @PostMapping("/user")
    public void createUser(@RequestBody @Valid User user) {
        userService.save(user);
    }
    ```
    

---

### **6. Conditional Configuration**

- **`@ConditionalOnProperty`**
    
    - Loads a bean or configuration only if a specific property is present or has a certain value.
    
    ```java
    @ConditionalOnProperty(name = "feature.enabled", havingValue = "true")
    public MyFeature myFeature() {
        return new MyFeature();
    }
    ```
    
- **`@ConditionalOnClass`**
    
    - Loads a bean only if a specific class is present on the classpath.
- **`@ConditionalOnMissingBean`**
    
    - Loads a bean only if no other bean of the same type exists.

---

### **7. Testing Annotations**

- **`@SpringBootTest`**
    
    - Configures an integration test with a full application context.
- **`@MockBean`**
    
    - Creates and injects a mock bean for testing.
    
    ```java
    @MockBean
    private MyService myService;
    ```
    
- **`@WebMvcTest`**
    
    - Loads only the web layer of the application for testing controllers.
- **`@DataJpaTest`**
    
    - Loads only JPA components for testing the repository layer.

---

### **8. Miscellaneous**

- **`@Value`**
    
    - Injects values from properties files or environment variables.
    
    ```java
    @Value("${app.name}")
    private String appName;
    ```
    
- **`@Profile`**
    
    - Activates a bean or configuration only for specific profiles (e.g., `dev`, `prod`).
- **`@EnableScheduling`**
    
    - Enables scheduling of tasks using `@Scheduled`.
- **`@EnableAsync`**
    
    - Enables asynchronous method execution using `@Async`.

---

These annotations simplify and streamline Spring Boot development, making it easier to build robust, scalable applications. Let me know if you'd like examples or further explanation for any specific annotation!