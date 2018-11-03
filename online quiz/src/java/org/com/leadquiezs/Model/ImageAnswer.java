/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 *
 * @author MohamedSayed
 */
@Entity
@DiscriminatorValue("imageAnswer")
public class ImageAnswer extends Answer{
  @Column(name = "image", length = 20,nullable = true)
    private String image;
    public ImageAnswer() {
    }

    public ImageAnswer(String answer) {
        super(answer);
    }

    public ImageAnswer(String image, String answer) {
        super(answer);
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ImageAnswer{ answerID=" + answerID + ", answer=" + answer + "image=" + image + '}';
    }
    
}
