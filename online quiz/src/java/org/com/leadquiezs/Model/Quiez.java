/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;

/**
 *
 * @author MohamedSayed
 */
@Entity
@Table(name = "QUIEZS")
public class Quiez implements Serializable, Comparable<Quiez> {

    @Id
    @SequenceGenerator(name = "Quiezid", sequenceName = "Quiez_Quiezid", initialValue = 100, allocationSize = 1)
    @GeneratedValue(generator = "Quiezid", strategy = GenerationType.SEQUENCE)
    @Column(name = "QUIEZ_ID", length = 10, nullable = false, unique = true, updatable = false)

    private Integer quiezID;
    @Column(name = "Quiez_name", length = 100, nullable = false, unique = true)
    private String name;
    @Column(name = "Quiez_title", length = 400, nullable = false, unique = true)
    private String title;
    @Column(name = "Quiez_descrpion", length = 4000, nullable = true)
    private String descrpion;
    @Column(name = "Quiez_label", length = 100, nullable = false)
    private String label;
    @Column(name = "Quiez_image", length = 100, nullable = false)
    private String image;
    
    @OneToMany(cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "quiez"
            )
    private Set<Question> question = new LinkedHashSet<Question>();

    public Quiez() {
    }

    public Quiez(String name, String title, String label, String image) {
        this.name = name;
        this.title = title;
        this.label = label;
        this.image = image;
    }

    public Integer getQuiezID() {
        return quiezID;
    }

    public void setQuiezID(Integer quiezID) {
        this.quiezID = quiezID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescrpion() {
        return descrpion;
    }

    public void setDescrpion(String descrpion) {
        this.descrpion = descrpion;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set<Question> getQuestion() {
        return question;
    }

    public void setQuestion(Set<Question> question) {
        this.question = question;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + (this.quiezID != null ? this.quiezID.hashCode() : 0);
        hash = 67 * hash + (this.name != null ? this.name.hashCode() : 0);
        hash = 67 * hash + (this.title != null ? this.title.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Quiez other = (Quiez) obj;
        if ((this.name == null) ? (other.name != null) : !this.name.equals(other.name)) {
            return false;
        }
        if ((this.title == null) ? (other.title != null) : !this.title.equals(other.title)) {
            return false;
        }
        if (this.quiezID != other.quiezID && (this.quiezID == null || !this.quiezID.equals(other.quiezID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Quiez{" + "quiezID=" + quiezID + ", name=" + name + ", title=" + title + ", descrpion=" + descrpion + ", label=" + label + ", image=" + image + '}';
    }

    @Override
    public int compareTo(Quiez o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
