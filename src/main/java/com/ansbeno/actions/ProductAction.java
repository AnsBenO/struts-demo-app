package com.ansbeno.actions;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.ansbeno.entities.Product;
import com.ansbeno.services.ProductService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@Namespace("/products")
public class ProductAction extends ActionSupport {

      private final transient ProductService productService;

      private String categoryName;
      private String keyword;
      private Long productId;
      private Product product;
      private List<Product> products;

      public ProductAction() {
            this.productService = new ProductService();
      }

      @Override
      @Action(value = "", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/products/products.jsp")
      })
      @SkipValidation
      public String execute() {
            this.products = this.productService.findAll();
            return SUCCESS;
      }

      @Action(value = "findByCategory", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/products/products-list.jsp")
      })
      @SkipValidation
      public String findByCategory() {
            if (categoryName != null) {
                  this.products = this.productService.findByCategory(this.categoryName);
            } else {
                  this.products = this.productService.findAll();
            }
            return SUCCESS;
      }

      @Action(value = "search", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/products/products-list.jsp")
      })
      @SkipValidation
      public String search() {
            if (keyword != null) {
                  this.products = this.productService.findByKeyword(this.keyword);
            } else {
                  this.products = this.productService.findAll();
            }
            return SUCCESS;
      }

      @Action(value = "save", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/products/products-list.jsp"),
                  @Result(name = "input", location = "/WEB-INF/pages/products/products-list.jsp")
      })
      @Validations(requiredFields = {
                  @RequiredFieldValidator(fieldName = "product.name", message = "You must enter a value for field name."),
                  @RequiredFieldValidator(fieldName = "product.price", message = "You must enter a value for field price."),
                  @RequiredFieldValidator(fieldName = "product.quantity", message = "You must enter a value for field quantity.")
      })
      public String create() {
            productService.save(product);
            products = productService.findAll();
            return SUCCESS;
      }

      @Action(value = "delete", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/products/products-list.jsp")
      })
      @SkipValidation
      public String delete() {
            productService.deleteById(productId);
            products = productService.findAll();
            return SUCCESS;
      }

      public String getCategoryName() {
            return categoryName;
      }

      public void setCategoryName(String categoryName) {
            this.categoryName = categoryName;
      }

      public String getKeyword() {
            return keyword;
      }

      public void setKeyword(String keyword) {
            this.keyword = keyword;
      }

      public Long getProductId() {
            return productId;
      }

      public void setProductId(Long productId) {
            this.productId = productId;
      }

      public Product getProduct() {
            return product;
      }

      public void setProduct(Product product) {
            this.product = product;
      }

      public List<Product> getProducts() {
            return products;
      }
}
