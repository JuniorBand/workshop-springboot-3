package com.educandoweb.course.repositories;

import com.educandoweb.course.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    // This interface will automatically provide CRUD operations for Category entities
    // No additional methods are needed unless custom queries are required
}
