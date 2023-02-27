package demoapp02.demo;

import org.springframework.web.bind.annotation.*;

@RestController
public class Controller {

    String msg = "%s님 반갑습니다.";

    @GetMapping("/")
    String Start() {
        return "호출성공, 반갑습니다.";
    }

    @GetMapping("/users/{userName}")
    String HelloUser(@PathVariable(name = "userName") String userName) {
        return String.format(msg, userName);
    }

}
