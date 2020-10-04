package pl.wspa.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.wspa.library.entity.Book;
import pl.wspa.library.entity.Borrowing;
import pl.wspa.library.entity.User;
import pl.wspa.library.repository.BookRepository;
import pl.wspa.library.repository.BorrowRepository;
import pl.wspa.library.repository.UserRepository;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Optional;

@Controller
@SessionAttributes("user")
public class BorrowBookController {
    @Autowired
    private User user;
    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private BorrowRepository borrowRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/borrow/{bookId}")
    public String borrow(@PathVariable int bookId, Model model){
        Optional<Book> book = bookRepository.findById(bookId);
        Borrowing b = new Borrowing();
        b.setBook(book.get());
        b.setCustomer(user.getCustomer());
        model.addAttribute("borrowing", b);

        return "borrow";
    }

    @PostMapping("/borrow/{bookId}")
    public String borrow(@Valid Borrowing borrowing, @PathVariable int bookId, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()) {
            return "borrow";
        } else {
            Optional<Book> book = bookRepository.findById(bookId);
            borrowing.setBook(book.get());
            borrowing.setCustomer(user.getCustomer());
            borrowRepository.save(borrowing);
        }

        return "redirect:/myBooks";
    }

    @RequestMapping("/myBooks")
    public String myBooks(Model model){
        model.addAttribute("borrowings", this.borrowRepository.findByCustomerId(user.getCustomer().getId()));

        return "mybooks";
    }

    @RequestMapping("/borrowings")
    public String borrowings(Model model){
        Collection<Borrowing> borrowings = borrowRepository.findAllActive();
        model.addAttribute("borrowings", borrowings);

        return "borrowings";
    }

    @RequestMapping("/return/{borrowingId}")
    public String returnBook(@PathVariable int borrowingId, Model model){
        borrowRepository.returnBook(borrowingId, LocalDate.now());

        return "redirect:/borrowings";
    }
}