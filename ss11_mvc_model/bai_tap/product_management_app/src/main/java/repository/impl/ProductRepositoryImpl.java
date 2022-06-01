package repository.impl;

import model.Product;
import repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

//private int id;
//private String nameProduct;
//private double priceProduct;
//private String description;
//private String producer;

public class ProductRepositoryImpl implements ProductRepository {
    public static List<Product> productList = new ArrayList<>();
    static {
    productList.add(new Product(1,"iphone3",1200.0,"new","apple"));
    productList.add(new Product(2,"iphone4",1500.0,"secondhand","apple"));
    productList.add(new Product(3,"iphone5",1700.0,"new","apple"));
    productList.add(new Product(4,"iphone6",1900.0,"secondhand","apple"));
    }


    @Override
    public List<Product> findAll() {
        return productList;
    }
}
