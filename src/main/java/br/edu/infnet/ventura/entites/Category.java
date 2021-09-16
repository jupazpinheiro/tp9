
package br.edu.infnet.ventura.entites;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String category;
    private String categoryDescription;
    
    @OneToMany(mappedBy="category")
    private List<Product> products = new ArrayList<>();

    public Category() {
    }

    public Category(int categoryId, String category, String categoryDescription) {
        this.categoryId = categoryId;
        this.category = category;
        this.categoryDescription = categoryDescription;
        
    
    }

    public Category(String category, String categoryDescription, List<Product> products) {
        this.category = category;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }

    
    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", category=" + category + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
    
}
