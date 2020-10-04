package pl.wspa.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wspa.library.entity.User;

@Controller
public class HomeController {
    @Autowired
    private User user;

    @RequestMapping("/")
    public String home(){
        return "home";
    }
}
