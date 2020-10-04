package pl.wspa.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.wspa.library.entity.Author;

public interface AuthorRepository extends JpaRepository<Author, Integer> {
}
