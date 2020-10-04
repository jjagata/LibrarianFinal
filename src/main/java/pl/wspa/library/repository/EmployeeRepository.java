package pl.wspa.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.wspa.library.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
}
