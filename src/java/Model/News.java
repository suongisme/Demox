/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @author Desktop
 */
public class News implements Serializable {

    private int newsId;
    private String newsTitle;
    private String description;
    private String newsImageDescription;
    private String newsContent;
    private transient LocalDate datePosted;


    @SerializedName("datePosted")
    private String datePostedString;

    public News() {
    }

    public News(
        int newsId,
        String newsTitle,
        String newsImageDescription,
        String newsContent
    ) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.newsImageDescription = newsImageDescription;
        this.newsContent = newsContent;
        this.datePosted = LocalDate.now();
    }

    public News(
        String newsTitle,
        String newsImageDescription,
        String newsContent
    ) {
        this.newsTitle = newsTitle;
        this.newsImageDescription = newsImageDescription;
        this.newsContent = newsContent;
        this.datePosted = LocalDate.now();
    }

    public News(
        String newsTitle,
        String description,
        String newsImageDescription,
        String newsContent,
        LocalDate datePosted
    ) {
        this.newsTitle = newsTitle;
        this.description = description;
        this.newsImageDescription = newsImageDescription;
        this.newsContent = newsContent;
        this.datePosted = datePosted;
    }

    public News(
        int newsId,
        String newsTitle,
        String description,
        String newsImageDescription,
        String newsContent,
        LocalDate datePosted
    ) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.description = description;
        this.newsImageDescription = newsImageDescription;
        this.newsContent = newsContent;
        this.datePosted = datePosted;
    }


    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsImageDescription() {
        return newsImageDescription;
    }

    public void setNewsImageDescription(String newsImageDescription) {
        this.newsImageDescription = newsImageDescription;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public LocalDate getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(LocalDate datePosted) {
        this.datePosted = datePosted;
        this.datePostedString = datePosted.toString();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", newsTitle=" + newsTitle + ", description=" + description + ", newsImageDescription=" + newsImageDescription + ", newsContent=" + newsContent + ", datePosted=" + datePosted + '}';
    }


}
