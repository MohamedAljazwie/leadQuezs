/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Map;
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
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

/**
 *
 * @author MohamedSayed
 */
@Entity
@Table(name = "QUESTIONS",
      uniqueConstraints = 
              @UniqueConstraint(columnNames ={"Question_name","QUIEZ_ID"},name = "Question_NAME_QUIEZID_UK" ))
@FilterDef(name = "questioforquiez", parameters = {
    @ParamDef(name = "quiezID", type = "java.math.BigDecimal")})
 @Filter(name = "questioforquiez", condition = "QUIEZ_ID = :quiezID")
public class Question implements Serializable {

    @Id
    @SequenceGenerator(name = "Questionid", sequenceName = "Question_Questionid", initialValue = 100, allocationSize = 1)
    @GeneratedValue(generator = "Questionid", strategy = GenerationType.SEQUENCE)
    @Column(name = "Question_ID", length = 10, nullable = false, unique = true, updatable = false)

    private Integer questionID;
    @Column(name = "Question_name", length = 100, nullable = false, unique = true)
    private String name;

    @ManyToOne
    @JoinColumn(name = "QUIEZ_ID",
            referencedColumnName = "QUIEZ_ID")
    private Quiez quiez;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,
            mappedBy = "question")
    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE,
        org.hibernate.annotations.CascadeType.DELETE_ORPHAN})
    private Set<Answer> answers = new HashSet<Answer>();

    @Transient
    private Answer answer;
    @Transient
    private Map<String ,Answer>  mapAnswer=new HashMap<>();
    public Question() {
    }

    public Question(Integer questionID, String name) {
        this.questionID = questionID;
        this.name = name;
    }

    public Integer getQuestionID() {
        return questionID;
    }

    public void setQuestionID(Integer questionID) {
        this.questionID = questionID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
        answers.add(this.answer);
        mapAnswer.put(answer.getAnswer(), answer);
    }

    public Map<String, Answer> getMapAnswer() {
        return mapAnswer;
    }

    public void setMapAnswer(Map<String, Answer> mapAnswer) {
        this.mapAnswer = mapAnswer;
    }

    
    public Quiez getQuiez() {
        return quiez;
    }

    public void setQuiez(Quiez quiez) {
        this.quiez = quiez;
    }

   

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + (this.questionID != null ? this.questionID.hashCode() : 0);
        hash = 29 * hash + (this.name != null ? this.name.hashCode() : 0);
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
        final Question other = (Question) obj;
        if ((this.name == null) ? (other.name != null) : !this.name.equals(other.name)) {
            return false;
        }
        if (this.questionID != other.questionID && (this.questionID == null || !this.questionID.equals(other.questionID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Question{" + "questionID=" + questionID + ", name=" + name + '}';
    }

}
