package com.gvms.controller;


//package 모든 액션 받음
import com.gvms.action.*;


	
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
		
		}	else if(command.equals("scoreListForm")) {
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
			else if(command.equals("scoreModifySearchForm")) {
				action = new ScoreModifySearchFormAction();
			}
			else if(command.equals("scoreModSubSearch")) {
				action = new ScoreModSubjectSearchAction();
			}
			else if(command.equals("scoreModify")) {
				action = new ScoreModifyAction();
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

				action = new StudentModifyAction();
			} 
		    
			else if (command.equals("subList")) {
				action = new SubListformAction();
			}
			else if (command.equals("subRegister")) {
				action = new SubRegister();
			}
			else if (command.equals("subModify")) {
				action = new SubModifyAction();
			}
			else if (command.equals("subModifyForm")) {
				action = new SubModifyFormAction();
			}


		return action;
	}

}