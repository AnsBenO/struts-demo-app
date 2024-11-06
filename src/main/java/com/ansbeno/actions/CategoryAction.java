package com.ansbeno.actions;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.ansbeno.entities.Category;
import com.ansbeno.services.CategoryService;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/categories")
public class CategoryAction extends ActionSupport {

      private final transient CategoryService categoryService;
      private List<Category> categories;
      private String keyword;
      private Long categoryId;
      private Category category;

      public CategoryAction() {
            this.categoryService = new CategoryService();
      }

      @Action(value = "", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/categories/categories.jsp")
      })
      @Override
      public String execute() {
            categories = categoryService.findAll();
            return SUCCESS;
      }

      @Action(value = "search", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/categories/categories.jsp")
      })
      public String findByKeyword() {
            categories = categoryService.findByKeyword(keyword);
            return SUCCESS;
      }

      @Action(value = "delete", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/categories/categories.jsp")
      })
      public String delete() {
            categoryService.deleteById(categoryId);
            categories = categoryService.findAll();
            return SUCCESS;
      }

      @Action(value = "save", results = {
                  @Result(name = "success", location = "/WEB-INF/pages/categories/categories.jsp")
      })
      public String save() {
            categoryService.save(category);
            categories = categoryService.findAll();
            return SUCCESS;
      }

      public List<Category> getCategories() {
            return categories;
      }

      public void setKeyword(String keyword) {
            this.keyword = keyword;
      }

      public void setCategoryId(Long categoryId) {
            this.categoryId = categoryId;
      }

      public Category getCategory() {
            return category;
      }

      public void setCategory(Category category) {
            this.category = category;
      }
}
