package com.codegym.service;

import com.codegym.model.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "iPhone 15", 999.0, "Điện thoại mới nhất của Apple", "Apple"));
        products.put(2, new Product(2, "Galaxy S23", 899.0, "Điện thoại cao cấp của Samsung", "Samsung"));
        products.put(3, new Product(3, "Pixel 8", 799.0, "Điện thoại với camera chụp ảnh đẹp", "Google"));
        products.put(4, new Product(4, "MacBook Pro M3", 1999.0, "Laptop làm việc mạnh mẽ", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return products.values().stream()
                .filter(p -> p.getName().toLowerCase().contains(name.toLowerCase()))
                .collect(Collectors.toList());
    }
}

