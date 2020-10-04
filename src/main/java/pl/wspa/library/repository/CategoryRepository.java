package pl.wspa.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.wspa.library.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
}
