/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author MohamedSayed
 */
@Entity
@Table(name = "ANSWERS")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        discriminatorType = DiscriminatorType.STRING,
        name = "Answer_Type")
public abstract class Answer implements Serializable {

    @Id
    @SequenceGenerator(name = "Answerid", sequenceName = "Answer_Answerid", initialValue = 100, allocationSize = 1)
    @GeneratedValue(generator = "Answerid", strategy = GenerationType.SEQUENCE)
    @Column(name = "Answer_ID", length = 10, nullable = false, unique = true, updatable = false)

    protected Integer answerID;
    @Column(name = "answer", length = 100, nullable = false, unique = true)
    protected String answer;
    @ManyToOne
    @JoinColumn(name = "Question_ID",
            referencedColumnName = "Question_ID")
    private Question question;
    
    @ManyToOne
    @JoinColumn(name = "OutCome_ID",
            referencedColumnName = "OutCome_ID")
    private OutCome outCome;
    
    @Enumerated(EnumType.STRING)
    private OutComeType outComeType;

    public Answer() {
    }

    public Answer(String answer) {
        this.answer = answer;
    }

    public Answer(String answer, Question question, OutCome outCome, OutComeType outComeType) {
        this.answer = answer;
        this.question = question;
        this.outCome = outCome;
        this.outComeType = outComeType;
    }

    public Integer getAnswerID() {
        return answerID;
    }

    public void setAnswerID(Integer answerID) {
        this.answerID = answerID;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 19 * hash + (this.answerID != null ? this.answerID.hashCode() : 0);
        hash = 19 * hash + (this.answer != null ? this.answer.hashCode() : 0);
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
        final Answer other = (Answer) obj;
        if ((this.answer == null) ? (other.answer != null) : !this.answer.equals(other.answer)) {
            return false;
        }
        if (this.answerID != other.answerID && (this.answerID == null || !this.answerID.equals(other.answerID))) {
            return false;
        }
        return true;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public OutComeType getOutComeType() {
        return outComeType;
    }

    public void setOutComeType(OutComeType outComeType) {
        this.outComeType = outComeType;
    }

    public OutCome getOutCome() {
        return outCome;
    }

    public void setOutCome(OutCome outCome) {
        this.outCome = outCome;
    }

    @Override
    public String toString() {
        return "Answer{" + "answerID=" + answerID + ", answer=" + answer + '}';
    }

}
