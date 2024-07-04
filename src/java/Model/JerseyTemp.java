/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * @author Desktop
 */
public class JerseyTemp {
    private int id;
    private String image;
    private String name;
    private double price;
    private int quantity;
    private boolean selected;
    private String size;

    public JerseyTemp(
        int id,
        String image,
        String name,
        double price,
        int quantity,
        boolean selected,
        String size
    ) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.selected = selected;
        this.size = size;
    }

    public JerseyTemp(
        int id,
        String image,
        String name,
        double price,
        int quantity,
        String size
    ) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.size = size;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "JerseyTemp{" + "id=" + id + ", image=" + image + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", selected=" + selected + ", size=" + size + '}';
    }


}
