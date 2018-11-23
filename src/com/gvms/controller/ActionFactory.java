package com.gvms.controller;


//package 모든 액션 받음
import com.gvms.action.*;
import com.gvms.action.Mis.MisDeleteAction;
import com.gvms.action.Mis.MisListFormAction;
import com.gvms.action.Mis.MisModifyFormAction;
import com.gvms.action.Mis.MisReadAction;
import com.gvms.action.Mis.MisReadFormAction;
import com.gvms.action.Mis.MisRegistAction;
import com.gvms.action.Mis.MisRegistFormAction;
import com.gvms.action.Score.ScoreDeleteAction;
import com.gvms.action.Score.ScoreListFormAction;
import com.gvms.action.Score.ScoreListRegFormAction;
import com.gvms.action.Score.ScoreModEssSubSearchAction;
import com.gvms.action.Score.ScoreModOptSearchFormAction;
import com.gvms.action.Score.ScoreModOptSubSearchAction;
import com.gvms.action.Score.ScoreModifyAction;
import com.gvms.action.Score.ScoreModifyFormAction;
import com.gvms.action.Score.ScoreModEssSearchFormAction;
import com.gvms.action.Score.ScoreReadFormAction;
import com.gvms.action.Score.ScoreRegSubjectSearchAction;
import com.gvms.action.Score.ScoreRegistAction;
import com.gvms.action.Score.ScoreRegistSearchFormAction;
import com.gvms.action.Score.ScoreRegisterFormAction;
import com.gvms.action.Student.StudentDeleteAction;
import com.gvms.action.Student.StudentListFormAction;
import com.gvms.action.Student.StudentModifyFormAction;
import com.gvms.action.Student.StudentRegisterAction;
import com.gvms.action.Student.StudentRegisterFormAction;
import com.gvms.action.Subject.SubjectDeleteAction;
import com.gvms.action.Subject.SubjectListformAction;
import com.gvms.action.Subject.SubjectModifyAction;
import com.gvms.action.Subject.SubjectModifyFormAction;
import com.gvms.action.Subject.SubjectRegisterAction;


	
/**
 * request로 받아온 매개변수의 command의 값으로 각 기능을 수행할 액션을 분기하는 클래스 <br>
 * action추가 시 최대한 기능별로 정렬될 수 있도록 한다. 수정이 잦은 class이므로 주의하여 편집!!
 * 
 * @author cho
 *
 */
public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;

		System.out.println("ActionFactory : " + command);

		if (command.equals("main")) {
			
			action = new MainAction();
		
			}	
			else if(command.equals("scoreListForm")) {
			
			action = new ScoreListFormAction();
			
			} 
			else if(command.equals("scoreListRegForm")) {
				
			action = new ScoreListRegFormAction();
			
			}
			else if(command.equals("scoreRegisterForm")) {
				
			action = new ScoreRegisterFormAction();
			
			} 
			else if(command.equals("scoreRegistSearchForm")) {
				
			action = new ScoreRegistSearchFormAction();
				
			}
			else if(command.equals("scoreRegSubSearch")) {
				
			action = new ScoreRegSubjectSearchAction();
				
			}
			else if(command.equals("scoreRegist")) {
				
			action = new ScoreRegistAction();
				
			}
			else if(command.equals("scoreReadForm")) {
				
			action = new ScoreReadFormAction();
				
			}
			else if(command.equals("scoreModifyForm")) {
				
			action = new ScoreModifyFormAction();
				
			}
			else if(command.equals("scoreModEssSearchForm")) {
				
			action = new ScoreModEssSearchFormAction();
				
			}
			else if(command.equals("scoreModOptSearchForm")) {
				
			action = new ScoreModOptSearchFormAction();
				
			}
			else if(command.equals("scoreModEssSubSearch")) {
				
			action = new ScoreModEssSubSearchAction();
				
			}
			else if(command.equals("scoreModOptSubSearch")) {
				
			action = new ScoreModOptSubSearchAction();
				
			}
			else if(command.equals("scoreModify")) {
				
			action = new ScoreModifyAction();
			}
			else if(command.equals("scoreDelete")) {
				
			action = new ScoreDeleteAction();
				
			}
			// author osj
			else if(command.equals("mis_list_form")) {
				action = new MisListFormAction();
			}
			else if(command.equals("mis_regist_form")) {
				action = new MisRegistFormAction();
			}
			else if(command.equals("mis_regist")) {
				action = new MisRegistAction();
			}
			else if(command.equals("mis_read_form")) {
				action = new MisReadFormAction();
			}
			else if(command.equals("mis_read")) {
				action = new MisReadAction();
			}
			else if(command.equals("mis_delete")) {
				action = new MisDeleteAction();
			}
			else if(command.equals("mis_modify_form")) {
				action = new MisModifyFormAction();
			}
			
		
			// author pjh
			else if (command.equals("studentListForm")) {

				action = new StudentListFormAction();
			} 
			else if (command.equals("stud_reg_form")) {

				action = new StudentRegisterFormAction();
			} 
			else if (command.equals("stud_register")) {

				action = new StudentRegisterAction();		
			}	
			
			else if (command.equals("stud_modi_form")) {

				action = new StudentModifyFormAction();
			} 
			else if (command.equals("stud_delete")) {
				
				action = new StudentDeleteAction();
			}
		    
			else if (command.equals("subList")) {
				action = new SubjectListformAction();
			}
			else if (command.equals("subRegister")) {
				action = new SubjectRegisterAction();
			}
			else if (command.equals("subModify")) {
				action = new SubjectModifyAction();
			}
			else if (command.equals("subModifyForm")) {
				action = new SubjectModifyFormAction();
			}
			else if (command.equals("subDelete")) {
				action = new SubjectDeleteAction();
			}

		return action;
	}

}