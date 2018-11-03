/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 *
 * @author MohamedSayed
 */
@Entity
@DiscriminatorValue("textAnswer")
public class TextAnswer extends Answer{

    public TextAnswer() {
    }
  
    public TextAnswer( String answer) {
        super( answer);
    }

    public TextAnswer(String answer, Question question, OutCome outCome, OutComeType outComeType) {
        super(answer, question, outCome, outComeType);
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }

   
  
}
