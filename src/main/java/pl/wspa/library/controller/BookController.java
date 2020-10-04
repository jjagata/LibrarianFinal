package pl.wspa.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wspa.library.entity.User;
import pl.wspa.library.model.BookSearch;
import pl.wspa.library.repository.BookRepository;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private User user;

    @GetMapping("/list")
    public String getList(Model model) {
        model.addAttribute("search", new BookSearch());
        model.addAttribute("books", this.bookRepository.findAll());

        return "books";
    }

    @PostMapping("/list")
    public String findBooks(BookSearch search, Model model) {
        model.addAttribute("search", search);
        model.addAttribute("books", this.bookRepository.findBySearchString(search.getSearchString()));

        return "books";
    }

}
