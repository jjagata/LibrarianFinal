package pl.wspa.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wspa.library.entity.Address;
import pl.wspa.library.entity.Customer;
import pl.wspa.library.entity.User;
import pl.wspa.library.model.Register;
import pl.wspa.library.repository.CustomerRepository;

import javax.validation.Valid;

@Controller
public class RegisterController {
    @Autowired
    private CustomerRepository customerRepository;

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("register", new Register());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid Register register, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()) {
            return "register";
        } else {
            User u = new User(register.getLogin(), register.getPassword());
            Address a  = new Address(register.getCity(), register.getZipCode(), register.getStreet(), register.getNumber());
            Customer c = new Customer(register.getFirstName(), register.getLastName(), a, u);
            customerRepository.save(c);
        }
        return "redirect:/login";
    }
}
