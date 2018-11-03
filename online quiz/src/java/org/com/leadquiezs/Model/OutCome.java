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
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

/**
 *
 * @author MohamedSayed
 */
@Entity
@Table(name = "OUTCOMES")
@FilterDef(name = "outcomesforquiez", parameters = {
    @ParamDef(name = "quiezID", type = "java.math.BigDecimal")})
 @Filter(name = "outcomesforquiez", condition = "QUIEZ_ID = :quiezID")
public class OutCome implements Serializable {

    @Id
    @SequenceGenerator(name = "OutComeid", sequenceName = "OutCome_OutComeid", initialValue = 100, allocationSize = 1)
    @GeneratedValue(generator = "OutComeid", strategy = GenerationType.SEQUENCE)
    @Column(name = "OutCome_ID", length = 10, nullable = false, unique = true, updatable = false)
    private Integer outComeID;
    @Column(name = "OutCome_title", length = 100, nullable = false, unique = true)
    private String title;
    @Column(name = "OutCome_descrpion", length = 4000, nullable = true)
    private String description;

    @OneToMany(fetch = FetchType.LAZY,
            mappedBy = "outCome")
    private Set<Answer> answers = new LinkedHashSet<Answer>();

    @ManyToOne
    @JoinColumn(name = "QUIEZ_ID",
            referencedColumnName = "QUIEZ_ID")
    private Quiez quiez;

    public OutCome() {
    }

    public OutCome(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public Integer getOutComeID() {
        return outComeID;
    }

    public void setOutComeID(Integer outComeID) {
        this.outComeID = outComeID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }

    public Quiez getQuiez() {
        return quiez;
    }

    public void setQuiez(Quiez quiez) {
        this.quiez = quiez;
    }

    @Override
    public String toString() {
        return "OutCome{" + "outComeID=" + outComeID + ", title=" + title + ", description=" + description + '}';
    }

}
